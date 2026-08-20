type props = {
  tokens?: CsstypeDeeppartialWideningTypes.csstypeDeeppartialWideningTokensConfig,
  direct?: string,
  mixedRecord?: CsstypeDeeppartialWideningTypes.CsstypeDeeppartialWideningMixedRecord.t,  // ⓘ was `Color | CustomArm` — opaque; build with CsstypeDeeppartialWideningMixedRecord.fromTag / CsstypeDeeppartialWideningMixedRecord.fromCsstypeDeeppartialWideningMixedRecordConfig / CsstypeDeeppartialWideningMixedRecord.fromCustomArm
  mixedDict?: string,  // ⚪ loose — was `Color | { [breakpoint: string]: Color; }`
  mixedArray?: CsstypeDeeppartialWideningTypes.CsstypeDeeppartialWideningMixedArray.t,  // ⓘ was `Color | Color[]` — opaque; build with CsstypeDeeppartialWideningMixedArray.fromTag / CsstypeDeeppartialWideningMixedArray.fromCsstypeDeeppartialWideningMixedRecordConfig / CsstypeDeeppartialWideningMixedArray.fromColors
}

@module("demo")
external make: React.component<props> = "Themed"
