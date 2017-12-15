module Data.String.Format.Quick (format) where

import Data.Record.Unsafe (unsafeGet, unsafeHas)
import Data.String.Regex (replace')
import Data.String.Regex.Flags (global)
import Data.String.Regex.Unsafe (unsafeRegex)
import Type.Row.Homogeneous (class Homogeneous)

-- | A quick and dirty (yet safe) format string.
-- |
-- | Example:
-- | ```purescript
-- | format "I like ${adj} ${noun}." {adj: "stinky", noun: "durians"}
-- |   == "I like stinky durians."
-- | ```
-- |
-- | Though I have yet to prove it to the type system, the `Homogeneous`
-- | constraint below should make these operations safe.

format :: forall r. Homogeneous r String => String -> Record r -> String
format s r = replace' repRE repFn s
  where
  repRE = unsafeRegex "\\$\\{([a-z_].+?)\\}" global

  repFn _ [match] | unsafeHas match r = unsafeGet match r
  repFn _ _ = ""
