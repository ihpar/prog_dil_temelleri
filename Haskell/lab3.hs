-- where & let
a = b + c
  where
    b = 1
    c = 2

fib :: Int -> Int
fib x =
  if x == 1
    then 1
    else
      if x == 2
        then 1
        else a + b
  where
    a = fib (x - 1)
    b = fib (x - 2)

birFazlasininKarelerininToplami :: [Int] -> Int
birFazlasininKarelerininToplami xs = toplami (kareleri (birFazlasi xs))
  where
    birFazlasi xs = map (\x -> x + 1) xs
    kareleri xs = map (\x -> x ^ 2) xs
    toplami xs = foldr (+) 0 xs

karesinin2Kati x =
  let y = x * x
   in y * 2

-- Type declaration: Mevcut tiplere yeni isim atar.
-- Type declaration'lar recursive olamaz.

type Coord = (Float, Float)

vecNorm :: Coord -> Coord -> Float
vecNorm (x0, y0) (x1, y1) = sqrt ((x1 - x0) ^ 2 + (y1 - y0) ^ 2)

-- Data type declaration: Yeni veri tipleri tanimlar
-- data Name = Constructor1 <args> | Constructor2 <args> | ...

data Status = Basarili | Basarisiz | Beklemede
  deriving (Eq, Show)

tersStatus :: Status -> Status
tersStatus x
  | x == Basarili = Basarisiz
  | x == Basarisiz = Basarili
  | otherwise = Beklemede

data Islem = Topla Int Int | Carp Int Int

hesapla :: Islem -> Int
hesapla (Topla a b) = a + b
hesapla (Carp a b) = a * b

data Sekil = Daire Float | Dikdortgen Float Float

alanHesapla :: Sekil -> Float
alanHesapla (Daire r) = pi * (r ^ 2)
alanHesapla (Dikdortgen w h) = w * h

data Sek = Circ Coord Float | Rect Coord Coord

printSekil :: Sek -> String
printSekil (Circ (x, y) r) =
  show x
    ++ ", "
    ++ show y
    ++ " merkezli, alani "
    ++ show (alanHesapla (Daire r))
    ++ " olan bir daire"
printSekil (Rect (x0, y0) (x1, y1)) =
  show x0
    ++ ", "
    ++ show y0
    ++ " ve "
    ++ show x1
    ++ ", "
    ++ show y1
    ++ " koordinatlarinda, alani "
    ++ show (alanHesapla (Dikdortgen (abs (x0 - x1)) (abs (y0 - y1))))
    ++ " olan bir dikdortgen"

data LinList a = Nil | Elem a (LinList a)
  deriving (Show)

ll :: LinList Int
ll = Nil

ll2 :: LinList Int
ll2 = Elem 1 (Elem 2 (Elem 3 (Nil)))

llHead :: LinList a -> a
llHead (Elem a _) = a

llTail :: LinList a -> LinList a
llTail Nil = Nil
llTail (Elem _ rest) = rest

llInsert :: a -> LinList a -> LinList a
llInsert a ll = Elem a ll

llAppend :: a -> LinList a -> LinList a
llAppend a Nil = Elem a Nil
llAppend a ll = llInsert (llHead ll) (llAppend a (llTail ll))

main = do
  print $ fib 6
  print $ karesinin2Kati 3
  print $ birFazlasininKarelerininToplami [1, 2, 3]
  print $ vecNorm (0, 0) (3, 4)
  print $ tersStatus Basarisiz
  print $ hesapla (Topla 9 8)
  print $ alanHesapla (Daire 1)
  print $ printSekil (Rect (3, 5) (2, 2))
  print "ll:"
  print ll
  print "ll2:"
  print ll2
  print "head of (Elem 3 (Elem 4 (Elem 5 Nil))):"
  print $ llHead (Elem 3 (Elem 4 (Elem 5 Nil)))
  print "tail of (Elem 3 (Elem 4 (Elem 5 Nil))):"
  print $ llTail (Elem 3 (Elem 4 (Elem 5 Nil)))
  print "insert 2 to (Elem 3 (Elem 4 (Elem 5 Nil))):"
  print $ llInsert 2 (Elem 3 (Elem 4 (Elem 5 Nil)))
  print "append 7 to (Elem 3 (Elem 4 Nil)):"
  print $ llAppend 7 (Elem 3 (Elem 4 Nil))
