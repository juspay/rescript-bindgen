@module("demo") external greet: (string, ~greeting: string=?, unit) => string = "greet"
@module("demo") external makeId: (~size: float=?, unit) => string = "makeId"
@module("demo") external pluck: (array<'a>, int) => 'a = "pluck"
