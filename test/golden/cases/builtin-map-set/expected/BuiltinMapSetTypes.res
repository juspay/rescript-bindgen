type store = {
  counts: Map.t<string, float>,
  tags: Set.t<string>,
  frozen: Map.t<string, string>,
  handlers: Map.t<string, float => unit>,
}
