type props = {
  status: CommonTypes.statusCode,
  contentStatus?: CommonTypes.contentfulStatusCode,
}

@module("demo")
external make: React.component<props> = "ResponseView"
