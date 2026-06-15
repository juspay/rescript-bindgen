type itemsConfig<'a> = {
  label: React.element,
  value: 'a,
}
@unboxed type valueOrItemsConfigArray<'a> = Dict(Dict.t<React.element>) | ItemsConfigArr(array<itemsConfig<'a>>)
