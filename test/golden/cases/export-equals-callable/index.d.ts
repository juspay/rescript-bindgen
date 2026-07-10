// CommonJS `module.exports = cx` shape: the assigned value is both callable and augmented with
// namespace properties. The root callable must bind alongside the namespace member (#102).
declare function cx(value: string): string
declare namespace cx {
  function bind(prefix: string): (value: string) => string
}
export = cx
