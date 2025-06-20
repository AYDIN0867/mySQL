USE my_database;


/*
GROUP BY SQL ifadesi, veritabanı sorgularında belirli bir veya birden fazla sütuna göre satırları gruplandırmak
için kullanılır.Genellikle aggregate (toplulaştırma) fonksiyonlar
(COUNT(), SUM(), AVG(), MIN(), MAX() vb.) ile birlikte kullanılır.
GROUP BY ifadesi, belirtilen sütunlardaki degerlere göre benzersiz gruplar olusturur ve her grup için aggregate 
fonksiyonların sonuclarını dondurur. Bu, veriler üzerinde özetlemeler ve analizler yapmayı saglar.
*/

/*
GROUP BY kullanılırken, SELECT ifadesinde belirtilen sütunların ya gruplandırma ifadesinde 
(GROUP BY kısmında)belirtilmiş olması ya da bir aggregate fonksiyonun parcası olması gerekir.
 Birden fazla sütun üzerinde gruplandırma yapılabilir.Bu durumda, sütunlar virgül ile ayrılarak
 GROUP BY ifadesine eklenir.
*/

/*
********************************SYNTAX**********************
SELECT sütun_adi, SUM(adet) AS toplam_adet
FROM tablo_adi
GROUP BY sütun_adi -->(gruplanacak verilerin oldugu);
*/

CREATE TABLE manav (
id INT ,
urun_adi VARCHAR (50),
miktar_kg DECIMAL (5, 2),
birim_fiyat DECIMAL(5,2),
toplam_satis DECIMAL(7,2),
satis_tarihi DATE,
kategori VARCHAR(50)
);

INSERT INTO manav (id, urun_adi, miktar_kg, birim_fiyat, toplam_satis, satis_tarihi, kategori) VALUES
(1, 'Elma', 10.5, 35.00, 367.50, '2025-03-02', 'Meyve'),
(2, 'Muz', 20.0, 50.00, 1000.00, '2025-03-02', 'Meyve'),
(3, 'Portakal', 19.75, 25.00, 493.75, '2025-03-03', 'Meyve'),
(4, 'Domates', 20.0, 18.00, 360.00, '2025-03-04', 'Sebze'),
(5, 'Biber', 10.0, 60.00, 600.00, '2025-03-05', 'Sebze'),
(6, 'Patlıcan', 13.5, 70.00, 945.00, '2025-03-06', 'Sebze'),
(7, 'Salatalık', 17.0, 40.00, 680.00, '2025-03-07', 'Sebze'),
(8, 'Üzüm', 22.0, 80.00, 1760.00, '2025-03-08', 'Meyve'),
(9, 'Kavun', 30.0, 45.00, 1350.00, '2025-03-09', 'Meyve'),
(10, 'Karpuz', 50.0, 20.00, 1000.00, '2025-03-10', 'Meyve'),
(11, 'Elma', 2.5, 35.00, 87.50, '2025-03-02', 'Meyve'),
(12, 'Muz', 2.0, 50.00, 100.00, '2025-03-02', 'Meyve'),
(13, 'Portokal', 3.0, 25.00, 75.00, '2025-03-02', 'Meyve'),
(14, 'Domates', 4.0, 18.00, 72.00, '2025-03-02', 'Sebze'),
(15, 'Biber', 1.5, 60.00, 90.00, '2025-03-02', 'Sebze'),
(16, 'Patlıcan', 2.0, 70.00, 140.00, '2025-03-02', 'Sebze'),
(17, 'Salatalık', 3.0, 40.00, 120.00, '2025-03-02', 'Sebze'),
(18, 'Üzüm', 2.5, 80.00, 200.00, '2025-03-02', 'Meyve'),
(19, 'Kavun', 3.5, 45.00, 157.50, '2025-03-02', 'Meyve'),
(20, 'Karpuz', 5.0, 20.00, 100.00, '2025-03-02', 'Meyve');


/*
Manav tablosundaki her bir urun icin toplam satis miktarı nedir?
*/

SELECT urun_adi, SUM(miktar_kg)
FROM manav
GROUP BY urun_adi;

UPDATE manav
SET urun_adi = 'Portakal'
WHERE urun_adi = 'Portokal';

UPDATE manav SET urun_adi='Portakal' WHERE id = 13;

ALTER TABLE manav
  MODIFY id INT PRIMARY KEY;
  
  UPDATE manav
SET    urun_adi = 'Portakal'
WHERE  id = 13;

SELECT * FROM manav;

SELECT urun_adi, SUM(miktar_kg)
FROM manav
GROUP BY urun_adi;

/*
Manav tablosundaki ençok  satis yapılan ürün nedir?
*/

SELECT urun_adi, SUM(miktar_kg)
FROM manav
GROUP BY urun_adi
ORDER BY SUM(miktar_kg) DESC
LIMIT 1;


/*
Aliases komutu ile tablo yazdirilirken, field isimleri sadece
o cikti icin degistirilebir..
*/

SELECT urun_adi AS en_cok_satilan_urun, SUM(miktar_kg) AS toplam_kg
FROM manav
GROUP BY urun_adi
ORDER BY SUM(miktar_kg) DESC
LIMIT 1;

-- *******************************************************************

/*
Manav tablosundaki her bir gün icin ortalama  birim fiyat nedir?
*/

SELECT satis_tarihi, AVG(birim_fiyat) AS birim_fiyati
FROM manav
GROUP BY satis_tarihi;

/*
Manav tablosundaki satilan en pahali ürünUN bilgileri nedir?
*/

SELECT * FROM manav
ORDER BY birim_fiyat DESC
LIMIT 1;
/*
Manav tablosundaki HER KATEGAORIDEKİ en yüksek satiş fiyatına sahip ürünleri bulup,
bunları toplam satış fiyatına göre azalan sırayla sıralayıNIZ
*/

SELECT kategori, MAX(birim_fiyat) AS satis_fiyati
FROM manav
GROUP BY kategori
ORDER BY satis_fiyati DESC
LIMIT 5;





