type props = {
  onlyContentType?: [#"Content-Type"],
}

@module("demo")
external make: React.component<props> = "setHeader"
