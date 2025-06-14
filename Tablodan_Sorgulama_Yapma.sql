USE my_database;

/*

====================================
TABLODAN SORGULAMA YAPMAK/SELECT
====================================

*/

/*
Tüm Sütunlari Secme:Eger tablodaki tüm sutunlardaki verilere ihtiyacınız varsa yıldız işareti(*) kullanarak
tum secebilirisiniz.bu tablodaki her bir sutundan veri getirir

*/

/*

*******************SYNTAX************
SELECT * FROM table_name;

*/

/*
Belirli sutunlari Secme: Eger sadece belirli sutunlardaki verilere ihtiyacımız varsa, bu sutunların 
adlarını SELECT komutundan sonra, FROM komutu ile belirtilen tablo adından önce sıralayabilirsiniz
*/

/*
SELECT herzaman başta olur
SELECT sütun1, sütun2 FROM tablo_adi;
*/

CREATE TABLE kisiler(
id INT ,
isim VARCHAR(50) ,
soyisim VARCHAR(50) ,
yas INT ,
sehir VARCHAR(50)
);

INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Ahmet', 'Yılmaz', 30, 'Ankara');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Mehmet', 'Kara', 25, 'İstanbul');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Ayşe', 'Kaya', 22, 'İzmir');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Fatma', 'Güneş', 28, 'Bursa');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Ali', 'Çelik', 35, 'Antalya');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Elif', 'Demir', 29, 'Ankara');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Can', 'Özdemir', 33, 'İstanbul');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Deniz', 'Aslan', 24, 'İzmir');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Selin', 'Yıldız', 27, 'Bursa');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Emre', 'Koç', 31, 'Antalya');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Zeynep', 'Çınar', 26, 'Konya');
INSERT INTO kisiler(isim, soyisim, yas, sehir) VALUES ('Oguz', 'Kaplan', 40, 'Samsun');

SELECT * FROM kisiler;

/*

soru 1- kisiler tablosundan isim ve soy isim bilgilerini listeleyiniz....

*/

SELECT isim, soyisim
FROM kisiler;





