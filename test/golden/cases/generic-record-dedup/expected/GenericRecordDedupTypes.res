type rec routerPqjgj = {
  use: unit => routerPqjgj,
  add: unit => routerPqjgj,
  build: unit => string,  // ⚪ loose — was `{ a: true; } & { b: true; }`
}
type genericRecordDedupRouterBuildConfigV14p3v = {
  a: bool,
}
type rec routerRs9d5 = {
  use: unit => routerRs9d5,
  add: unit => routerPqjgj,
  build: unit => genericRecordDedupRouterBuildConfigV14p3v,
}
type rec routerV1mdf8 = {
  use: unit => routerV1mdf8,
  add: unit => routerV1mdf8,
  build: unit => string,  // ⚪ loose — was `{ b: true; } & { a: true; }`
}
type genericRecordDedupRouterBuildConfigV1fa6k = {
  b: bool,
}
type rec routerUix75 = {
  use: unit => routerV1mdf8,
  add: unit => routerUix75,
  build: unit => genericRecordDedupRouterBuildConfigV1fa6k,
}
type routerV89air = {
  use: unit => routerRs9d5,
  add: unit => routerUix75,
  build: unit => JSON.t,
}
