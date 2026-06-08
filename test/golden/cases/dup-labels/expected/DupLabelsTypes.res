@@warning("-30")

type rec treeLeaf = {
  id: string,
  label: string,
  parent?: treeNode,
}
and treeNode = {
  id: string,
  label: string,
  leaf?: treeLeaf,
}
