// CommonJS `module.exports = Counter` shape: resolving the external module symbol must recover the
// assigned class and route it through the normal @new/@send/@get class pipeline (#102).
declare class Counter {
  constructor(start: number)
  increment(by: number): Counter
  readonly value: number
}
export = Counter
