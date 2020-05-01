module Main where

import           Data.Maybe
import           Prelude                 hiding ( last )
import           System.Exit
import           Control.Monad
import           Data.Monoid
import           Colourista
import           Data.Text                      ( Text )
import qualified Data.Text                     as T
import qualified Data.Text.IO                  as T
import           Question

nag :: IO ()
nag = redMessage "I’m afraid you’re mistaken."

status :: Bool -> Text
status False = formatWith [red] "✘ "
status True  = formatWith [green] "✓ "

lambda :: Text
lambda = formatWith [magenta] "λ "

assert :: Eq a => Show a => Text -> [a] -> Maybe a -> IO Bool
assert message input expected = do
  T.putStr $ lambda
  T.putStrLn message
  unless isPassed nag
  T.putStr $ status isPassed
  print output
  putStrLn mempty
  pure isPassed
 where
  output   = last input
  isPassed = output == expected

assertions :: [IO Bool]
assertions =
  [ assert "last [1, 2, 3, 4]"    [1, 2, 3, 4 :: Int] (Just 4)
  , assert "last ['x', 'y', 'z']" ['x', 'y', 'z']     (Just 'z')
  ]

main :: IO ()
main = do
  All isPassed <- foldMap All <$> sequence assertions
  unless isPassed exitFailure
