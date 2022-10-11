-- main = putStrLn "Hello World!"

{-
-- Primitive Types
import Text.Printf
b :: Bool
b = True

c :: Char
c = 'A'

s :: String
s = "Hello"

i :: Integer
i = 92233720368547758079223372036854775807

si :: Int
si = 9223372036854775807

f :: Float
f = 3.888888888888889

d :: Double
d = 3.888888888888889

main :: IO()
main = printf "%s %c %s %d %d %f %f" (show b) c s i si f d
-}

{- 
-- Aritmetik Islemler
a :: Int
a = 22
b :: Int
b = 5

c :: Int
c = a * b

d :: Int
d = a + b

e :: Int
e = a - b

f :: Float
f = fromIntegral a / fromIntegral b

g = mod a b

h = a ^ b

main :: IO()
main = print h
-}

{-
-- Fonksiyonlar
import Text.Printf

inc :: Int -> Int
inc x = x + 1

a = inc 3

topla :: Int -> Int -> Int
topla a b = a + b

b = topla 3  5

yas :: Int -> String
yas 17 = "Genc"
yas 35 = "Orta"
yas 52 = "Olgun"
yas _ = "Bilemedim"

y17 = yas 17
y55 = yas 55 

yas2 :: Int -> String
yas2 x 
  | x == 17 = "Genc"
  | x == 35 = "Orta"
  | x == 52 = "Olgun"
  | otherwise = "Bilemedim"

yo = yas2 52

fact :: Int -> Int
fact 0 = 1
fact x = x * fact (x-1)

c = fact 5

fib :: Int -> Int -- 1, 1, 2, 3, 5, 8, 13, ...
fib x 
  | x == 1 = 1
  | x == 2 = 1
  | otherwise = fib (x-1) + fib (x-2)

d = fib 6

main = do
  print a
  print b
  print y17
  print y55
  print yo
  print c
  print d
  print $ fib 8
-}