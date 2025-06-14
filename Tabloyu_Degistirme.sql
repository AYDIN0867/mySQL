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

SELECT * FROM kitaplar;
