@module("@juspay/blend-design-system") @react.component
external make: (
  ~chartContainerRef: React.ref<Nullable.t<Dom.element>>,
  ~keys: array<string>,
  ~colors: array<AvatarGroupTypes.textConfig7>,
  ~handleLegendClick: string => unit,
  ~handleLegendEnter: string => unit,
  ~handleLegendLeave: unit => unit,
  ~selectedKeys: array<string>,
  ~setSelectedKeys: array<string> => unit,
  ~hoveredKey: string,
  ~activeKeys: array<string>,
  ~stacked: bool=?,
  ~isSmallScreen: bool=?,
  ~stackedLegendsData: array<ChartsTypes.stackedLegendsDataPoint>=?,
  ~legends: array<ChartsTypes.legendsConfig>=?,
) => React.element = "ChartLegends"
