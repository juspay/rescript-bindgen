// #115 pkg — two components declare a same-NAMED type (`SelectMenuGroup`) with DIFFERENT shapes.
// Their bases both lower to `selectMenuGroup`, so they collide; their homes (`SelectTypes` vs
// `SingleSelectTypes`) DIFFER, so home-stem disambiguation should apply. The old global doubling
// guard hashed BOTH (`selectMenuGroupRduxi`) merely because the base starts with `select` (the
// Select stem). The per-entry own-stem check now yields SEMANTIC, hash-free, stable names:
//   - Select's        -> `selectMenuGroup`            (its own stem prefixes the base → bare)
//   - SingleSelect's   -> `selectMenuGroupSingleSelect` (base doesn't start with `singleSelect`)
export { Select } from './components/Select/Select'
export { SingleSelect } from './components/SingleSelect/SingleSelect'
