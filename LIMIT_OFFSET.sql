USE my_database
/*=======================================
LIMIT-OFFSET
=========================================*/
/*
LIMIT ifadesi, bir sorgu sonucundan döndürülecek
maksimum satır sayısını belirlememizi sağlar.
Eger bir sorgu sonucu çok sayıda satır döndürüyorsa
ve siz sadece bir kısmını görmek isityorsanız,LIMIT kullanabilirsiniz.
*/

/*
*******************SYNTAX***********************
SELECT * FROM tablo_adi
LIMIT 10;
*/

/*
OFFSET ifadesi, sorgu sonucu setinde bir baslangic noktasi belirler.
Bu, özellikle sayfalama işlemlerinde faydalıdır.
OFFSET genellikle LIMIT ile birlikte kullanılır
*/

/*
*********************SYNTAX*********************
SELECT*FROM tablo_adi
LIMIT 10 OFFSET 20;

-- ilk olarak satiri atla sonraki 10 satiri getir.
-- yani 21,22,23,24,25,26,27,28,29,30. satirlari geitirir.
*/

SELECT * FROM kitaplik;


SELECT * FROM kitaplik
LIMIT 5;

/*================================================
Kitaplik tablosundan en yeni 3 Kitabı listeleyiniz...
==================================================*/
SELECT * FROM kitaplik
ORDER BY yayin_yili DESC
LIMIT 3;

/*================================================
Kitaplik tablosundan rastgele 3 kitabı secip listeleyiniz...
==================================================*/
SELECT * FROM kitaplik
ORDER BY RAND()
LIMIT 3;

-- RAND () fonksiyonu, özellikle bir tablodan rastgele kayıtlar secmek icin
-- kullanılır.
-- ORDER BY RAND () ifadesi, tablonun satırlarını rastgele bir sıraya sokar.
-- Bu yöntem, özellikle kucuk ve orta ölçekli tablolar icin uygundur.
-- Ancak, büyük veri setleri için performans sorularına yol açabilir.

/*
Kitaplik tablosundaki kitaplarin 3. sayfasini listeleyiniz.
(Her sayfanın boyutu 3 kitap ile sinirlidir.)
*/
SELECT * FROM kitaplik
LIMIT 3 OFFSET 6;

/*
Kitaplik tablosundaki alfbetik siralanmis kitaplarin 4. sayfasını listeleyiniz.
(Her sayfanın boyutu 2 kitap ile sinirlidir)
*/

SELECT * FROM kitaplik
ORDEY BY kitap_adi ASC
LIMIT 2 OFFSET 6;

/*
Kitaplik tablosundaki 'Fyodor Dostoyevski'nin kitaplarinin 2. sayfasını listeleyiniz.
(Her sayfanın boyutu 1 kitap ile sinirlidir)
*/
SELECT * FROM kitaplik
WHERE yazar ='Fyodor Dostoyevski'
LIMIT 1 OFFSET 1;












