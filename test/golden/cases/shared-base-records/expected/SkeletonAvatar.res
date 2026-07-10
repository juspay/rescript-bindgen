type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenColor,
  ...SharedBaseRecordsTypes.baseSkeletonProps,
  ...SharedBaseRecordsTypes.styledBlockProps,
  @as("as") as_?: string,
  size?: SharedBaseRecordsTypes.sharedBaseRecordsSize,
}

@module("demo")
external make: React.component<props> = "SkeletonAvatar"
