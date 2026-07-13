type rec routerGruyd = {
  use: unit => routerGruyd,
  add: unit => routerGruyd,
  build: unit => string,  // ⚪ loose — was `{ a: true; } & { b: true; }`
}
type genericRecordDedupRouterBuildConfigV1lc66 = {
  a: bool,
}
type rec routerC41qi = {
  use: unit => routerC41qi,
  add: unit => routerGruyd,
  build: unit => genericRecordDedupRouterBuildConfigV1lc66,
}
type rec routerV13x65 = {
  use: unit => routerV13x65,
  add: unit => routerV13x65,
  build: unit => string,  // ⚪ loose — was `{ b: true; } & { a: true; }`
}
type genericRecordDedupRouterBuildConfigXtid4 = {
  b: bool,
}
type rec routerV1ywh8 = {
  use: unit => routerV13x65,
  add: unit => routerV1ywh8,
  build: unit => genericRecordDedupRouterBuildConfigXtid4,
}
type routerV1bnjp = {
  use: unit => routerC41qi,
  add: unit => routerV1ywh8,
  build: unit => JSON.t,
}
