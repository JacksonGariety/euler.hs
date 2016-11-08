import Data.Numbers.Primes
import Data.List
import Data.Ord

-- this one is forwards
fromDigits :: Integral x => [x] -> x
fromDigits = foldl (\b a -> (10 * b) + a) 0

-- this one is fowards
toDigits :: Integral x => x -> [x]
toDigits 0 = []
toDigits x = toDigits (a) ++ [b]
  where (a, b) = quotRem x 10

replaceDigits ds xs = map replace [0..9]
  where replace n = map (\(i, a) -> if elem i ds
                                    then n
                                    else a) (zip [1..(length xs)] xs)

length' n = length (show n)

primeDigitReplacements n = last . sortBy (comparing length) . concat $ take 20000 primeFamilies
  where primeFamilies = [families . toDigits $ x | x <- primes]
        seqs ls = tail $ subsequences [1..(length ls)]
        families xs = [filter isPrime . map fromDigits $ replaceDigits ds xs | ds <- (seqs xs)]

main = print . primeDigitReplacements $ 7
