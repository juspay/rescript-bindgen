type props = {
  node?: DupLabelsTypes.treeNode,
  leaf?: DupLabelsTypes.treeLeaf,
}

@module("demo")
external make: React.component<props> = "DupLabels"
