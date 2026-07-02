// #96 — the stable-name guarantee (#90: identical type ⇒ identical name across versions) applies
// to EVERY naming site, not just anonymous records. Anonymous literal-union ENUMS (and unboxed /
// opaque-module names) were still based on the bare prop name and disambiguated by a global
// registration-order counter — DataTable's three distinct `color` literal sets emitted `color`,
// `color2`, `color3`, renumbering whenever anything upstream (or the generator itself) changed
// what registers first (blend-rescript#106).
//
// Now an anonymous union is anchored to its property path:
//   avatar.color  -> stableEnumNamesAvatarColorConfig's enum `stableEnumNamesAvatarColor`
//   tag.color     -> `stableEnumNamesTagColor`
//   badge.color   -> `stableEnumNamesBadgeColor`
// — three distinct, location-stable names; NO `color2`/`color3`. A NAMED alias (`TagSize`) keeps
// its own name (follow-the-library, #62). Identical literal sets still dedupe by type identity.
type JsxElement = { __brand: 'element' }

type TagSize = 'sm' | 'md' | 'lg'   // named alias -> `tagSize`, untouched

export declare const Board: (props: {
  avatar?: { color?: 'primary' | 'secondary'; label: string }
  tag?: { color?: 'error' | 'warning' | 'success'; size?: TagSize }
  badge?: { color?: 'neutral' | 'purple' | 'orange' | 'primary' }
}) => JsxElement
