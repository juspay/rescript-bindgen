type props = {
  items: array<RecordHtmlCollisionTypes.itemData>,
}

@module("demo")
external make: React.component<props> = "List"
