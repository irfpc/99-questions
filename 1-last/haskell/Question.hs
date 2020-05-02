module Question
  ( last
  )
where

import           Prelude                 hiding ( last )

-- | Find the last element of a list.
--
-- Examples:
--
-- >>> last []
-- Nothing
--
-- >>> last [1,2,3,4]
-- Just 4
--
-- >>> last ['x', 'y', 'z']
-- Just 'z'
last :: [a] -> Maybe a
last = undefined
