# Magyar web IPv6 használat

Hány weboldalnak van IPv6 címe a top 20/100/500 magyar oldalak közül?
Három dolgot tesztelek:
  * Van-e az oldalnak IPv6 címe a DNS szerint?
  * Sikerül-e az oldalt letölteni IPv6-on?
  * Van-e a domain-nek IPv6-on elérhető névszervere?

A top lista adatait a http://dkt.hu -ról vettem (domestic, all platfroms), minden havi eredmény az előző havi toplistán alapul.

# Jelenlegi eredmény

Legutóbb frissítve: 2020 január

  * A magyar **top20** website közül:
    * IPv6 címe van: 25% (5)
    * Oldal letöltés működik IPv6-on: 25% (5)
    * DNS szerverének van IPv6 címe: 55% (11)

  * A magyar **top100** website közül:
    * IPv6 címe van: 18% (18)
    * Oldal letöltés működik IPv6-on: 17% (17)
    * DNS szerverének van IPv6 címe: 45% (45)

  * A magyar **top500** website közül:
    * IPv6 címe van: 16% (81)
    * Oldal letöltés működik IPv6-on: 15% (77)
    * DNS szerverének van IPv6 címe: 48% (242)

# Részlek

Részletes ereményekért nézd meg a file-okat a [results](https://github.com/atommaki/hungarian-web-ipv6/tree/master/results) mappában, formátum:
```
n;site;yes/no;yes/no;ns;ns6
```
 * n: a site helye a top100-as listán
 * site: a site neve
 * első yes/no: az oldalnak van/nincs IPv6 címe
 * második yes/no: az oldaletöltés működik IPv6-on
 * ns: az összes bejegyzett névszerverek száma
 * ns6: bejegyzett IPv6 névszerverek száma

