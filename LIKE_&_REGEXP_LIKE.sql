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


