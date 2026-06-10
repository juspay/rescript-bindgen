@module("@juspay/blend-design-system") @react.component
external make: (
  ~keyString: string,
  ~size: KeyValuePairTypes.keyValuePairSize=?,
  ~value: string=?,
  ~keySlot: React.element=?,
  ~valueLeftSlot: React.element=?,
  ~valueRightSlot: React.element=?,
  ~keyValuePairState: KeyValuePairTypes.keyValuePairStateType=?,
  ~maxWidth: string=?,
  ~textOverflow: KeyValuePairTypes.textOverflowMode=?,
  ~maxLines: float=?,
  ~showTooltipOnTruncate: bool=?,
) => React.element = "KeyValuePair"
