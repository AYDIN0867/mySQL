USE my_database;


/*
===============================================
TABLOYU DEĞİŞTİRME

===========================================

ALTER TABLE ifadesi,SQL de mevcut bir veritabanı  tablosunun yapısını değiştirmek için kullanılır.
Bu komut sayesinde tabloya yeni sutunlar ekleyebilir mevcut sutunları değiştirebilir veya silebilir sutunların veri turlerini
guncelleyebilir sutunlara kısıtlamalar ekleyebilir veya mevcut kısıtlamaları kaldırabilirsiniz...

*/



/*
===================================0
ALTER TABLE-Sutun Ekleme
==================================0
*/

/*

********************SYNTAX*****************
ALTER TABLE tablo_adi
ADD sutun_adi + dataType;


*/

/*
=========================SORU1====================
Kitaplar tablosuna sayfa sayisi column'i ekleyiniz.
==================================================
*/

SELECT * FROM kitaplar;

ALTER TABLE kitaplar
ADD sayfa_sayisi INT; 



/*
ALTER TABLE-Sütunun Veri Türünü Değiştirme
*/

/*

*****************SYNTAX****************
ALTER TABLE tablo_adi
MODIFY COLUMN sütun_adi + yeniDataType

*/

/*
ogrenciler tablosundakşi kayıt yılı column'inin data type ini degisitiriniz
*/

ALTER TABLE ogrenciler
MODIFY COLUMN ortalama_not DOUBLE;

ALTER TABLE ogrenciler
MODIFY COLUMN kayit_yili year;

/*

ALTER TABLE -SUTUN Adını Değiştirme

*/

/*

*****************SYNTAX****************
ALTER TABLE tablo_adi
RENAME COLUMN eskiSütun_adi TO yeniSütunAdi

*/

/*
personel tablosundakşi pozisyon column'inin  ad ini sorumluluk olarak degisitiriniz
*/

ALTER TABLE personel
RENAME COLUMN pozisyon TO sorumluluk;

/*

ALTER TABLE -SUTUN silme

*/

/*

*****************SYNTAX****************
ALTER TABLE tablo_adi
DROP COLUMN Sütun_adi 

*/

/*
ogrenciler tablosundaki ogrenci id column'ini siliniz.
*/
ALTER TABLE ogrenciler
DROP COLUMN ogrenci_id;

/*
silme işleminden önce etraflıca düşünülmeli geri dönüşümü 
zordur ileride ihtiyac duyulması muhtemel bilgiler olabiliri
*/