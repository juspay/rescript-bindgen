// Discriminated-union props: `Base & (A | B | C)` distributes to `(Base&A)|(Base&B)|(Base&C)`,
// and TS's `getPropertiesOfType` returns only the props common to ALL arms (here `maxWidth` +
// the shared `variant` discriminant) — silently dropping every variant-specific prop, which made
// blend's `Card` unable to render anything. The binding now keeps each arm's props too, with the
// arm-specific ones OPTIONAL (they apply only to their variant; ReScript can't express the
// discriminated dependency, so flatten-optional is the faithful, compilable model). (#63 C2)
type JsxElement = { __brand: 'element' }

type DefaultCard = { variant?: 'default'; title?: string; content?: string }
type AlignedCard = { variant: 'aligned'; alignment: 'left' | 'right'; centerAlign?: boolean }
type CustomCard = { variant: 'custom'; children: string }

type CardProps = { maxWidth?: string } & (DefaultCard | AlignedCard | CustomCard)

export declare const Card: (props: CardProps) => JsxElement
