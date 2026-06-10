type t = InstanceTypes.calendarWeek
@new @module("react-day-picker") external make: (~weekNumber: float, ~days: array<InstanceTypes.calendarDay>) => t = "CalendarWeek"
@get external weekNumber: t => float = "weekNumber"
@get external days: t => array<InstanceTypes.calendarDay> = "days"
