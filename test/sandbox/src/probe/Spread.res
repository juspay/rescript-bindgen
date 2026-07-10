// probe 1: multiple record spreads
type a = { x?: string, y?: int }
type b = { p?: bool, q?: float }
type c = { ...a, ...b, own?: string }
let v: c = { x: "1", p: true, own: "z" }

// probe 2: recursive record with optional self-field (StyledBlockProps shape)
type rec styled = { color?: string, _hover?: styled, _focus?: styled }
type useStyled = { ...styled, extra?: int }
let s: useStyled = { color: "red", _hover: { color: "blue" }, extra: 1 }
