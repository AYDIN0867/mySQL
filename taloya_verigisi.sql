USE my_database;

/*
             TABLOYA VERI INSERT
*/

/*
             NOT
 Degerleri girerkekn dikkat edilmesi gerekir
 String ifadeler tek tırnak icinde yazilir
 MySQL in default tarih formati 	YYY-MM-DO seklindedir.
*/


/*
*******************SYNTAX****************
INSERT INTO table_name
		VALUES (
        std_id CHAR(25),
        std_name VARCHAR(25),
        std_age INT
        );


*/

/*
SORU1
Kitaplar tablosuna null degeri olmadan bir veri girisi saglayınız.
*/
INSERT INTO kitaplar (kitap_id,kitap_adi,yazar_adi,yayin_yili,kategori)
            VALUES(1 , 'Sefiller', 'Victor Hugo', 1862, 'Roman');
            
            
 SELECT * FROM kitaplar;           

/*
kitaplar tablosuna null deger olmadan coklu veri girisi saglayınız.
*/

INSERT INTO kitaplar
  VALUES(2, 'Suc ve Ceza' , 'Fyodor Dostoyevski', 1866, 'Roman'),
		(3, 'Yabanci' , 'Albert Camus', 1942, 'Roman'),
		(4, 1984 , 'George Owell', 1949, 'Distopya'),
		(5, 'Fareler Ve Insanlar' , 'John SteinBeck', 1937, 'Roman'),
		(6, 'Kucuk Prens' , 'Antonie de Saint-Execupery', 1943, 'Cocuk');

SELECT * FROM kitaplar;

/*
=======================================SORU-3=============================
Personel tablosuna null degeri olmadan coklu veri girisi saglayınız......
===========================================================================
*/

INSERT INTO personel (id,adı, soyadı, dogum_tarihi, pozisyon,maas)
			VALUES(1, 'Mert', 'Kaya', '1992-07-12', 'Tester', 12000.000),
				   (2, 'Elif', 'Yildiz', '1998-02-24', 'Analyst', 9200.001),
				    (3, 'Burak', 'Demir', '1995-02-17', 'HR', 68000.00),
					(4, 'Zeynep', 'Aksu', '1993-06-28', 'Designer', 68000.00);
                    
  SELECT * FROM personel;                  

