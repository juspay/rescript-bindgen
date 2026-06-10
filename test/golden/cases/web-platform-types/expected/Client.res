type t = InstanceTypes.client
@new @module("demo") external make: unit => t = "Client"
@send external fetch: (t, ~req: WebTypes.request, ~signal: WebTypes.abortSignal=?, unit) => promise<WebTypes.response> = "fetch"
@send external send: (t, ~body: WebTypes.blob) => promise<WebTypes.response> = "send"
@get external baseUrl: t => WebTypes.url = "baseUrl"
