module Models.Task where

import Prelude

-- TODO
-- - add a description field
-- - add category of tasks
data Task
  = Task { name :: String
         , pv :: Int
         , remainingLife :: Int
         }

derive instance eqTask :: Eq Task
