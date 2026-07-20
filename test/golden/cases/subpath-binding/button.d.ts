// #147: the ./button subpath RE-EXPORTS the main entry's Button (same symbol). It must bind ONCE,
// keeping @module("demo") (main `.` processed first) — a re-export is not a distinct binding.
export { Button } from "./index"
