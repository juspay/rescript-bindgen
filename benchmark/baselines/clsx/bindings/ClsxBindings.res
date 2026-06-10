// ⚠️ REVIEW: `clsx` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@module("clsx") external clsx: (~inputs: array<string>=?, unit) => string = "clsx"
