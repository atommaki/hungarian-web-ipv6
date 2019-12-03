# Magyar web IPv6 használat

Hány weboldalnak van IPv6 címe a top100 magyar oldalak közül?
A top100 lista adatait a http://dkt.hu -ról vettem (domestic, all platfroms). Két teszt fut, az első lekéri az oldal IPv6 címét DNS-ből és ha van ilyen cím akkor meg is próbálja letölteni az oldalt IPv6-on keresztül.

# Eredmény

Jelenleg 20 oldalnak (azaz 20%) van IPv6 címe és ezek közül 19-en működik a letöltés is.

Részletes ereményekért nézd meg a file-okat a [results](https://github.com/atommaki/hungarian-web-ipv6/tree/master/results) mappában, formátum:
```
n;site;yes/no;yes/no
```
 * n: a site helye a top100-as listán
 * site: a site neve
 * első yes/no: az oldalnak van/nincs IPv6 cjme
 * második yes/no: az oldaletöltés működik IPv6-on
