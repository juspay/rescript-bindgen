type props = {
  column?: UnionSharedArmGettersTypes.UnionSharedArmGettersColumn.t,  // ⓘ was `TextColumn | NumberColumn | DateColumn` — opaque; build with UnionSharedArmGettersColumn.fromTextColumn / UnionSharedArmGettersColumn.fromNumberColumn / UnionSharedArmGettersColumn.fromDateColumn
}

@module("demo")
external make: React.component<props> = "Table"
