{-
******* ÖDEV 1 *******

* Aşağıda 7 adet soru bulunmaktadır. Tam doğru yaptığınız her soru için 100 / 7 puan alabilirsiniz.
Ödevinizi öğrenci_no.hs şeklinde isimlendirerek tek bir dosya şeklinde gönderiniz. Örn: 123456789.hs

* Soru metinleri ve örnek input outputlar her soruda ayrı ayrı verilmiştir.

* Dosya içerisinde değişiklik yapabileceğiniz alanlar "Değiştirilebilir alan X'in başlangıcı" ve
"Değiştirilebilir alan X'in bitişi" ifadeleri arasında yer almaktadır. 
Bu alanların dışında değişiklik yapmayınız.

* Değişiklik yapılabilir alanlarda gerektiği durumlarda istediğiniz kadar yardımcı fonksiyon veya veri tipi oluşturabilirsiniz.

* Dosyayı çalıştırdığınızda test case'ler çalışacak ve olası puanınızı ekrana yazacaktır. 
Ancak bu puan son puanınız olmayabilir. Ödeviniz değerlendirilirken başka test case'ler kullanılacaktır. 
Buradaki test case'lerin amacı size yardımcı olmaktır.

* Kod paylaşımı yapan tüm taraflar dönem boyu verilen tüm ödevlerden 0 alırlar.

* Dosyayı çalışabilir halde teslim etmeniz gerekmektedir. 
İçinde yazmış olduğunuz hatalı ifadelerden dolayı çalıştırılamayan ödevler içinde doğru çözümler olsa bile 
0 alırlar (Black Box Testing).

* Ödevinizi email ile 08.11.2022 Saat 23:59'a kadar. ismail hakki parlak'a gönderiniz.
Geç gönderilen ödevler değerlendirilmeye alınmayacaktır.

* Başarılar!
-}


{-
Bir sayı listesi içindeki en büyük elemanı bulan enBuyuk isimli fonksiyonu yazınız.
ÖNEMLİ: maximum fonksiyonu kullanılamaz!!!
enBuyuk fonksiyonu boş liste için 0 hesaplamalıdır.
Örn:
  enBuyuk [] -> 0
  enBuyuk [1, 5, 2, 5] -> 5
  enBuyuk [3] -> 3
-}

enBuyuk :: [Int] -> Int
-- Değiştirilebilir alan 0'ın başlangıcı
enBuyuk [] = 0
enBuyuk [a] = a
enBuyuk [a, b] = if a < b then b else a
enBuyuk (x:y:xs) = if x > y then enBuyuk (x:xs) else enBuyuk (y:xs)
-- Değiştirilebilir alan 0'ın bitişi

{- 
1, 1, 1, 3, 5, 9, 17, 31, ... dizisinin n'inci elemanını hesaplayan ucluFibo isimli fonksiyonu yazınız.
Her eleman kendinden önceki 3 elemanın toplamına eşittir. İlk 3 eleman 1 olmalıdır.
1. eleman = 1; 2. eleman = 1; 3. eleman = 1; 4. eleman = 3; ...
örn: 
  ucluFibo 6 -> 9
  ucluFibo 7 -> 17 
-}

ucluFibo :: Int -> Int 
-- Değiştirilebilir alan 1'in başlangıcı
ucluFibo x
  | x == 1 = 1
  | x == 2 = 1
  | x == 3 = 1
  | otherwise = ucluFibo(x-1) + ucluFibo(x-2) + ucluFibo(x-3)
-- Değiştirilebilir alan 1'in bitişi

{-
sayı listesinin ortadaki elemanını bulan ortasi isimli fonksiyonu yazınız.
listede çift sayıda eleman varsa ortadaki iki elemanın aritmetik ortası hesaplanmalıdır.
boş listenin ortadaki elemanı 0'dır.
örn: 
  ortasi [] -> 0
  ortasi [1, 5, 3] -> 5
  ortasi [1, 5, 8, 3] -> 6.5
-}

ortasi :: Fractional a => [a] -> a
-- Değiştirilebilir alan 2'nin başlangıcı
ortasi [] = 0
ortasi [x] = x
ortasi [x, y] = (x + y) / 2
ortasi (x:xs) = ortasi (init xs)
-- Değiştirilebilir alan 2'nin bitişi

{-
bir pozitif tam sayiyi tam bölen pozitif tam sayilarin listesini veren tamBolenler isimli fonksiyonu yazınız.
örn:
 tamBolenler 1 -> [1]
 tamBolenler 2 -> [1, 2]
 tamBolenler 14 -> [1, 2, 7, 14]
-}

tamBolenler :: Int -> [Int]
-- Değiştirilebilir alan 3'ün başlangıcı
tamBolenler x = [y | y <- [1..x], x `mod` y == 0]
-- Değiştirilebilir alan 3'ün bitişi

{-
Bir liste içinde verilen değerden büyük tüm sayıların listesini hesaplayan buyukleriBul isimli fonksiyonu yazınız.
örn:
  buyukleriBul 5 [1, 5, 6, 7] -> [6, 7]
  buyukleriBul 12 [1, 2, 3] -> []
  buyukleriBul 1 [1, 3, 1] -> [3]
-}

buyukleriBul :: Int -> [Int] -> [Int]
-- Değiştirilebilir alan 4'ün başlangıcı
buyukleriBul a = filter (>a)
-- Değiştirilebilir alan 4'ün bitişi

{-
Bir öğrenci listesinde notu en yüksek olan öğrencinin ismini hesaplayan kimBirinci isimli fonksiyonu yazınız.
Örn:
  kimBirinci [("Ali", 50), ("Veli", 60), ("Ayse", 90), ("Fatma", 80)] -> "Ayse"
  kimBirinci [("Fatma", 80)] -> "Fatma"
-}

type Ogr = (String, Int)
kimBirinci :: [Ogr] -> String
-- Değiştirilebilir alan 5'in başlangıcı
buyukOgr :: Ogr -> Ogr -> Ogr
buyukOgr (n1, p1) (n2, p2) = if p1 > p2 then (n1, p1) else (n2, p2)
birinci :: [Ogr] -> Ogr
birinci = foldr buyukOgr ("", -1)
kimBirinci xs = fst (birinci xs) 
-- Değiştirilebilir alan 5'in bitişi

{- 
Bir liste elemanlarını iç içe listeler haline getiren icliKofte isimli fonksiyonu yazınız.
Haskell'de listeler aynı tipte elemanlardan oluşmalıdır. Örn [1, "X"] geçerli bir liste değildir. 
Bu yüzden [1, [2]] gibi bir ifade çalıştırılamaz; çünkü ilk elemanın tipi Int, ikincisinin tipi List'tir.
İç içe listeler kullanmak istersek kendi data deklarasyonumuzu yapmamız gerekir.
Aşağıda NestedList isimli bir data deklarasyonu yapılmıştır. Böylelikle [1, [2]] gibi bir listeyi:
"List [Elem 1, List [Elem 2]]" şeklinde ifade edebiliriz.
Fonksiyonunuz şu şekilde çalışmalıdır:
  icliKofte [1, 2, 3] = [1, [2, [3]]]. Ancak Haskell'de bu şekilde karışık tipte listeler kullanılamayacağı için
    sonucu List [Elem 1, List [Elem 2, List [Elem 3]]] şeklinde göstermelisiniz.

Bir NestedList'e bir eleman ekleyen yardımcı fonksiyon ekle ismiyle hazır verilmiştir. 

örn: 
  icliKofte [1, 2, 3] -> List [Elem 1, List [Elem 2, List [Elem 3]]]
  icliKofte [5] -> List[elem 5]
  icliKofte [5, 3, 7, 9] -> List [Elem 5,List [Elem 3,List [Elem 7,List [Elem 9]]]]
-}

data NestedList a = Elem a | List [NestedList a] 
                    deriving (Show, Eq)

ekle :: a -> NestedList a -> NestedList a
ekle x (List[]) = List[Elem x]
ekle x y = List [Elem x, y]

icliKofte :: [a] -> NestedList a
-- Değiştirilebilir alan 6'nın başlangıcı
icliKofte = foldr (\ x acc -> ekle x acc) (List[])
-- Değiştirilebilir alan 6'nın bitişi

-------------------------------------------
-- Ödeviniz burada bitmiştir. Tebrikler! --
-------------------------------------------

------------------------------------
-- Değiştirilemez alan baslangici --
------------------------------------

testler :: [Bool]
testler = [
    enBuyuk [1] == 1,
    enBuyuk [5, 1] == 5,
    enBuyuk [4, 4, 4] == 4,
    ucluFibo 21 == 85525,
    ucluFibo 1 == 1,
    ucluFibo 13 == 653,
    ortasi [1] == 1,
    ortasi [1, 6, 7, 7] == 6.5,
    ortasi [1, 6, 8, 7, 7] == 8,
    tamBolenler 2 == [1, 2],
    tamBolenler 21 == [1, 3, 7, 21],
    tamBolenler 24 == [1, 2, 3, 4, 6, 8, 12, 24],
    buyukleriBul 3 [3, 4, 5] == [4, 5] || buyukleriBul 3 [3, 4, 5] == [5, 4],
    buyukleriBul 1 [4, 5] == [4, 5] || buyukleriBul 1 [4, 5] == [5, 4],
    null $ buyukleriBul 4 [4],
    kimBirinci [("A", 50), ("B", 60), ("C", 55)] == "B",
    kimBirinci [("X", 10)] == "X",
    kimBirinci [("A", 90), ("B", 95), ("C", 100), ("D", 99)] == "C",
    icliKofte [8] == List [Elem 8],
    icliKofte [13, 17, 12] == List [Elem 13, List [Elem 17, List [Elem 12]]],
    icliKofte [1, 2] == List [Elem 1, List [Elem 2]]
  ]

puan :: Integer
puan = ceiling $ fromIntegral(length(filter (== True) testler)) 
  / fromIntegral(length testler) * 100
msg :: [Char]
msg = "Max alabileceginiz puan: " ++ show puan

main :: IO ()
main = do
  print msg

--------------------------------
-- Degistirilemez alan bitisi --
--------------------------------