type floatingEvents = {
  emit: string,  // ⚪ loose — was `<T extends string>(event: T, data?: any) => void`
  on: string,  // ⚪ loose — was `(event: string, handler: (data: any) => void) => void`
  off: string,  // ⚪ loose — was `(event: string, handler: (data: any) => void) => void`
}
type floatingNodeType = {
  id?: string,
  parentId: Nullable.t<string>,
  context?: string,  // ⚪ loose — was `FloatingContext`
}
