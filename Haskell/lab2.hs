import Data.List

squared :: Num a => a -> a
squared x = x ^ 2

-- Higher order functions
-- Haskell'de fonksiyonlar 1st class yapılardır
-- Bir fonksiyona argüman olarak geçilebilirler
-- Bir fonksiyondan return edilebilirler
-- bir değişkene atanabilirler

arttir x = x + 1

uygula :: (Int -> Int) -> Int -> Int
uygula f x = f x

ucun1Fazlasi = uygula arttir 3

ucunuCarp :: Num a => a -> a -> a -> a
ucunuCarp a b c = a * b * c

ikiyleDigerIkisiniCarp :: Integer -> Integer -> Integer
ikiyleDigerIkisiniCarp = ucunuCarp 2
ucBesIki = ikiyleDigerIkisiniCarp 3 5

karesi :: Int -> Int
karesi x = x ^ 2

ucUygula :: (Int -> Int) -> Int
ucUygula fun = fun 3 
ucunKaresi = ucUygula karesi

topla x y = x + y
besleTopla = topla 5
yediArtiBes = besleTopla 7

birlestirUygula :: Num a => (a -> a -> a) -> [a] -> [a] -> [a]
birlestirUygula f xs [] = []
birlestirUygula f [] ys = []
birlestirUygula f (x:xs) (y:ys) = f x y : birlestirUygula f xs ys

ikisiniTopla a b = a + b

ikiliToplamlar = birlestirUygula ikisiniTopla [1, 2, 3] [4, 5, 6]

-- map
squaredList :: Num b => [b] -> [b]
squaredList l = map squared l 
kareler = squaredList [1..4]

listeyi5leTopla = map besleTopla
besFazlasi = listeyi5leTopla [1..5]

-- anonim fonksiyonlar (lambda )
ciftler = map (\x -> x * 2) [1..10]
ciftler2 = map (*2) [1..10]

dordunTamKati x = x `mod` 4 == 0
dortdunKatlari = map dordunTamKati [1..30]

-- filter
dordunKatiSayilar = filter dordunTamKati [1..30]

sadeceHarfler = filter (\x -> x `elem` ['a'..'z'] || x `elem` ['A'..'Z']) ['1', 'S', 'a', '5', 'b']

-- Bileske Fonksiyonlar f(g(x)) = (f . g) (x)
sirali = sort [5, 1, 2] -- [1, 2, 5]

tersSirala :: [Int] -> [Int]
tersSirala = reverse . sort

tersSirali = tersSirala [5, 1, 2]

-- Folding
-- JS: Reduce
-- foldr fun a [x1, x2, ..., xn] = fun x1 (fun x2 (fun x3 (... fun xn a)))

ucArtiBes = (+) 3 5

toplamlar = foldr (+) 0 [1, 2, 3] -- 1 + (2 + (3 + 0))

hepsiDogruMu = foldr (&&) True [True, 5 == 7]

fact x = foldr (*) 1 [1..x]
besFact = fact 5

yedilerinSayisi = foldr (\x sayi -> if x == 7 then sayi + 1 else sayi) 0 [3, 7, 1, 7, 2]
-- f 3 (f 7 (f 1 (f 7 (f 2 0))))

carpimlar = foldl (*) 1 [3, 5, 7] -- ((1 * 3) * 5) * 7

tersi = foldl (\acc x -> x : acc) [] [1, 2, 3] -- f (f (f [] 1) 2) 3

main = do
  print ucun1Fazlasi
  print kareler
  print ucBesIki
  print ucunKaresi
  print yediArtiBes
  print ikiliToplamlar
  print besFazlasi
  print ciftler
  print ciftler2
  print dortdunKatlari
  print dordunKatiSayilar
  print sadeceHarfler
  print sirali
  print tersSirali
  print toplamlar
  print hepsiDogruMu
  print ucArtiBes
  print besFact
  print yedilerinSayisi
  print carpimlar
  print tersi