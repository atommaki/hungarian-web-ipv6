# Magyar web IPv6 használat

Hány weboldalnak van IPv6 címe a top 20/100/500 magyar oldalak közül?
A top lista adatait a http://dkt.hu -ról vettem (domestic, all platfroms). Két teszt fut, az első lekéri az oldal IPv6 címét DNS-ből és ha van ilyen cím akkor meg is próbálja letölteni az oldalt IPv6-on keresztül.

# Jelenlegi eredmény

Legutóbb frissítve: 2019 december

  * A magyar **top20** website közül:
    * IPv6 címe van: 20% (4)
    * Oldal letöltés működik IPv6-on: 20% (4)
    * DNS szerverének van IPv6 címe: 50% (10)

  * A magyar **top100** website közül:
    * IPv6 címe van: 18% (18)
    * Oldal letöltés működik IPv6-on: 17% (17)
    * DNS szerverének van IPv6 címe: 46% (46)

  * A magyar **top500** website közül:
    * IPv6 címe van: 15% (79)
    * Oldal letöltés működik IPv6-on: 14% (74)
    * DNS szerverének van IPv6 címe: 48% (240)

# Részlek

Részletes ereményekért nézd meg a file-okat a [results](https://github.com/atommaki/hungarian-web-ipv6/tree/master/results) mappában, formátum:
```
n;site;yes/no;yes/no
```
 * n: a site helye a top100-as listán
 * site: a site neve
 * első yes/no: az oldalnak van/nincs IPv6 cjme
 * második yes/no: az oldaletöltés működik IPv6-on
