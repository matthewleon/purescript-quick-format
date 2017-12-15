module Data.String.Format.Quick (format) where

import Data.Record.Unsafe (unsafeGet, unsafeHas)
import Data.String.Regex (regex, replace')
import Data.String.Regex.Flags (global)
import Data.String.Regex.Unsafe (unsafeRegex)
import Partial.Unsafe (unsafePartial)
import Type.Row.Homogeneous (class Homogeneous)

-- | A quick and dirty (yet safe) format string.
-- |
-- | Example:
-- | ```purescript
-- | format "I like ${adj} ${noun}." {adj: "stinky", noun: "durians"}
-- |   == "I like stinky durians."
-- | ```

format :: forall r. Homogeneous r String => String -> Record r -> String
format s r = replace' repRE (unsafePartial repFn) s
  where
  repRE = unsafeRegex "\\$\\{([a-z_].+?)\\}" global

  repFn :: Partial => String -> Array String -> String
  repFn _ [match] | unsafeHas match r = unsafeGet match r
