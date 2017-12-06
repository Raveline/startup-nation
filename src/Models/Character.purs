module Models.Character where

data Category
  = Developper

data Character
  = Character { name :: String
              , category :: Category
              , attack :: Int
              , defense :: Int
              , pv :: Int
              , remainingLife :: Int
              , velocity :: Int
              }
