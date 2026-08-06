type props = {
  a?: UnionArmRecordFieldsTypes.nodeA,
  b?: UnionArmRecordFieldsTypes.nodeB,
}

@module("demo")
external make: React.component<props> = "Graph"
