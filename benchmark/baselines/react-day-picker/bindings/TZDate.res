type t = InstanceTypes.tzDate
@new @module("react-day-picker") external make: unit => t = "TZDate"
@send external withTimeZone: (t, ~timeZone: string) => t = "withTimeZone"
@get external timeZone: t => string = "timeZone"
@module("react-day-picker") @scope("TZDate") external tz: (~tz: string) => t = "tz"
