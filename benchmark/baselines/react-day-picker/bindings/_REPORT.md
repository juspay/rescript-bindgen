# Binding report — `react-day-picker@10.0.1`

**26** components · ✅ **19** usable · 🔍 **7** need review · 🛑 **0** broken

**35** function binding(s) → `ReactDayPickerBindings.res`.

**5** class module(s) → `@new`/`@send`/`@get` bindings.

**108** shared types deduplicated into **6** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✓ present → used |

## 🔧 Function bindings

Standalone function exports, emitted as positional `@module external` bindings in `ReactDayPickerBindings.res`.

- `defaultLocale`
- `defaultDateLib`
- `formatCaption`
- `formatDay`
- `formatMonthDropdown`
- `formatWeekdayName`
- `formatWeekNumber`
- `formatWeekNumberHeader`
- `formatYearDropdown`
- `getDefaultClassNames`
- `labelDayButton`
- `labelGrid`
- `labelGridcell`
- `labelMonthDropdown`
- `labelNav`
- `labelNext`
- `labelPrevious`
- `labelWeekday`
- `labelWeekNumber`
- `labelWeekNumberHeader`
- `labelYearDropdown`
- `useDayPicker`
- `dayPickerContext`
- `addToRange`
- `dateMatchModifiers`
- `rangeContainsDayOfWeek`
- `rangeContainsModifiers`
- `rangeIncludesDate`
- `rangeOverlaps`
- `isDateInterval`
- `isDateRange`
- `isDateAfterType`
- `isDateBeforeType`
- `isDayOfWeekType`
- `isDatesArray`

## 🏛 Class modules

Each class binds to its own `<Name>.res` module with an abstract `type t` (`@new` constructor, `@send` methods, `@get` properties).

| Class | Constructor | Methods | Properties |
|-------|-------------|---------|------------|
| `TZDate` | ✓ | 1 | 1 |
| `CalendarDay` | ✓ | 1 | 7 |
| `CalendarMonth` | ✓ | 0 | 2 |
| `CalendarWeek` | ✓ | 0 | 2 |
| `DateLib` | ✓ | 39 | 2 |

## ✅ Usable

These compile and every prop is bound type-safely — use them directly.
_(n loose)_ = some props widened to `string`; they still work, just loosely typed.

- CaptionLabel
- Chevron
- Dropdown
- DropdownNav
- Footer
- MonthGrid
- Months
- MonthsDropdown
- Nav
- NextMonthButton
- Option
- PreviousMonthButton
- Root
- Select
- Weekday
- Weekdays
- WeekNumberHeader
- Weeks
- YearsDropdown

## ⚪ Loosely typed (widened to `string`)

These resolved to a real but complex type and were widened to `string` (they compile and work). Grouped by type so you can review each pattern once — confirm `string` is acceptable, or it may deserve a tighter mapping.

_(none)_

## 🔍 Needs review

A multi-type prop couldn't be auto-discriminated at runtime (e.g. two object shapes), so an `@unboxed` variant won't work and we **refuse to use `%identity`/unsafe casts**. The prop is emitted as a `string` placeholder with an inline `// ⚠️ REVIEW` comment — bind it by hand or fix the type upstream.

### Day

| Prop | Real TypeScript |
|------|-----------------|
| `day` | `day: CalendarDay;` — binds, but references shared field(s) `dateLib2.getDigitMap` (`any`), `dateLib2.replaceDigits` (`any`), `dateLibOptions.in` (`review`), `interval.start` (`review`) emitted as `string` |

### DayButton

| Prop | Real TypeScript |
|------|-----------------|
| `day` | `day: CalendarDay;` — binds, but references shared field(s) `dateLib2.getDigitMap` (`any`), `dateLib2.replaceDigits` (`any`), `dateLibOptions.in` (`review`), `interval.start` (`review`) emitted as `string` |

### DayPicker

| Prop | Real TypeScript |
|------|-----------------|
| `components` | `components?: Partial<CustomComponents>;` — binds, but references shared field(s) `dateLib2.getDigitMap` (`any`), `dateLib2.replaceDigits` (`any`), `dateLibOptions.in` (`review`), `interval.start` (`review`) emitted as `string` |
| `labels` | `labels?: Partial<Labels>;` — binds, but references shared field(s) `dateLibOptions.in` (`review`), `dateLib2.getDigitMap` (`any`), `dateLib2.replaceDigits` (`any`), `interval.start` (`review`) emitted as `string` |
| `formatters` | `formatters?: Partial<Formatters>;` — binds, but references shared field(s) `dateLibOptions.in` (`review`), `dateLib2.getDigitMap` (`any`), `dateLib2.replaceDigits` (`any`), `interval.start` (`review`) emitted as `string` |
| `locale` | `locale?: Partial<DayPickerLocale> \| undefined;` — binds, but references shared field(s) `classesLocaleConfig.formatRelative` (`unknown`), `localize.preprocessor` (`unknown`), `dateLibOptions.in` (`review`), `dayPickerLocale.formatRelative` (`unknown`) emitted as `string` |
| `dateLib` | `dateLib?: Partial<typeof DateLib.prototype> \| undefined;` — binds, but references shared field(s) `dateLibOptions.in` (`review`), `interval.start` (`review`), `interval.end` (`review`), `endOfWeekOptions.in` (`review`) emitted as `string` |

### Month

| Prop | Real TypeScript |
|------|-----------------|
| `calendarMonth` | `calendarMonth: CalendarMonth;` — binds, but references shared field(s) `dateLib2.getDigitMap` (`any`), `dateLib2.replaceDigits` (`any`), `dateLibOptions.in` (`review`), `interval.start` (`review`) emitted as `string` |

### MonthCaption

| Prop | Real TypeScript |
|------|-----------------|
| `calendarMonth` | `calendarMonth: CalendarMonth;` — binds, but references shared field(s) `dateLib2.getDigitMap` (`any`), `dateLib2.replaceDigits` (`any`), `dateLibOptions.in` (`review`), `interval.start` (`review`) emitted as `string` |

### Week

| Prop | Real TypeScript |
|------|-----------------|
| `week` | `week: CalendarWeek;` — binds, but references shared field(s) `dateLib2.getDigitMap` (`any`), `dateLib2.replaceDigits` (`any`), `dateLibOptions.in` (`review`), `interval.start` (`review`) emitted as `string` |

### WeekNumber

| Prop | Real TypeScript |
|------|-----------------|
| `week` | `week: CalendarWeek;` — binds, but references shared field(s) `dateLib2.getDigitMap` (`any`), `dateLib2.replaceDigits` (`any`), `dateLibOptions.in` (`review`), `interval.start` (`review`) emitted as `string` |

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

