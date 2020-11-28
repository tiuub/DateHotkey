# DateHotkey

[![GitHub all releases](https://img.shields.io/github/downloads/tiuub/DateHotkey/total)](https://github.com/tiuub/DateHotkey/releases/latest)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/tiuub/DateHotkey)](https://github.com/tiuub/DateHotkey/releases/latest)

Dieses Skript soll Sie bei täglichen bürokratischen Problemen helfen. Mit diesem Skript können leicht Daten von zukünftigen, vergangen oder aktuellen Tagen oder Kalenderwochen erlangt werden.

*Read this in other languages: [English](README.md), [German](README.de.md)*

## Installation

Es gibt zwei Möglichkeiten das Skript zu nutzen:
1. Laden Sie die DE_DateHotkey.exe-Datei aus den [Veröffentlichungen](https://github.com/tiuub/DateHotkey/releases/latest) herunter und führen Sie diese aus
2. Laden Sie sich die Dateien DE_DateHotkey.ahk und Hotstring.ahk herunter und führen diese mit einer installierten Version von [AutoHotkey](https://www.autohotkey.com) aus


## Befehle
> English commands [here](README.md)

|Beispiele|Beschreibung|
|-------|-----------|
|#heute[modifier]|Datum von Heute|
|#gestern[modifier]|Datum von Gestern|
|#morgen[modifier]|Datum von Morgen|
|#mo(ntag)[modifier]|Datum vom Montag dieser Woche|
|#di(enstag)[modifier]|Datum vom Dienstag dieser Woche|
|#mi(ttwoch)[modifier]|Datum vom Mittwoch dieser Woche|
|#do(nnerstag)[modifier]|Datum vom Donnerstag dieser Woche|
|#fr(eitag)[modifier]|Datum vom Freitag dieser Woche|
|#sa(mstag)[modifier]|Datum vom Samstag dieser Woche|
|#so(nntag)[modifier]|Datum vom Sonntag dieser Woche|
|#k(alender)w(oche)[modifier]|Aktuelle Kalenderwoche|

Die Befehle können Sie in jede beliebige Textbox reinschreiben. Der Befehl wird anschließend durch das Datum oder die Kalenderwoche ersetzt.

## Modifier
Mit dem Modifier können Sie das zurückgegebene Datum beeinflussen. Damit können Sie zum zurückgegebenen Datum Tage, Wochen, Monate oder Jahre hinzufügen oder abziehen. Sollten Sie also z.B. den Montag in 2 Wochen oder die Kalenderwoche in 40 Tagen benötige, können Sie den Modifier verwenden. 

Modifier Regex:
```sh
([\+\-0-9]+(t(age?)?|w(ochen?)?|m(onate?)?|j(ahre?)?)?)+
```

### Regeln zum Modifier
Wenn Sie den Modifier verwenden möchten, müssen Sie folgende Regeln beachten:
 - Er muss eine gültige Zahl beinhalten
 - Nach jeder Zahl muss angegeben werden, ob Tage, Wochen, Monate oder Jahre hinzugefügt oder abgezogen werden sollen
   - Ist dies nicht der Fall, werden automatisch Wochen hinzugefügt oder abgezogen
     ```sh
     #montag4 - Montag in 4 Wochen
     ```
 - Die Reihenfolge kann beliebig gewählt werden
   ```sh
   #sonntag2w2t3j2t - Montag in 4 Tagen, 2 Wochen und 3 Jahren
   ```

## Beispiele
|Beispiel|Beschreibung|
|-------|-----------|
|#heute+4tage-6wochen|Heutiges Datum, plus 4 Tagen und minus 6 Wochen|
|#montag+4tage-2tage|Montag der Woche in 2 Tage|
|#di4tage+6w|Dienstag der Woche in 4 Tage und 6 wochen|
|#gestern4t6w3monate|Datum von Gestern, plus 4 Tage, 6 Wochen und 3 Monate|
|#morgen2j4t6w|Datum von Morgen, plus 2 Jahre, 4 Tage und 6 Wochen|
|#so500t40j2m|Sonntag der Woche in 500 Tage, 40 Jahre und 2 Monate|
|#kalenderwoche4w|Kalenderwoche in 4 Wochen|
|#kw3t2w4m|Kalenderwoche in 3 Tage, 2 Wochen und 4 Monate|


## Lizenz
[![GitHub](https://img.shields.io/github/license/tiuub/DateHotkey)]()