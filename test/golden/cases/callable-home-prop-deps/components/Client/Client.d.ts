import { Config } from '../Config/Config'

// axios-instance shape whose CALL side is dep-free — every dep comes from the carried props.
export interface Client {
  (url: string): Promise<string>
  defaults: Config
  create(config: Config): Client
}
export declare const client: Client
