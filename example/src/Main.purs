module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)

data Fruit = Apple | Banana | Grape Int

type MyRecord =
  { "hello" :: Int
  , yup :: String
  }

derive instance fruitEq :: Eq Fruit

-- comment
{- comment -}
-- | doc comment
main :: Effect Unit
main = do
  let _ = 123
  log message
  where
    message = "Hello sailor!"
    yeah = if true then false else true
