type itemsDictArrayItemsConfig<'a> = {
  label: React.element,
  value: 'a,
}
type itemsDictArrayEntriesConfig = {
  label: React.element,
  value: string,  // 🛑 BROKEN — contains `any`
}
@unboxed type valueOrItemsDictArrayItemsConfigArray<'a> = Dict(Dict.t<React.element>) | ItemsDictArrayItemsConfigArr(array<itemsDictArrayItemsConfig<'a>>)
