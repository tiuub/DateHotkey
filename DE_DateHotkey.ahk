#Include Hotstring.ahk

Hotstring("#heute(([\+\-0-9]+(t(age?)?|w(ochen?)?|m(onate?)?|j(ahre?)?)?)+)?`n", "today", 3)
Hotstring("#gestern(([\+\-0-9]+(t(age?)?|w(ochen?)?|m(onate?)?|j(ahre?)?)?)+)?`n", "yesterday", 3)
Hotstring("#morgen(([\+\-0-9]+(t(age?)?|w(ochen?)?|m(onate?)?|j(ahre?)?)?)+)?`n", "tomorrow", 3)
Hotstring("#mo(?:ntag)?(([\+\-0-9]+(t(age?)?|(w(ochen?)?)|m(onate?)?|j(ahre?)?)?)+)?`n", "monday", 3)
Hotstring("#di(?:enstag)?(([\+\-0-9]+(t(age?)?|(w(ochen?)?)|m(onate?)?|j(ahre?)?)?)+)?`n", "tuesday", 3)
Hotstring("#mi(?:ttwoch)?(([\+\-0-9]+(t(age?)?|(w(ochen?)?)|m(onate?)?|j(ahre?)?)?)+)?`n", "wednesday", 3)
Hotstring("#do(?:nnerstag)?(([\+\-0-9]+(t(age?)?|(w(ochen?)?)|m(onate?)?|j(ahre?)?)?)+)?`n", "thursday", 3)
Hotstring("#fr(?:eitag)?(([\+\-0-9]+(t(age?)?|(w(ochen?)?)|m(onate?)?|j(ahre?)?)?)+)?`n", "friday", 3)
Hotstring("#sa(?:mstag)?(([\+\-0-9]+(t(age?)?|(w(ochen?)?)|m(onate?)?|j(ahre?)?)?)+)?`n", "saturday", 3)
Hotstring("#so(?:nntag)?(([\+\-0-9]+(t(age?)?|(w(ochen?)?)|m(onate?)?|j(ahre?)?)?)+)?`n", "sunday", 3)
Hotstring("#k(?:alender)?w(?:oche)?(([\+\-0-9]+(t(age?)?|(w(ochen?)?)|m(onate?)?|j(ahre?)?)?)+)?`n", "calendarweek", 3)

return

today($) {
	SendInput % fMiddleware($)
}
yesterday($) {
    SendInput % fMiddleware($, -1) ; subtracts one day from the calculated date
}
tomorrow($) {
    SendInput % fMiddleware($, 1) ; adds one day to the calculated date
}

monday($) {
    SendInput % fWeekday($, 2) ; 2 stands for monday
}
tuesday($) {
    SendInput % fWeekday($, 3) ; 3 stands for tuesday
}
wednesday($) {
    SendInput % fWeekday($, 4) ; 4 stands for wednesday
}
thursday($) {
    SendInput % fWeekday($, 5) ; 5 stands for thursday
}
friday($) {
    SendInput % fWeekday($, 6) ; 6 stands for friday
}
saturday($) {
    SendInput % fWeekday($, 7) ; 7 stands for saturday
}
sunday($) {
    SendInput % fWeekday($, 1) ; 1 stands for sunday
}

calendarweek($) {
	SendInput % SubStr(fMiddleware($, 0, 0, 0, 0, "YWeek"), -1)
}

fDate(pDays:=0, pWeeks:=0, pMonths:=0, pYears:=0, form:="dd.MM.yyyy") {  ; Date Function (Sven Seebeck)
    pWeeks *= 7
	datumWert :=  A_Now
	year := SubStr(datumWert, 1, 4)
	month := Floor(SubStr(datumWert, 5, 2))
    day := Floor(SubStr(datumWert, 7, 2))
	If (pMonths) {
		year += Round((month + pMonths - 1) / 12 - 0.5)
		month := Mod(month + pMonths, 12)
		if (month=0) { 
			month := 12 
		}
        if(day > fDaysInMonth(year . SubStr("00" . month, -1))) {
            day := fDaysInMonth(year . SubStr("00" . month, -1))
        }
	}
	If (pYears) {
		year += pYears
	}
	datumWert := year . SubStr("00" . month, -1) . SubStr("00" . day, -1) . SubStr(datumWert, 9)
    datumWert += %pWeeks%, days
    datumWert += %pDays%, days
    FormatTime, datumString, %datumWert%, %form%  
    return %datumString% 
}

fMiddleware($, pDays:=0, pWeeks:=0, pMonths:=0, pYears:=0, form:="dd.MM.yyyy"){
	While (Pos := Ma.Pos() = "" ? 1 : Ma.Pos()) := RegExMatch($.Value(1), "O)(([\+\-0-9]+)((t(age?)?|w(ochen?)?|m(onate?)?|j(ahre?)?|$)))", Ma, Pos + StrLen(Ma.Value(1))) {
		If InStr(Ma.Value(3), "t")
			pDays += Ma.Value(2)
		If InStr(Ma.Value(3), "w") || Ma.Value(3) = ""
			pWeeks += Ma.Value(2)
		If InStr(Ma.Value(3), "m")
			pMonths += Ma.Value(2)
		If InStr(Ma.Value(3), "j")
			pYears += Ma.Value(2)
	}
			
	return % fDate(pDays, pWeeks, pMonths, pYears, form)
}

fWeekday($, pWeekday){
    m_date := fMiddleware($,0,0,0,0,"yyyyMMdd")
    FormatTime, weekday, % m_date, % "WDay"
    EnvAdd, m_date, % pWeekday - weekday, days
    FormatTime, output, % m_date, % "dd.MM.yyyy" 
    return output
}

fDaysInMonth(date) {
    FormatTime, year,  % date, % "yyyy"
    FormatTime, month, % date, % "MM"
    month += 1                 ; next month
    if (month > 12)
        year += 1, month := 1  ; if next month new year, next year and reset month
    new_date := year . SubStr("00" . month, -1) ; 1 to 01
    new_date += -1, days       ; minus 1 day
    return SubStr(new_date, 7, 2)
}