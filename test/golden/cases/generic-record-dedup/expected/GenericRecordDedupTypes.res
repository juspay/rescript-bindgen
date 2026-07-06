type rec router3 = {
  use: unit => router3,
  add: unit => router3,
  build: unit => string,  // ⚪ loose — was `{ a: true; } & { b: true; }`
}
type genericRecordDedupRouterBuildConfig = {
  a: bool,
}
type rec router2 = {
  use: unit => router2,
  add: unit => router3,
  build: unit => genericRecordDedupRouterBuildConfig,
}
type rec router5 = {
  use: unit => router5,
  add: unit => router5,
  build: unit => string,  // ⚪ loose — was `{ b: true; } & { a: true; }`
}
type genericRecordDedupRouterBuildConfig2 = {
  b: bool,
}
type rec router4 = {
  use: unit => router5,
  add: unit => router4,
  build: unit => genericRecordDedupRouterBuildConfig2,
}
type router = {
  use: unit => router2,
  add: unit => router4,
  build: unit => JSON.t,
}
