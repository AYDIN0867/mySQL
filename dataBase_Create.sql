CREATE SCHEMA my_database;
-- bu bir yorum satırıdır

/*
bu bir yorum blogudur

*/

/*=====================================================

                 TABLO OLUŞTURMA

=========================================================*/
/*
icerisinde kitap id,kitap adi,yazar adi,yayin yilı ve kategori columnlari 
olan bir kitaplar tablosu create ediniz 


*/
USE my_database;
CREATE TABLE kitaplar
(
 kitap_id int, 
 kitap_adi VARCHAR(40),
yazar_adi  VARCHAR(40),
yayin_yili int,
kategori VARCHAR(20)
);
/*
use komutu; calistirildiği file içerisinedki tüm komutları ilgili data base e bağlar 
header (sutun_adi) genel isimlendirme kuralı sneake_case dir.SQL komutları buyuk harf ile yazılır.
diger degiskenler kucuk harfle yazilir.
herbir işlem bir satırda yapılır işlemler alt alta yazilir

*/

/*
===================================SORU2======================
İcerisinde personel id,adi,soyadi,dogum tarihi,pozisyon,maas columları olan bir personel tablosu create ediniz
=============================================================

*/
CREATE TABLE personel
(
id int,
adı VARCHAR(20),
soyadı VARCHAR(20),
dogum_tarihi DATE,
pozisyon VARCHAR(20),
maas DOUBLE(10,3)

);


/*
===================================SORU2======================
İcerisinde ogrenci id,adi,soyadi,bolum,kayıt yılı,ortalama not columları olan bir personel tablosu create ediniz
=============================================================

*/
CREATE TABLE ogrenciler
(
ogrenci_id int,
ogrenci_adi VARCHAR (20),
ogrenci_soyadi VARCHAR (20),
bolum VARCHAR(30),
kayit_yili int,
ortalama_not Float

);

/*
==============================================
TABLO GORUNTULEME
==============================================
*/

/*
SELECT komutu,SQL de veritabanından veri sorgulamak ve almak için kullnaılan temel bir komuttur.
bu komut belirtilen kriterlere uygun verileri secmek ve  goruntulemek ıcın kullanılır.
*/

/*
**************************SYNTAX****************
SELECT * FROM tablo_adi;
*/

/*
====================SORU1==========================
KİTAPLAR TABLOSUNU GORUNTULEYINIZ
==============================================
*/
SELECT * FROM kitaplar;

/*
====================SORU1==========================
personel TABLOSUNU GORUNTULEYINIZ
==============================================
*/

SELECT * FROM personel;

/*
====================SORU1==========================
ogrenciler TABLOSUNU GORUNTULEYINIZ
==============================================
*/

SELECT * FROM ogrenciler;

-- subquery önemli....inreview coin sorarlar..














