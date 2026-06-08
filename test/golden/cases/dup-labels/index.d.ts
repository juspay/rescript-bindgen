// Two MUTUALLY-RECURSIVE records that share field labels (`id`, `label`). Because they
// reference each other they land in ONE `type rec … and …` group — which is exactly what
// triggers ReScript's warning 30 ("label defined in several types"), pervasive in generated
// graph-shaped types (e.g. Highcharts `tooltip`/`legend`/`point`/`series`). Independent
// records sharing labels do NOT warn — only same-rec-group members do. The generator prepends
// `@@warning("-30")` to such files; the duplication is intentional and always explicitly typed.
// (The compile runner asserts zero warnings.)
type JsxElement = { __brand: 'element' }

interface TreeNode { id: string; label: string; leaf?: TreeLeaf }
interface TreeLeaf { id: string; label: string; parent?: TreeNode }

export declare const DupLabels: (props: {
  node?: TreeNode  // -> `type rec treeNode = { id, label, leaf? } and treeLeaf = { id, label, parent? }`
  leaf?: TreeLeaf  //    both share `id`/`label` in one rec group -> warning 30 without the pragma
}) => JsxElement
