module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Module123 as Module123

data Fruit = Apple | Banana | Grape Int

type MyRecord =
  { "hello" :: Int
  , yup :: String
  }

derive instance fruitEq :: Eq Fruit

yup :: Module123.Hello123
yup = ?sddf Module123.exactly123

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
