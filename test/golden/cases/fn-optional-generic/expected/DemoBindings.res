@module("demo") external greet: (string, ~greeting: string=?, unit) => string = "greet"
@module("demo") external makeId: (~size: int=?, unit) => string = "makeId"
@module("demo") external pluck: (array<'a>, int) => 'a = "pluck"
