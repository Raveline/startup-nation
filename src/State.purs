module State where

import Prelude
import Data.Array (head, tail, dropWhile, takeWhile, last)
import Data.Maybe (Maybe(..), maybe)
import Control.Bind ((>=>))

import Models.Team (Team(..))
import Models.Character (Character(..), Category(..))
import Models.Task (Task(..))

type State
  = { step :: Step
    , fightState :: FightState
    }

initialState :: State
initialState = { step: Home
               , fightState: initialFightState
               }

data Step
  = Home
  | Fight
  | GameOver

derive instance eqStep :: Eq Step

type FightState
  = { team :: Team
    , waitingCharacters :: Array Character
    , actions :: Array Action
    , taskList :: Array Task
    , selectedTarget :: Maybe Task
    }

data Action
  = Attack Character Task

activeCharacter :: FightState -> Maybe Character
activeCharacter = head <<< _.waitingCharacters

chooseTarget :: FightState -> FightState
chooseTarget state = state { waitingCharacters = waitingChar
                           , actions = state.actions <> newActions
                           , selectedTarget = head state.taskList
                           }
  where
    waitingChar = maybe [] (\x -> x) $ tail state.waitingCharacters

    newActions = maybe [] (\x -> [x]) newAction

    newAction = do
      c <- head state.waitingCharacters
      t <- state.selectedTarget
      pure $ Attack c t

selectNextTarget :: FightState -> FightState
selectNextTarget s = s { selectedTarget = nextTarget s }

selectPrevTarget :: FightState -> FightState
selectPrevTarget s = s { selectedTarget = previousTarget s }

nextTarget :: FightState -> Maybe Task
nextTarget { taskList, selectedTarget } = case selectedTarget of
                                               Nothing -> head taskList
                                               Just t -> elemAfter t taskList

previousTarget :: FightState -> Maybe Task
previousTarget { taskList, selectedTarget } = case selectedTarget of
                                                   Nothing -> head taskList
                                                   Just t -> elemBefore t taskList

elemAfter :: forall a. Eq a => a -> Array a -> Maybe a
elemAfter elem xs = defaultToFirst <<< secondHead $ dropWhile (_ /= elem) xs
  where
    secondHead :: Array a -> Maybe a
    secondHead = tail >=> head

    defaultToFirst :: Maybe a -> Maybe a
    defaultToFirst = maybe (head xs) Just

elemBefore :: forall a. Eq a => a -> Array a -> Maybe a
elemBefore elem xs = defaultToLast <<< last $ takeWhile (_ /= elem) xs
  where
    defaultToLast :: Maybe a -> Maybe a
    defaultToLast = maybe (last xs) Just

initialFightState :: FightState
initialFightState = { team
                    , waitingCharacters: [ dev1, dev2 ]
                    , actions: []
                    , taskList
                    , selectedTarget: head taskList
                    }

team :: Team
team = Team [ dev1, dev2 ]

dev1 :: Character
dev1 = Character { name: "Tom"
                 , category: Developper
                 , attack: 2
                 , defense: 2
                 , pv: 10
                 , remainingLife: 10
                 , velocity: 0
                 }

dev2 :: Character
dev2 = Character { name: "Hipster"
                 , category: Developper
                 , attack: 2
                 , defense: 2
                 , pv: 10
                 , remainingLife: 10
                 , velocity: 0
                 }

taskList :: Array Task
taskList = [ fixBug
           , meetInvestors
           , putInProd
           ]

fixBug :: Task
fixBug = Task { name: "Fix bug", pv: 2, remainingLife: 2 }

meetInvestors :: Task
meetInvestors = Task { name: "Meet investors", pv: 2, remainingLife: 2 }

putInProd :: Task
putInProd = Task { name: "Put in production", pv: 2, remainingLife: 2 }
