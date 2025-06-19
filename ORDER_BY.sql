USE my_database;

/*=============================
ORDER BY
================================
*/

-- ORDER BY, LIMIT VE OFSET gibi filtreleme ifadeleri
-- database uzerinde degil bize donen sonuc uzerinde
-- filtreleme yapar.Database de bir degisiklik yapmaz.

/*
ORDER BY ifadesi, SQL sorgularında sonuclari belirli bir veya birden fazla sütuna göre
sıralamak için kullanılır.Bu ifade, sıralama işleminin yükselen (ascending) veya azalan (descending)
düzeninde yapılmasını saglar.ASC anahtar kelimesi yükselen sıralamayı (dogal), DESC anahtar ise azalan(ters)
belirtir.
*/

/*
*******************************SYNTAX*******************
SELECT sütun_adları
FROM tablo_adı
ORDER BY sıralanacak_sütun ASC|DESC;
*/

CREATE TABLE kitaplik(
id INT PRIMARY KEY,
kitap_adi VARCHAR(100),
yazar VARCHAR(50),
yayin_yili INT
);

INSERT INTO kitaplik (id, kitap_adi, yazar, yayin_yili) VALUES
(1,'Sefiller','Victor Hugo', 1862),
(2,'1984','George Orwell', 1949),
(3,'Suc ve Ceza','Fyodor Dostoyevski', 1866),
(4,'Kürk Mantolu Madonna','Sabahattin Ali', 1943),
(5,'Yabancı','Albert Camus', 1942),
(6,'Ulysses','James Joyce', 1922),
(7,'Yüzüklerin Efendisi','J.R.R Tolkien', 1954),
(8,'Hary Potter ve Felsefe Taşı','J.K. Rowling', 1998),
(9,'Da Vinci Şifresi','Dan Brown', 2003),
(10,'Zamanın Kısa Tarihi','Stephen Hawking', 1998),
(11,'Karamazov Kardeşler','Fyodor Dostoyevski', 1880),
(12,'Budala','Fyodor Dostoyevski', 1869),
(13,'Savas ve Barış','Lev Tolstoy', 1866),
(14,'Anna Karenina','Lev Tolstoy', 1877),
(15,'Hobbit','J.R.R Tolkien', 1942);

SELECT * FROM kitaplik;kitaplik

/*
Kitaplik tablosundaki kitaplari yayın yılına göre eski olanlardan
yeni olanlara dogru siralayiniz...
*/

SELECT kitap_adi, yayin_yili
FROM kitaplik
ORDER BY yayin_yili ASC;


SELECT kitap_adi, yayin_yili
FROM kitaplik
ORDER BY yayin_yili DESC;

/*
Kitaplik tablosundaki "Fyodor Dostoyevski" nin kitaplarinı yayın yılına göre eski olanlardan
yeni olanlara dogru siralayiniz...
*/
SELECT kitap_adi, yayin_yili
FROM kitaplik
WHERE yazar= 'Fyodor Dostoyevski'
ORDER BY yayin_yili ASC;

/*
Kitaplik tablosundaki yazar isimlerini ve  kitaplarinı dogal siralayiniz...
*/
SELECT yazar
FROM kitaplik
ORDER BY yazar ASC;

SELECT yazar, kitap_adi
FROM kitaplik
ORDER BY yazar ASC, kitap_adi ASC;





