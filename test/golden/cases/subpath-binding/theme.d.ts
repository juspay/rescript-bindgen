// Shared by BOTH the main entry and the ./styles subpath — must be emitted ONCE in the shared
// registry (deduped by type.id across subpaths), referenced from both binding files.
export interface Theme {
  primary: string
  spacing: number
}
