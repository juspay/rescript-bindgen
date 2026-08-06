type props = {
  root?: UnionArmRecordFieldsTypes.treeNode,
  nodes?: array<UnionArmRecordFieldsTypes.treeNode>,
}

@module("demo")
external make: React.component<props> = "Tree"
