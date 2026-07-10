// The callable's prop-side dependency — declared in ITS OWN component file so it homes to
// ConfigTypes, away from the callable's declaring file (ClientTypes).
export interface Config {
  url: string
  retries?: number
}
