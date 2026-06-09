type router3 = {
  use: unit => string,
  add: unit => string,
  build: unit => string,
}
type buildConfig = {
  a: bool,
}
type rec router2 = {
  use: unit => router2,
  add: unit => router3,
  build: unit => buildConfig,
}
type buildConfig2 = {
  b: bool,
}
type rec router4 = {
  use: unit => router3,
  add: unit => router4,
  build: unit => buildConfig2,
}
type router = {
  use: unit => router2,
  add: unit => router4,
  build: unit => string,
}
