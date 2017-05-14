module NQueen (
    run
  ) where

-- | Run n-queen program
run :: Int -> IO ()
run n = print $ queensN n


safe
  :: Int   -- ^ 新的横坐标
  -> [Int] -- ^ 前m行的摆放
  -> Int   -- ^ 递归时的循环变量
  -> Bool
safe _ [] _ = True
safe x (x1:xs) n =
  x /= x1
  && x /= x1 + n && x /= x1 -n
  && safe x xs (n + 1)

queensN :: Int -> [[Int]]
queensN n = queens n
  where
    queens 0 = [[]]
    queens m = [x : y | y <- queens (m - 1), x <- [1..n], safe x y 1]
