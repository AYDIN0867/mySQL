USE my_database;

/* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.

-----Syntax-----
UPDATE table_name
SET field1 = 'Emre'
WHERE condition;

UPDATE islemlerinin yapilabilmesi icin Ayarlar -> SQL Editor -> "Safe Updates" check box'indaki
tik isaretini kaldirip kaydetmemiz gerekiyor, sonrasinda MySQL'i kapatip tekrar acmaliyiz

SET SQL_SAFE_UPDATES = 0;
========================================================================================*/

CREATE TABLE firmalar
(
	id INT AUTO_INCREMENT,
    isim VARCHAR(20),
    iletisim_isim  VARCHAR(20),
    PRIMARY KEY id_isim (id,isim)
);
INSERT INTO firmalar (isim, iletisim_isim)
VALUES  ('ACB', 'Ali Can'), 
        ('RDB', 'Veli Gul'), 
        ('KMN', 'Ayse Gulmez');

SELECT * FROM firmalar;

-- Id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz

UPDATE firmalar
SET isim= 'KRM'
WHERE id =3;
SET SQL_SAFE_UPDATES = 0;

-- 1 satırın etkilenmesi beklenir
-- INSER, UPDATE, VE DELETE komutları Result donme bunun yerine etkilenen satir sayısını int olarak doner

-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.

UPDATE firmalar
SET id = 4
WHERE iletisim_isim = 'Veli Gul' ;

UPDATE firmalar
SET isim = 'FDS'
WHERE iletisim_isim = 'Veli Gul' ;

UPDATE firmalar
SET isim = 'FDS', id=4
WHERE iletisim_isim = 'Veli Gul' ;
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM firmalar;

-- *************************************************************

CREATE TABLE tedarik
(
	id INT AUTO_INCREMENT,
    isim VARCHAR(20),
    irtibat VARCHAR(15),
    PRIMARY KEY id_pk (id)
    );
   
   CREATE TABLE urun
(
	tedarikci_id INT,
	urun_id INT UNIQUE,
    urun_ismi VARCHAR(40) NOT NULL,
    musteri_isim VARCHAR(25),
    FOREIGN KEY tedarikciID_fk (tedarikci_id)
    REFERENCES tedarik(id)
);

INSERT INTO tedarik VALUES(100, 'IBM', 'Ali Can'); 
INSERT INTO tedarik VALUES(101, 'APPLE', 'Merve Temiz'); 
INSERT INTO tedarik VALUES(102, 'SAMSUNG', 'Kemal Can'); 
INSERT INTO tedarik VALUES(103, 'LG', 'Ali Can');

INSERT INTO urun VALUES(100, 1001,'Laptop', 'Suleyman'); 
INSERT INTO urun VALUES(101, 1002,'iPad', 'Fatma'); 
INSERT INTO urun VALUES(102, 1003,'TV', 'Ramazan'); 
INSERT INTO urun VALUES(103, 1004,'Phone', 'Ali Can');

 SELECT * FROM tedarik;
 SELECT * FROM urun;

/* a) Urun tablosundan Ali Can'in aldigi urunun ismini, 
tedarik tablosunda irtibat Merve Temiz olan 
sirketin ismi ile degistirin. */

-- Ali Can'in aldigi urunun ismini 'APPLE' olarak degistirin.

-- Oncelikle irtibati Merve Temiz olan firma ismini bulmaliyiz.

SELECT isim
FROM tedarik
WHERE irtibat = 'Merve Temiz';  -- APPLE

-- Daha sonra UPDATE sorgusunu yazabiliriz

UPDATE urun
SET urun_ismi= (SELECT isim
                FROM tedarik
                WHERE irtibat = 'Merve Temiz')
WHERE musteri_isim = 'Ali Can';                
SET SQL_SAFE_UPDATES = 0;   

SELECT * FROM urun;            

-- urun id'si 1001 olan urun ismini, id'si 102 olan sirketin ismi ile degistirin.

UPDATE urun
SET urun_ismi = (SELECT isim
                 FROM tedarik
                 WHERE id= 102)
WHERE urun_id = 1001;
SET SQL_SAFE_UPDATES = 0; 

SELECT * FROM urun;

-- *************************************************************


CREATE TABLE cocuklar(
id INT,
isim VARCHAR(20),
veli_isim VARCHAR(10),
grade DOUBLE,
CONSTRAINT id_pk PRIMARY KEY (id)
);

INSERT INTO cocuklar VALUES
 (123, 'Ali Can', 'Hasan',75), 
 (124, 'Merve Gul', 'Ayse',85), 
 (125, 'Kemal Yasa', 'Hasan',85),
 (126, 'Rumeysa Aydin', 'Zeynep',85),
 (127, 'Oguz Karaca', 'Tuncay',85),
 (128, 'Resul Can', 'Tugay',85),
 (129, 'Tugay Kala', 'Osman',45);

SELECT * FROM cocuklar;

CREATE TABLE puanlar
(
ogrenci_id INT,
ders_adi VARCHAR(10),
yazili_notu DOUBLE,
CONSTRAINT puanlar_fk 
FOREIGN KEY (ogrenci_id) 
REFERENCES cocuklar (id)
);

INSERT INTO puanlar VALUES ('123','kimya',75); 
INSERT INTO puanlar VALUES ('124','fizik',65); 
INSERT INTO puanlar VALUES ('125','tarih',90); 
INSERT INTO puanlar VALUES ('126','kimya',87); 
INSERT INTO puanlar VALUES ('127','tarih',69); 
INSERT INTO puanlar VALUES ('128','kimya',93); 
INSERT INTO puanlar VALUES ('129','fizik',25);

SELECT * FROM puanlar;

-- Tum cocuklarin gradelerini puanlar tablosundaki yazili_notu ile update edin.

UPDATE cocuklar
SET grade = (SELECT yazili_notu
             FROM puanlar
             WHERE puanlar.ogrenci_id = cocuklar.id);
 SET SQL_SAFE_UPDATES = 0; 
 
 SELECT * FROM cocuklar;
 
 -- Affected  Row = 7 
 -- Actual =6
 
 -- Ismi Kemal Yasa olan ogrencinin grade'ini puanlar tablosundaki 
-- ogrenci id'si 128 olan yazili notu ile update edin.
 
UPDATE cocuklar
SET grade= (SELECT yazili_notu
            FROM puanlar
            WHERE puanlar.ogrenci_id = 128)
WHERE isim = 'Kemal Yasa';            
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM cocuklar;            

-- Puanlar tablosundaki ders_adi 'fizik' olan ogrenci_id degerini 
-- cocuklar tablosundaki grade degeri 25 olan ogrencinin id ile guncelleyiniz.

-- PARENT TABLE -> cocuklar (PRIMARY KEY oldugu tablo)
-- CHILD TABLE -> puanlar   (FOREIGN KEY oldugu tablo)

-- PARENT tabloda PRIMARY KEY COLUMN'inda olmayan herhangi bir data 
-- CHILD tabloda FOREIGN KEY COLUMN'inda olamaz.

UPDATE puanlar 
SET ogrenci_id = (SELECT id
                  FROM cocuklar
                  WHERE grade = 25)
                  
 WHERE ders_adi ='Fizik';
 SET SQL_SAFE_UPDATES = 0;

SELECT * FROM puanlar;

-- Puanlar tablosundaki ders_adi 'kimya' olan ogrenci_id degerini 
-- cocuklar tablosundaki id degeri 125 olan ogrencinin grade degeri ile guncelleyiniz.


-- PARENT tabloda PRIMARY KEY COLUMN'inda olmayan herhangi bir data 
-- CHILD tabloda FOREIGN KEY COLUMN'inda olamaz.

-- PARENT TABLODA PRIMARY KEY COLUMN 'inda OLMAYAN HERHANGİ BİR DATA 
-- CHILD TABLODA FOREIGN KEY COLUMN İNDA OLAMAZ

UPDATE puanlar 
SET ogrenci_id = (SELECT grade
                  FROM cocuklar
                  WHERE id = 125) -- 93
                  
 WHERE ders_adi ='Kimya';
 SET SQL_SAFE_UPDATES = 0;

SELECT * FROM puanlar;


