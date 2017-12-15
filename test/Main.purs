module Test.Main where


import Prelude

import Control.Monad.Eff (Eff)
import Data.String.Format.Quick (format)
import Test.Assert (ASSERT, assert)

main :: forall e. Eff (assert :: ASSERT | e) Unit
main = do
  assert $ format "I like ${adj} ${noun}." {adj: "stinky", noun: "durians"}
    == "I like stinky durians."
  assert $ format "Can't find ${missing}." {} == "Can't find ."
