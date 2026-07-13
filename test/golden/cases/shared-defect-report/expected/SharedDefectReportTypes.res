type config = {
  title: string,
  theme: string,  // 🛑 BROKEN — declared type does not resolve (broken import in the package's .d.ts)
}
type rec treeNode = {
  label: string,
  children?: array<treeNode>,
}
