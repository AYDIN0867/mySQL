USE my_database;
/*
DISTINC anahtar kelimesi SQL'de, bir sorgu sonucu setinden
yanlızca benzersiz (tekrar etmeyen) degerleri secmek icin
kullnılır.Tekrarlanan verilerin filtrelenmesi ve veri setinden tekil kayıtların
alınması gerektiğinde bu ifade devreye gireri.DISTINCT genellikle SELECT ifadesiyle birlikte kullanılır
ve SELECT sorgusunun hemen ardından gelir
*/
/*
************************SYNTAX*********************
SELECT DISTINCT sütün_adi;
FROM tablo_adı;
*/

CREATE TABLE siparisler(
id INT ,
musteri_adi VARCHAR(50),
urun_adi VARCHAR(50),
siparis_tarihi DATE
);

INSERT INTO siparisler (musteri_adi, urun_adi, siparis_tarihi)
VALUES ('Ahmet Yılmaz','Laptop', '2023-01-10'),
       ('Ayse Kaya','Akıllı Telefon', '2023-01-12'),
       ('Mehmet Öz','Laptop', '2023-02-05'),
       ('Ahmet Yılmaz','Akıllı Telefon', '2023-02-10'),
       ('Ayse Kaya','Tablet', '2023-02-20'),
       ('Ahmet Yılmaz','Laptop', '2023-02-25');
       
       SELECT * FROM siparisler;
       
 /*
 ================================================================
 siaprisler tablosuna göre hangi urunler siapris edilmis
 (Urunler UNIQUE(benzersiz) olmali)
 =================================================================0
 
 */      
 SELECT DISTINCT urun_adi
 FROM siparisler;
 
/*
 ================================================================
 siaprisler tablosundaki verilere göre subat ayi icersinde satilan urunleri benzersiz olarak listeleyiniz
 (Urunler UNIQUE(benzersiz) olmali)
 =================================================================0
 
 */       
 
-- birinci çözüm
SELECT DISTINCT urun_adi
FROM siparisler
WHERE siparis_tarihi
LIKE '____-02-__';

-- İKİNCİ  ÇÖZÜM

SELECT DISTINCT urun_adi
FROM siparisler
WHERE siparis_tarihi >='2023-02-01'
AND siparis_tarihi <='2023-02-28';

-- ucuncu çözüm
SELECT DISTINCT urun_adi
FROM siparisler
WHERE MONTH (siparis_tarihi) = 2
AND YEAR (siparis_tarihi)= 2023;






       
