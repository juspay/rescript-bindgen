type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenColor,
  ...SharedBaseRecordsTypes.styledBlockProps,
  variant?: SharedBaseRecordsTypes.sharedBaseRecordsBaseSkeletonPropsVariant,
  loading?: bool,
  @as("as") as_?: string,
  pulse?: bool,
}

@module("demo")
external make: React.component<props> = "SkeletonBadge"
