type t = InstanceTypes.registry
@new @module("demo") external make: unit => t = "Registry"
@get external entries: t => array<ItemsDictArrayTypes.itemsDictArrayEntriesConfig> = "entries"
