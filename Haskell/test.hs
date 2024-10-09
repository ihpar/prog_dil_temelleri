main = do
  putStr "Merhaba"
  putStrLn " adın ne?"
  ad <- getLine
  putStrLn $ "Memnun oldum " ++ ad
  putStrLn "Kaç yaşındasın?"
  yas :: Int <- readLn
  putStrLn ("Demek " ++ show (2024 - yas) ++ " doğumlusun.")
