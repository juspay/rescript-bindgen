// JS built-in containers map to ReScript stdlib types, NOT to a `{...JsxDOM.domProps}` record.
// A `Map`/`Set`'s methods are all lib-inherited, which used to misfire the domProps-spread
// heuristic and silently emit a nonsensical record (a flag-don't-fake violation). Now:
//   Map<K,V>      -> Map.t<k, v>
//   Set<T>        -> Set.t<t>
//   ReadonlyMap   -> Map.t  (same runtime shape)
// Detection is on the RESOLVED symbol, so a first-party alias to a Map is caught too.
type HandlerMap = Map<string, (n: number) => void>

interface Store {
  counts: Map<string, number>
  tags: Set<string>
  frozen: ReadonlyMap<string, string>
  handlers: HandlerMap
}

export declare function makeStore(initial: Store): Store
