// CommonJS `module.exports = clsx` where the merged namespace re-exposes the SAME function under
// its own name (the real clsx package shape: `module.exports = e; module.exports.clsx = e`).
// The named member's `= "clsx"` works under both CommonJS and ESM targets, while the synthetic
// `export=` root would bind `= "default"` — undefined under a CommonJS target. The named member
// must therefore win the name collision (#102).
declare namespace clsx {
	type ClassValue = string | number | null | boolean | undefined
	function clsx(...inputs: ClassValue[]): string
}

declare function clsx(...inputs: clsx.ClassValue[]): string

export = clsx
