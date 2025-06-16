USE my_database;
/*
LIKE operatoru, belirli bir patern veya düzene uyan verileri bulmak icin kullamılır
Genellikle % ve _ (alt çizgi) olmak üzere iki joker karakterle kullanılır.
% karakteri,sıfır veya daha fazla karakterin yerini tutar.

Örneğin LIKE %son ifadesi "son" ile biten tüm metin degerlerini bulur
(örn."Jason","Wilson").
*/

/*
*********************SYNTAX******************
SELECT sütun_adlari
FROM tablo_adi
WHERE sütun_adi
LIKE'patern';
*/

CREATE TABLE personel (
id CHAR(5),
isim VARCHAR(50),
maas INT
);

INSERT INTO personel VALUES ('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES ('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES ('10003','Meryem',7215);
INSERT INTO personel VALUES ('10004','Veli Han',5000);
INSERT INTO personel VALUES ('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES ('10006','Ayse Can',5600);
INSERT INTO personel VALUES ('10010','Ayse',4700);
INSERT INTO personel VALUES ('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES ('10008','Ayse Fatma',4300);
INSERT INTO personel VALUES ('10007','Beyza Ayse',7700);
INSERT INTO personel VALUES ('10011','Yeliz Alina',12700);

SELECT * FROM personel;

/*=============================================
Personel tablosundan ismi A ile baslayan personeli listeleyiniz...
===============================================*/

SELECT * FROM personel
WHERE isim
LIKE 'a%';

-- SQL de a!= A 
-- Ancak MYSQL Workbanch default olarak Case Insentive calisir.
-- Aksi belirtilemedikce MySQL Workbanch icin a=A dır

/*=============================================
Personel tablosundan ismi Ayse gecen personeli listeleyiniz...
===============================================*/

SELECT * FROM personel
WHERE isim
LIKE '%Ayse%';

/*============================================================
Personel tablosundan  Isminin 2. harfi 'e' olup diger harflerinde 'y' olan
personeli listeleyiniz 
=============================================================*/

SELECT * FROM personel
WHERE isim
LIKE '_e%'
AND isim LIKE'%y%';

/*=============================================
REGEXP_LIKE OPERATORU
1-REGEXP_LIKE (veya bazen "RLIKE" olarak da bilinir), daha karmaşık ve guclu bir arama yapmak icin duzenli ifadeleri
(regular expression) kullanır.
2-Düzenli ifadeler, metin icindeki PATERN'leri tanımlamak icin kullanılan bir dil veya sözdizimidir.
3-"REGEXP" operatoru,çok daha spesifik ve esnek aramalar yapmamıza olarak tanır.
4-[!-]=Butun karakterleri karsilayan tek bir karakteri ifade eder
[a-zA-Z0-9]=Harf ve rakanlari temsil eden bir karakteri ifade eder.
5-'^' isareti baslangici belirtir
6-'$' işareti bitisi belirtir
7-'|' karakteri veya anlamımda kulanılır
8-'.' herhangi bir tek karakter anlamına gelir

Örneğin "REGEXP '^J.son$'" ifadesi "j" ile başlayıp "son" ile biten tüm metin değerlerin (örn. "Jason" ama 
"Wilson" değil
===============================================*/

CREATE TABLE kelimeler(
id int UNIQUE,
kelime VARCHAR(50),
harf_sayisi int

);

INSERT INTO kelimeler VALUES
(1001, 'hot', 3),
(1002, 'hat', 3),
(1003, 'hit', 3),
(1004, 'hbt', 3),
(1005, 'hct', 3),
(1006, 'adem', 4),
(1007, 'selim', 5),
(1008, 'yusuf', 5),
(1009, 'hip', 3),
(1010, 'HOT', 3),
(1011, 'hOt', 3),
(1012, 'h9t', 3),
(1013, 'hoot', 4),
(1014, 'haaat', 5),
(1015, 'hooooot', 7),
(1016, 'h-t', 3),
(1017, 'hOOOt', 5),
(1018, 'hOOOt', 5),
(1019, 'O', 1);

SELECT * FROM kelimeler;


/*================================================0
Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
listeleyiniz
==================================================
*/
SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime, 'ot|at');

/*=========================================
CASE SENSETIVE (Büyük/Kücük Duyarlılık)
Kullanım: sorgu sonuna 'c' seklinde patern eklenerek belirtilmelidir.
==========================================*/

/*
Case Insensitive 
Kullanım: sorgu saonuna 'i' seklinde patern eklenerek belirtilmelidir.
*/

-- NOT: MYsql de default caseType insentive olarak kabul edilmektedir
-- Case sensitive oldugu özellikle belirtilmemis ise default type degeri
-- olan insentive gecerlidir
-- Inseentive olmasi gerektigini 'i' ile belirtmemize gerek yoktur.

/*================================================0
Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
listeleyiniz
==================================================
*/

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ot|at','c');

/*================================================0
Kelimeler tablosundan icerisinde 'ho' veya 'hi' bulunan kelimeleri
case-sensitive dikkat etmeden listeleyiniz
==================================================
*/

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ho|hi', 'i');

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ho|hi');

/*================================================0
Kelimeler tablosundan icerisinde h ile baslayip t ile biten 3 karakterli kelimeleri
(h ile t kucuk harfli olanlari )listeleyiniz
==================================================
*/
SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^h[!-~]t$', 'c');

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^h.t$', 'c');

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^h[0-9]t$', 'c');

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^h[a-zA-Z]t$', 'c');

/*
----------------------------------------------KARŞILAŞTIRMA------------------------------------------------------
Esneklik:"REGEXP" daha esnek ve gucludur, karmasık desenleri tanımlayabilir.
"LIKE" ise daha basit ve sınırlı desenlerle çalışır.
Performans:"LIKE" operatoru genellikle "REGEXP" oparatorune göre daha hızlıdır,
çünkü daha basit desenleri işler
Kullanım kolaylıgı: "LIKE" daha basit ve anlaşılması kolaydır."REGEXP" ise düzenli ifadelerin
nasıl calıstıgını bilmeyi gerektirir, bu da ögrenme egrisini artırır.

*/






