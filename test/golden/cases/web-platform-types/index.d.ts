// Web-platform classes (#24): lib.dom types (Request, Response, URL, AbortSignal, …)
// map to abstract types in the dependency-free `WebTypes.res` sink — zero-cost, honest,
// chainable — instead of flagged `string` placeholders. Also locks:
//   - `T | Promise<T>` (sync-or-async return, hono's fetch shape) -> `promise<t>`
//   - bare `Promise<T>` -> `promise<t>`
export declare class Client {
  fetch(req: Request, signal?: AbortSignal): Response | Promise<Response>;
  readonly baseUrl: URL;
  send(body: Blob): Promise<Response>;
}
