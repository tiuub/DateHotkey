# DateHotkey

[![GitHub all releases](https://img.shields.io/github/downloads/tiuub/DateHotkey/total)](https://github.com/tiuub/DateHotkey/releases/latest)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/tiuub/DateHotkey)](https://github.com/tiuub/DateHotkey/releases/latest)

This Autohotkey Script should solve daily problems whith calculating dates. With this script you can easily retrieve the date of current, passed or comming days.

*Read this in other languages: [English](README.md), [German](README.de.md)*

## Installation

There are two ways to use the script.
1. You download the EN_DateHotkey.exe file from [releases](https://github.com/tiuub/DateHotkey/releases/latest) and run it.
2. You download the EN_DateHotkey.ahk und Hotstring.ahk and run it with a installed version of [AutoHotkey](https://www.autohotkey.com).


## Commands
> German commands [here](README.de.md)

|Command|Description|
|-------|-----------|
|#today[modifier]|Date of current day|
|#yesterday[modifier]|Date of yesterday|
|#tomorrow[modifier]|Date of tomorrow|
|#mo(nday)[modifier]|Date of monday this week|
|#tu(esday)[modifier]|Date of tuesday this week|
|#we(dnesday)[modifier]|Date of wednesday this week|
|#th(ursday)[modifier]|Date of thursday this week|
|#fr(iday)[modifier]|Date of friday this week|
|#sa(turday)[modifier]|Date of saturday this week|
|#su(nday)[modifier]|Date of sunday this week|
|#c(alendar)w(eek)[modifier]|Current calendar week|

You can type them in every text boxes, wherever you want.

## Modifier
With the modifier, you can modifie the resulting date. There you can add or substract a specific amount of days, weeks, months or years. That means, if you need the date of monday next week or the calendar week in twenty days, you can easily get them by setting the modifier.

Modifier Regex:
```sh
([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+
```

### Rules for Modifier
If you want to use the Modifier, you have to follow these rules
 - It must contain a valid number
 - After the number, you have to declare if you want days, weeks, months or years
   - If empty/not declared, default: weeks
     ```sh
     #monday4 - Monday in 4 weeks
     ```
 - Order isn't important, you can write as you want
   ```sh
   #sunday3y2d2w2d - Monday in 4 days, 2 weeks and 3 years
   ```

## Examples
|Example|Description|
|-------|-----------|
|#yesterday|Date of yesterday|
|#saturday|Date of saturday this week|
|#we|Date of wednesday this week|
|#today+4days-6weeks|Todays Date, plus 4 days and minus 6 weeks|
|#monday+4days-2days|Date of monday in the week, comming in 2 days|
|#tu4days+6w|Date of tuesday in the week, comming in 4 days and 6 weeks|
|#yesterday4d6w3months|Yesterdays Date, plus 4 days, 6 weeks and 3 months|
|#tomorrow2y4d6w|Tomorrows Date, plus 2 years, 4 days and 6 weeks|
|#su500d40y2m|Date of sunday in the week, comming in 500 days, 40 years and 2 months|
|#calendarweek4w|Calendar week in 4 weeks|
|#cw3d2w4m|Calendar week in 3 days, 2 weeks and 4 months|


## License
[![GitHub](https://img.shields.io/github/license/tiuub/DateHotkey)]()