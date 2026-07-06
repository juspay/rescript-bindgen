@module("@juspay/blend-design-system") @react.component
external make: (
  ~containerStyle: JsxDOM.style,
  ~keyContainerStyle: JsxDOM.style,
  ~valueContainerStyle: JsxDOM.style,
  ~keySlotStyle: JsxDOM.style,
  ~keyContent: React.element,
  ~valueContent: React.element,
  ~keySlot: React.element=?,
  ~valueLeftSlot: React.element=?,
  ~valueRightSlot: React.element=?,
  ~dataKeyValuePair: string=?,
  ~ariaLabel: string=?,
  ~keyDataElement: string=?,
  ~keyDataId: string=?,
  ~valueDataElement: string=?,
  ~valueDataId: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "KeyValuePairLayout"
