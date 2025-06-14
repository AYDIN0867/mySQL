USE my_database;

SELECT * FROM kisiler;

/*
================================
KARŞILAŞTIRMA OPERATÖRLERİ
================================
Karşılaştırma opartaörleri sutun değerlerini belirli bir deger veya başka bir sutun
degeriyle karşılaştırmak için kullanılır
*/

/*

>Eşittir(=) : iki değerin eşit olup olmadıgını kontrol eder

*/

/*
Kisiler tablosundaki yasi 35 olan kisilerin isim ve soyisimlerini listeleyiniz...
*/

SELECT isim, soyisim
FROM kisiler
WHERE yas= 35;

/*
>Büyüktür(>),Kücüktür(<): Sayısal degerlerin buyukluk/kucuklugunu karşılaştırır.

*/
/*

****************SYNTAX**************
SELECT * FROM tablo_adı WHERE sütun_adı > 1;
SELECT * FROM tablo_adı WHERE sütun_adı < 1;

*/

/*
kişiler tablosunda yası 30 dan buyuk olan kişilerin bilgilerini listeleyiniz...

*/

SELECT * FROM kisiler
WHERE yas > 30;

/*

kişiler tablosundaki ismi emre den buyuk olan kişilerin isimlerini listeleyiniz

*/

/*

CHAR veya VARCHAR turundeki ifadeler için buyuktur(>) ve kucuktur (<) operatötleri kullanılabilir.
Bu operatörler karakter disileri (stringler) arasında alfabetik veya leksikografik (ASCII) karşılaştırma yapar.
Bu tür karşılaştırmalar karakter dizilerinin alfabetik sırasına göre buyuk veya kucuk olup olmadıklarını belirlemek icin
kullanılır...


*/

SELECT isim
FROM kisiler
WHERE isim >'Emre';


/*

Kisiler tablosundaki sehri 'D' den buyuk olan sehirlerde yasayan kisilerin 
isim ve soyisim bilgilerini listeleyiniz

*/

SELECT isim, soyisim , sehir
FROM kisiler
WHERE sehir > 'D';

/*

Buyuk esittir (>=),Kucuk esittir (<=): Sayısal degerlerin
buyuklugunu/kucuklugunu esitlikle birlikte karşılaştırır.

*/

/*

****************SYNTAX**************
SELECT * FROM tablo_adı WHERE sütun_adı >= 1;
SELECT * FROM tablo_adı WHERE sütun_adı <= 1;

*/

/*

Kisiler tablosundaki sehri 'Konya' den kucuk veya esit olan sehirlerde yasayan kisilerin 
isim ve soyisim,şehir bilgilerini listeleyiniz

*/

SELECT isim, soyisim , sehir
FROM kisiler
WHERE sehir <= 'Konya';

/*
kişiler tablosunda yası 35 dan kucuk veya esit olan kişilerin bilgilerini listeleyiniz...

*/
SELECT * FROM kisiler
WHERE yas <= 35 ;

/*
Değildir (<> veya!=): iki değerin eşit olmadığını kontrol eder

*/

/*

****************SYNTAX**************
SELECT * FROM tablo_adı WHERE sütun_adı <> 1;
SELECT * FROM tablo_adı WHERE sütun_adı != 1;

*/

/*
kişiler tablosunda şehri Trabzon olmayan kişilerin bilgilerini listeleyiniz...

*/

SELECT * FROM kisiler
WHERE sehir <> 'Trabzon' ;

/*
kişiler tablosunda soyismi günes olmayan kişilerin bilgilerini listeleyiniz...

*/
SELECT * FROM kisiler
WHERE soyisim != 'Gunes' ;

/*==================================================
WHERE MANTIKSAL OPERATORLER
====================================================*/


/*
"AND", "OR", ve "NOT" SQL sorgu dili icinde kullanılan mantıksal oparatorlerdir.
Bu oparatorler, sorgularda belirli kosulların nasıl birlestirilecegini ve degerlendirilecegini
kontrol eder.Bu operatorlerin kullanımı, veritabanı,sorgularımızın esnekligini ve gucunu artırır.

*/
/*==================================================
MANTIKSAL OPERATORLER/AND
====================================================*/

/*
*************************SYNTAX*******************
SELECT * FROM tablo_adı
WHERE 1sütun_adı= 1
AND 2sütun_adı = 2;

*/

/*
kişiler tablosundan 29 yasından buyuk olan ve Ankara da yasayan kişilerin bilgilerini listeleyiniz...

*/
SELECT * FROM kisiler
WHERE yas > 29
AND sehir='Ankara';

/*
kişiler tablosundan ismi 'Ayse' ve soyismi 'Kaya' olan  kişilerin bilgilerini listeleyiniz...
*/
SELECT * FROM kisiler
WHERE isim='Ayse'
AND soyisim='Kaya';


/*
=============================================
BETWEEN
Baslangic ve bitis degerleri dahildir
=============================================
*/

/*
*************************SYNTAX*******************
SELECT  
FROM tablo_adı
WHERE sütun_adı BETWEEN deger1 AND deger2;


*/

/*
kişiler tablosundan yası 25 ile 35 arasında olan  kişilerin bilgilerini listeleyiniz...
*/

SELECT *FROM kisiler
WHERE yas
BETWEEN 25 
AND 35;

/*
kişiler tablosundan yası 25 ile 35 arasında olan ve ankarada yasayan  kişilerin bilgilerini listeleyiniz...
*/
SELECT *FROM kisiler
WHERE yas
BETWEEN 25 
AND 35
AND sehir='Ankara'

/*==================================================
MANTIKSAL OPERATORLER/OR
BİRDEN FAZLA KOŞULDAN EN AZ BİRİNİN  KARŞILANMASI GEREKİR
====================================================*/

/*
*************************SYNTAX*******************
SELECT  * FROM tablo_adı
WHERE 1sütun_adı=1
OR 2sütun_adı=2;
*/

/*
kişiler tablosundan yası 22 veya 35  olan  kişilerin bilgilerini listeleyiniz...
*/
SELECT * FROM kisiler
WHERE yas=22
OR yas=35;

/*
kişiler tablosundan istanbul,ankara veya izmir de yasayan  kişilerin bilgilerini listeleyiniz...
*/

SELECT * FROM kisiler
WHERE sehir='İstanbul'
OR sehir='Ankara'
OR sehir='İzmir';


/*==================================================
MANTIKSAL OPERATORLER/IN
====================================================*/

/*
IN OPERATÖRÜ birden çok OR koşulunu okunaklı ve kısa sekilde yazmanın bir yoludur
*/

/*
*************************SYNTAX*******************
SELECT  sütun_adları
FROM tablo_adi
WHERE sütun_adi IN (deger1, deger2,......,degerN);
*/

/*
kişiler tablosundan istanbul,ankara veya izmir de yasayan  kişilerin bilgilerini listeleyiniz...
*/
-- OR ILE COZUM
SELECT * FROM kisiler
WHERE sehir='İstanbul'
OR sehir='Ankara'
OR sehir='İzmir';

-- IN ILE COZUM
SELECT * FROM kisiler
WHERE sehir IN ('İstanbul', 'Ankara', 'İzmir');

/*
kişiler tablosundan sosyismi demir,çelik veya kaya olan   kişilerin bilgilerini listeleyiniz...
*/
SELECT * FROM kisiler
WHERE soyisim IN ('Demir', 'Çelik', 'Kaya');

/*==================================================
MANTIKSAL OPERATORLER/NOT
Koşulun sonucunu olumsuz yapar
====================================================*/
/*
*************************SYNTAX*******************
SELECT * FROM tablo_adi
WHERE NOT sütun_adi=1;
*/
/*
kişiler tablosundan İSTANBULDA yasamayan   kişilerin bilgilerini listeleyiniz...
*/
SELECT * FROM kisiler
WHERE sehir='İstanbul';

-- sonra not operatoru ile bu sorguyu tersinecevireceğiz
SELECT * FROM kisiler
WHERE NOT sehir='İstanbul';

SELECT * FROM kisiler
WHERE  sehir!='İstanbul';

SELECT * FROM kisiler
WHERE  sehir<>'İstanbul';
/*
kişiler tablosundan 30 YASINDAN BUYUk OLMAYAN   kişilerin bilgilerini listeleyiniz...
*/

SELECT * FROM kisiler
WHERE yas>30;

SELECT * FROM kisiler
WHERE NOT yas>30;


