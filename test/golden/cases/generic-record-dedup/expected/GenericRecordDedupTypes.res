type rec routerN1ffa = {
  use: unit => routerN1ffa,
  add: unit => routerN1ffa,
  build: unit => string,  // ⚪ loose — was `{ a: true; } & { b: true; }`
}
type genericRecordDedupRouterBuildConfigV1lc66 = {
  a: bool,
}
type rec routerOckfe = {
  use: unit => routerOckfe,
  add: unit => routerN1ffa,
  build: unit => genericRecordDedupRouterBuildConfigV1lc66,
}
type rec routerN1ffa2 = {
  use: unit => routerN1ffa2,
  add: unit => routerN1ffa2,
  build: unit => string,  // ⚪ loose — was `{ b: true; } & { a: true; }`
}
type genericRecordDedupRouterBuildConfigXtid4 = {
  b: bool,
}
type rec routerV3f469 = {
  use: unit => routerN1ffa2,
  add: unit => routerV3f469,
  build: unit => genericRecordDedupRouterBuildConfigXtid4,
}
type routerV1g9se = {
  use: unit => routerOckfe,
  add: unit => routerV3f469,
  build: unit => JSON.t,
}
