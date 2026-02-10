
import { instantiate } from './best_hello_world_kmp-composeApp.uninstantiated.mjs';
import "./custom-formatters.js"

const exports = (await instantiate({
})).exports;

export const {
memory,
_initialize
} = exports


