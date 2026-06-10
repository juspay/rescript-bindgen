type t = InstanceTypes.calendarMonth
@new @module("react-day-picker") external make: (~month: Date.t, ~weeks: array<InstanceTypes.calendarWeek>) => t = "CalendarMonth"
@get external date: t => Date.t = "date"
@get external weeks: t => array<InstanceTypes.calendarWeek> = "weeks"
