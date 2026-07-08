@unboxed type classesDayPickerLocaleLabelsLabelNav = Str(string) | Fn(unit => string)
@unboxed type classesDayPickerLocaleLabelsLabelPrevious = Str(string) | Fn(Date.t => string)
@unboxed type v0OrV1OrV1 = @as(0) N0 | @as(1) N1 | @as(-1) N_1
@unboxed type v0OrV1OrV2OrV3OrV4OrV5OrV6 = @as(0) N0 | @as(1) N1 | @as(2) N2 | @as(3) N3 | @as(4) N4 | @as(5) N5 | @as(6) N6
@unboxed type v1OrV4 = @as(1) N1 | @as(4) N4
@unboxed type v0OrV1 = @as(0) N0 | @as(1) N1
@unboxed type v1OrV2OrV3OrV4 = @as(1) N1 | @as(2) N2 | @as(3) N3 | @as(4) N4
@unboxed type v0OrV1OrV2OrV3OrV4OrV5OrV6OrV7OrV8OrV9OrV10OrV11 = @as(0) N0 | @as(1) N1 | @as(2) N2 | @as(3) N3 | @as(4) N4 | @as(5) N5 | @as(6) N6 | @as(7) N7 | @as(8) N8 | @as(9) N9 | @as(10) N10 | @as(11) N11
@unboxed type stringOrNumber = Str(string) | Num(float)
@unboxed type numberOrNumberArray = Num(float) | NumArr(array<float>)
