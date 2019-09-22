# DateHotkey

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

This Autohotkey Script should solve daily problems whith calculating dates. With this script you can easily retrieve the date of current, passed or comming days.


### Installation

There are two ways to use the script.
1. You download the .exe file inside the Executable folder and run it.
2. You download the .ahk file and run it with a installed version of [AutoHotkey](https://www.autohotkey.com).


### Commands
You can type them in every text boxes, wherever you want.
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


### Modifier
With the modifier, you can modifie the resulting date. That means, you can get instead friday this week, the friday in two weeks.

Modifier Regex
```sh
([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+
```

If you want to use the Modifier, you have to follow these rules
 - It must contain a valid number
 - After the number, you have to declare if days, weeks, months or years
   - If empty/not declared, default: weeks
 - Order isn't important, you can write as you want

### Examples
|Example|Description|
|-------|-----------|
|#today+4days-6weeks|Todays Date, plus 4 days and minus 6 weeks|
|#mo+4days-2days|Monday of the week, commin in 2 days|
|#tu4days+6w|Tuesday of the week, commin in 4 days and 6 weeks|
|#yesterday4d6w3months|Yesterdays Date, plus 4 days, 6 weeks and 3 months|
|#tomorrow2y4d6w|Tomorrows Date, plus 2 years, 4 days and 6 weeks|
|#su500d40y2m|Sunday of the week, commin in 500 days, 40 years and 2 months|


License
----

MIT
