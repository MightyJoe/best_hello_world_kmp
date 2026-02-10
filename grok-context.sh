# grok-context.sh
#!/usr/bin/env bash
echo "=== GROK CONTEXT ===" && \
echo "Project: $(basename $(pwd))" && \
echo && \
(for f in build.gradle.kts settings.gradle.kts gradle/libs.versions.toml shared/build.gradle.kts shared/src/commonMain/kotlin/{App,Database}.kt; do [ -f "$f" ] && echo "--- $f ---" && cat "$f" && echo; done) && \
(find shared/src/commonMain/sqldb/sqldelight -name "*.sq" 2>/dev/null | while read f; do echo "--- $f ---"; cat "$f"; echo; done || echo "No .sq files found")