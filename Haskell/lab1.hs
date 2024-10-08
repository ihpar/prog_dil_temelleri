import Text.Printf
import Data.List

asal :: [Int]
asal = [2, 3, 5, 7]

asalDevam :: [Int]
asalDevam = asal ++ [11, 13, 17]

tekler :: [Int]
tekler = 3 : 5 : 7 : []

duzgunTekler = 1 : tekler

duzgunTeklerElemanSayisi = length duzgunTekler

harfler = ['i', 'h', 'p']
revHarfler = reverse harfler

harflerBosMu = null harfler

ikinciAsalSayi = asalDevam !! 2

ilkAsal = head asalDevam
sonAsal = last asalDevam

sonHaricAsallar = init asalDevam

ilk3Asal = take 3 asalDevam
ilk3HaricAsallar = drop 3 asalDevam

yediAsalMi = 7 `elem` asalDevam -- tek tırnak değil, backtick

maxAsal = maximum asalDevam
minAsal = minimum asalDevam

myList :: [Int]
myList = [1, 2, 3, 4]

toplam = sum myList
carpim = product myList

onaKadarSayilar = [0..10]

yirmiyeKadarCiftler = [2, 4..20]

kucukHarfler = ['a'..'z']

tekSayilar = [1, 3..] -- Sonsuz liste. 
-- "print tekSayilar" statement'ı ekrana sonsuza kadar sayı bastırır 

ilk5TekSayininKaresi = take 5 [x ^ 2 | x <- tekSayilar]

otuzaKadar3unKatlari = [x | x <- [1..30], x `mod` 3 == 0]

karesi8inTamKatiOlan4Sayi = take 4 [x | x <- [1, 2..], (x ^ 2) `mod` 8 == 0]

karesiCift10danKucukSayilar = [x | x <- [1..9], even (x ^ 2)]

ucVe5eTamBolunen30aKadar = [x | x <- [1..30], x `mod` 3 == 0, x `mod` 5 == 0]

ucVeya5eTamBolunen30aKadar = [x | x <- [1..30], x `mod` 3 == 0 || x `mod` 5 == 0]

siraliListe = sort [3, 1, 2, 4, 0]

kartezyenCarpim :: [(Int, Char)]
kartezyenCarpim = [(x, y) | x <- [1, 2, 3], y <- ['a', 'b']]

(x:xs) = [1, 2, 3, 4]

(y:z:rest) = [1, 2, 3, 4, 5]

hepsiTekMi :: [Int] -> Bool
hepsiTekMi [] = False
hepsiTekMi [a] = (a `mod` 2) == 1
hepsiTekMi (x: xs) = (x `mod` 2 == 1) && hepsiTekMi xs

tersCevir :: [a] -> [a]
tersCevir [] = []
tersCevir [a] = [a]
tersCevir (x:xs) = tersCevir xs ++ [x]

esitMi = [1, 2, 3] == [1, 2, 3]

palindromMu :: Eq a => [a] -> Bool
palindromMu x = x == tersCevir x

main :: IO()
main = do
  print asalDevam
  print tekler
  print duzgunTekler
  print duzgunTeklerElemanSayisi
  print revHarfler
  print harflerBosMu
  print ikinciAsalSayi
  printf "%d %d\n" ilkAsal sonAsal
  print sonHaricAsallar
  print ilk3Asal
  print ilk3HaricAsallar
  print yediAsalMi
  printf "max asal: %d, min asal: %d\n" maxAsal minAsal
  printf "%d %d\n" toplam carpim
  print onaKadarSayilar
  print yirmiyeKadarCiftler
  print kucukHarfler
  print ilk5TekSayininKaresi
  print karesi8inTamKatiOlan4Sayi
  print otuzaKadar3unKatlari
  print karesi8inTamKatiOlan4Sayi
  print karesiCift10danKucukSayilar
  print ucVe5eTamBolunen30aKadar
  print ucVeya5eTamBolunen30aKadar
  print siraliListe
  print kartezyenCarpim
  printf "x: %s, xs: %s\n" (show x) (show xs) 
  printf "y: %s, z: %s, rest: %s\n" (show y) (show z) (show rest) 
  print (hepsiTekMi [1, 3, 5])
  print (hepsiTekMi [1, 3, 4, 5])
  print $ tersCevir [1, 2, 3, 4]
  print $ tersCevir [1, 2, 3, 4, 5]
  print (tersCevir "Ali")
  print esitMi
  print $ palindromMu "kütük"
  print $ palindromMu "kütüks"