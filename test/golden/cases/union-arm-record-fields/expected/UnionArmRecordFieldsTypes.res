// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with Bezier({…}); `transitionType` is auto-filled by @tag.
@tag("transitionType")
type rowAnimationConfig =
  | @as("bezier") Bezier({enterDuration: float, enterOffset: float, duration: float, bezier: (float, float, float, float)})
  | @as("spring") Spring({enterDuration: float, enterOffset: float, stiffness: float, damping: float, mass: float})
type tableSettings = {
  rowAnimation?: rowAnimationConfig,
  sticky?: bool,
}
// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with Text({…}); `kind` is auto-filled by @tag.
@tag("kind")
type columnConfig =
  | @as("text") Text({field: string, maxChars: float, stagger: float})
  | @as("number") Number({field: string, precision: float, stagger: float})
  | @as("date") Date({field: string, format: string})
// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with Single({…}); `mode` is auto-filled by @tag.
@tag("mode")
type selectionConfig =
  | @as("single") Single({autoFocus?: bool, selected?: string, onSelect?: string => unit})
  | @as("multi") Multi({autoFocus?: bool, selected?: array<string>, onSelect?: array<string> => unit})
  | @as("none") None({autoFocus?: bool})
// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with Label({…}); `type` is auto-filled by @tag.
@tag("type")
type flatRow =
  | @as("label") Label({id: string, label: string})
  | @as("separator") Separator({id: string})
  | @as("item") Item({id: string, itemIndex: float})
// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with Leaf({…}); `kind` is auto-filled by @tag.
@tag("kind")
type rec treeNode =
  | @as("leaf") Leaf({value: string})
  | @as("branch") Branch({children: array<treeNode>, label: string})
