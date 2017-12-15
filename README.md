# purescript-quick-format

Quick and dirty (yet safe) format strings for purescript.

## Usage

```purescript
import Data.String.Format.Quick (format)

format "I like ${adj} ${noun}." {adj: "stinky", noun: "durians"}
  == "I like stinky durians."
```

Missing record attributes are replaced by an empty string:

```purescript
import Data.String.Format.Quick (format)

format "Can't find ${missing}." {} == "Can't find ."
```

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-quick-format).
