module Models.Team where

import Models.Character

newtype Team
  = Team (Array Character)
