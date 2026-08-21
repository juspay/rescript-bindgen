type genericRecordDedupRouterBuildConfigV1v9of = {
  a: bool,
  b: bool,
}
type rec routerUmte8 = {
  use: unit => routerUmte8,
  add: unit => routerUmte8,
  build: unit => genericRecordDedupRouterBuildConfigV1v9of,
}
type genericRecordDedupRouterBuildConfigV1lc66 = {
  a: bool,
}
type rec routerTl4kb = {
  use: unit => routerTl4kb,
  add: unit => routerUmte8,
  build: unit => genericRecordDedupRouterBuildConfigV1lc66,
}
type genericRecordDedupRouterBuildConfigBjl1k = {
  b: bool,
  a: bool,
}
type rec routerV1dqw1 = {
  use: unit => routerV1dqw1,
  add: unit => routerV1dqw1,
  build: unit => genericRecordDedupRouterBuildConfigBjl1k,
}
type genericRecordDedupRouterBuildConfigXtid4 = {
  b: bool,
}
type rec routerV1tmiw = {
  use: unit => routerV1dqw1,
  add: unit => routerV1tmiw,
  build: unit => genericRecordDedupRouterBuildConfigXtid4,
}
type routerUs8op = {
  use: unit => routerTl4kb,
  add: unit => routerV1tmiw,
  build: unit => JSON.t,
}
