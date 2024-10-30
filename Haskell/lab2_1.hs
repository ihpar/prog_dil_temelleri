import Data.List

bastaki (x : xs) = x

sondaki [x] = x
sondaki (x : xs) = sondaki xs

tersi [x] = [x]
tersi (x : xs) = tersi xs ++ [x]

bosMu [] = True
bosMu (x : xs) = False

ninciElem (x : xs) n
  | n == 0 = x
  | otherwise = ninciElem xs (n - 1)

elemaniMi x [] = False
elemaniMi x (y : xs)
  | x == y = True
  | otherwise = elemaniMi x xs

enBastanAl n (x : xs)
  | n == 0 = []
  | otherwise = x : enBastanAl (n - 1) xs

sonHarici [x] = []
sonHarici (x : xs) = x : sonHarici xs

listedenCikar 0 l = l
listedenCikar n (x : xs) = listedenCikar (n - 1) xs

enBuyugu [x] = x
enBuyugu (x : y : xs)
  | x > y = enBuyugu (x : xs)
  | otherwise = enBuyugu (y : xs)

enKucugu [x] = x
enKucugu (x : y : xs)
  | x < y = enKucugu (x : xs)
  | otherwise = enKucugu (y : xs)

toplam [x] = x
toplam (x : xs) = x + toplam xs

carpim [x] = x
carpim (x : xs) = x * carpim xs

siraliMi [x] = True
siraliMi (x : y : xs)
  | x > y = False
  | otherwise = siraliMi (y : xs)

birKezSirala [x] = [x]
birKezSirala (x : y : xs)
  | x < y = x : birKezSirala (y : xs)
  | otherwise = y : birKezSirala (x : xs)

sirala l
  | siraliMi l = l
  | otherwise = sirala (birKezSirala l)

main = do
  print "sirala:"
  print (sirala [1, 3, 4, 5, 8, 1, 5, 4])
