type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenColor,
  ...SharedBaseRecordsTypes.baseSkeletonProps,
  ...SharedBaseRecordsTypes.styledBlockProps,
  @as("as") as_?: string,
  padding2?: string,
}

@module("demo")
external make: React.component<props> = "SkeletonCard"
