#Include Hotstring.ahk

Hotstring("#today(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "today", 3)
Hotstring("#yesterday(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "yesterday", 3)
Hotstring("#tomorrow(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "tomorrow", 3)
Hotstring("#mo(?:nday)?(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "monday", 3)
Hotstring("#tu(?:esday)?(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "tuesday", 3)
Hotstring("#we(?:dnesday)?(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "wednesday", 3)
Hotstring("#th(?:ursday)?(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "thursday", 3)
Hotstring("#fr(?:iday)?(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "friday", 3)
Hotstring("#sa(?:turday)?(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "saturday", 3)
Hotstring("#su(?:nday)?(([\+\-0-9]+(d(ays?)?|w(eeks?)?|m(onths?)?|y(ears?)?)?)+)?`n", "sunday", 3)

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

fDate(pDays:=0, pWeeks:=0, pMonths:=0, pYears:=0, form:="dd.MM.yyyy") {
    pWeeks *= 7
	date :=  A_Now
	year := SubStr(date, 1, 4)
	month := Floor(SubStr(date, 5, 2))
    day := Floor(SubStr(date, 7, 2))
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
	date := year . SubStr("00" . month, -1) . SubStr("00" . day, -1) . SubStr(date, 9)
    date += %pWeeks%, days
    date += %pDays%, days
    FormatTime, datumString, %date%, %form%  
    return %datumString% 
}

fMiddleware($, pDays:=0, pWeeks:=0, pMonths:=0, pYears:=0, form:="dd.MM.yyyy"){
	While (Pos := Ma.Pos() = "" ? 1 : Ma.Pos()) := RegExMatch($.Value(1), "O)(([\+\-0-9]+)((d(ays?)?|(w(eeks?))?|m(onths?)?|y(ears?)?|$)))", Ma, Pos + StrLen(Ma.Value(1))) {
		If InStr(Ma.Value(3), "d")
			pDays += Ma.Value(2)
		If InStr(Ma.Value(3), "w") || Ma.Value(3) = ""
			pWeeks += Ma.Value(2)
		If InStr(Ma.Value(3), "m")
			pMonths += Ma.Value(2)
		If InStr(Ma.Value(3), "y")
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