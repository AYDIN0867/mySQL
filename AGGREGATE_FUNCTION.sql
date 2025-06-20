USE my_database;
/*===============================================
AGGREGATE FUNCTIONS;
Aggregate fonksiyonlar, SQL de bir grup satır üzerinde belirli
bir islemi gerceklestiren ve tek bir deger donduren fonksiyonlardır
Bu tür fonksiyonlar, veri analizi yaparken veya raporlar hazırlarken veri
setleri üzerinden özet bilgiler elde etmek için sıklıkla kullanılır.

Aggregate fonksiyonlar, birden fazla satırın bilgilerini toplayarak,
bunların ortalamasını almak, en buyuk veya en kucuk degerini bulmak gibi
işlemleri kolaylılla yapar
=================================================*/


/*
    Yaygın Kullanılan Aggregate Fonksiyonlar
    COUNT(): Belirli bir kriteri karşılayan satırların sayısını döndürür.
    Örnegin, bir tabloda kaç tane farklı kayıt oldugunu bulmak icin kullanılır.

    SUM(): Sayısal bir sütundaki tüm degerlerin toplamını hesaplar.Örnegin, bir satıs tablosundaki tüm satışların
    toplam gelirini hesaplamak için kullanılabilir.
    
    AVG(): Sayısal bir sütundaki degerlerin ortalamasını hesaplar.Örnegin ögrencilerin sınav ortalamasını bulmak için kullanılır
    
    MIN() VE MAX() : Bir sütundaki en kucuk ve en buyuk degerleri bulur.
    Örnegin bir ürünun satıs fiyatları arasında en düşük ve en yüksek fiyatı bulmak için kullanılır.
*/

/*===========================================
AGGREGATE FUNCTIONS/COUNT()
=============================================*/
/*
*********************SYNTAX*******************
SELECT COUNT (sütun_adı)
FROM tablo_adı;
*/

CREATE TABLE satis_raporu(
id INT ,
urun_adi VARCHAR(100),
satis_miktari INT,
birim_fiyati DECIMAL(10, 2),
satis_tarihi DATE
);

INSERT INTO satis_raporu VALUES
(1, 'Laptop', 10, 5000.00, '2023-01-01'),
(2, 'Akıllı Telefon', 15, 3000.00, '2023-01-03'),
(3, 'Tablet', 12, 2500.00, '2023-01-05'),
(4, 'Kulaklık', 40, 150.00, '2023-01-07'),
(5, 'Masaüstü Bilgisayar', 8, 7000.00, '2023-01-09'),
(6, 'Kamera', 5, 4500.00, '2023-01-11'),
(7, 'Mouse', 50, 100.00, '2023-01-13'),
(8, 'Klavye', 30, 200.00, '2023-01-15'),
(9, 'Monitor', 10, 1500.00, '2023-01-17'),
(10, 'Yazıcı', 7, 1000.00, '2023-01-19');


SELECT * FROM satis_raporu;

/*======================================================
Satis raporu tablosundaki toplam urun cesidi sayisi nedir.
=========================================================
*/

SELECT COUNT(urun_adi)
FROM satis_raporu;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM satis_raporu WHERE id > 10;

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM satis_raporu;

SELECT COUNT(DISTINCT urun_adi)
FROM satis_raporu;

/*======================================================
Satis raporu tablosundaki fiyatı 1000 den az olan urunlerin sayisi nedir.
=========================================================
*/

SELECT COUNT(*)
FROM satis_raporu
WHERE birim_fiyati < 1000;

/*======================================
AGGREGATE FUNCTIONS / SUM()
========================================*/

/*
****************************SYNTAX*******************
SELECT SUM(sütun_adi)
FROM tablo_adı;
*/

/*============================================
Satis raporu tablosundaki toplam satis miktari nedir?
==============================================*/

SELECT SUM(satis_miktari)
FROM satis_raporu;

/*============================================
Satis raporu tablosundaki 2023 Ocak ayinda yapilan toplam satis miktari nedir?
==============================================*/
SELECT SUM(satis_miktari*birim_fiyati)
FROM satis_raporu
WHERE satis_tarihi LIKE'2023-01-__';

-- ikinci yol
SELECT SUM(satis_miktari*birim_fiyati)
FROM satis_raporu
WHERE satis_tarihi >='2023-01-01'
AND satis_tarihi <='2023-01-31';

-- 3. yol
SELECT SUM(satis_miktari*birim_fiyati)
FROM satis_raporu
WHERE YEAR(satis_tarihi)=2023
AND MONTH(satis_tarihi)=1;

/*====================================
   AGGREGATE FUNCTIONS / AVG()
======================================*/


/*
******************SYNTAX***************
SELECT AVG(sütun_adi)
FROM tablo_adı;
****************************************/

/*=============================================================
Satis raporu tablosundaki urunlerin ortalama birim fiyatı nedir?
===============================================================*/

SELECT AVG(birim_fiyati)
FROM satis_raporu;

/*===========================================================================
Satis raporu tablosundaki kulaklık ve yazıcıların ortalama satiş fiyatı nedir?
=============================================================================*/
SELECT AVG(satis_miktari)
FROM satis_raporu
WHERE urun_adi IN('Kulaklık', 'Yazıcı');

/*====================================
   AGGREGATE FUNCTIONS / MAX()&MIN()
======================================*/

/*
******************SYNTAX***************
SELECT MAX(sütun_adi) / MIN(sütun_adi)
FROM tablo_adı;
****************************************/

/*===========================================================================
Satis raporu tablosundaki en düşük birim fiyatı nedir?
=============================================================================*/
SELECT  MIN(birim_fiyati)
FROM satis_raporu;

/*===========================================================================
Satis raporu tablosundaki en eski ve en yeni satis tarihleri nelerdir?
=============================================================================*/

SELECT MIN(satis_tarihi), MAX(satis_tarihi)
FROM satis_raporu;




