type itemsConfig<'a> = {
  label: React.element,
  value: 'a,
}
type entriesConfig = {
  label: React.element,
  value: string,
}
@unboxed type valueOrItemsConfigArray<'a> = Dict(Dict.t<React.element>) | ItemsConfigArr(array<itemsConfig<'a>>)
