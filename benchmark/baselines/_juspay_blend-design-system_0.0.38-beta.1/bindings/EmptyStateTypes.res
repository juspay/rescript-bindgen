type emptyStateEmptyStateSizeTokensLayoutConfig = {
  minHeight: string,
  maxWidth: string,
  padding: string,
  gap: string,
  contentGap: string,
  actionGap: string,
}
type emptyStateEmptyStateSizeTokensTitleConfig = {
  fontSize: string,
  lineHeight: string,
  fontWeight: string,
  color: string,
}
type emptyStateEmptyStateSizeTokensDescriptionConfig = {
  fontSize: string,
  lineHeight: string,
  color: string,
}
type emptyStateSizeTokens = {
  layout: emptyStateEmptyStateSizeTokensLayoutConfig,
  title: emptyStateEmptyStateSizeTokensTitleConfig,
  description: emptyStateEmptyStateSizeTokensDescriptionConfig,
}
type emptyStateTokensType = {
  sm: emptyStateSizeTokens,
  md: emptyStateSizeTokens,
  lg: emptyStateSizeTokens,
}
type responsiveEmptyStateTokens = {
  sm: emptyStateTokensType,
  lg: emptyStateTokensType,
}
