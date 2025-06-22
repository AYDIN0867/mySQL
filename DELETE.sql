USE my_database;

/*================================== DELETE ============================================

DELETE FROM table_name 

komutu tablodaki tum recordlari siler.
Eger tum kayitlar silindikten sonra tabloyu gormek isterseniz size sadece bos bir tablo
gosterir. 
DELETE komutu sadece datalari siler, tabloyu silmez.
=======================================================================================*/

-- DELETE FROM tablo_adi;  Tablonun tum icerigini siler.
-- Bu komut bir DML komutudur. Dolayisiyla devaminda WHERE gibi cumlecikler
-- kullanilabilir.


/*
 DELETE FROM tablo_adi
 WHERE field = veri;
*/

SELECT * FROM mayis_satislar;

DELETE  FROM mayis_satislar;

SELECT * FROM mayis_satislar;

SELECT * FROM nisan_satislar;

--    SAVEPOINT ABC; -- Verileri database'e yedekler..

--    ROLLBACK TO  ABC;  Yedeklenen verilerimizi geri getirir.


-- Bilgileri geri getirirken sikinti yasamamak icin 
-- ayarlar sql execution auto commit tiki kaldirin ve 
-- mySQL workbench'i kapatip acin.


SAVEPOINT ABC; -- 16:37

DELETE FROM nisan_satislar;

SELECT * FROM nisan_satislar;

ROLLBACK TO ABC ; -- 16:39








