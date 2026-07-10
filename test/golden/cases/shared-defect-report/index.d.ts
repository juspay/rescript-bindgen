// Deep report imperfection (#133): a defect INSIDE a shared type must surface on the
// component that carries it. Previously the typeRef was opaque to the report walk — the
// shared record's field was correctly 🛑-flagged inline, but the component read ✅ usable
// (blend's themeContextType.foundationTokens shape). Now the registry-aware walk descends
// into shared record fields and the component lands in the 🛑 bucket with a row naming the
// owning type + field (`config.theme`).
import { ThemeType } from './tokens'
type JsxElement = { __brand: 'element' }

// the broken field lives INSIDE a named interface -> a registered SHARED record
export interface Config { title: string; theme: ThemeType }
export declare const Panel: (props: { config?: Config; label?: string }) => JsxElement

// control: a RECURSIVE shared record with clean fields must not loop the walk, and its
// consumer stays ✅ usable
export interface TreeNode { label: string; children?: TreeNode[] }
export declare const Tree: (props: { root?: TreeNode }) => JsxElement
