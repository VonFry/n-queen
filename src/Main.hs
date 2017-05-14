module Main where

import qualified NQueen

import Options.Applicative
import Data.Semigroup ((<>))

data CmdParam = CmdParam { n :: Int }

cmdParam :: Parser CmdParam
cmdParam = CmdParam
        <$> argument auto
            (  value 8
            <> showDefault
            <> metavar "N")

opts = info (cmdParam <**> helper)
    ( fullDesc
    <> progDesc "Print n-queen result, default N is 8."
    <> header "hello - it is a execise program" )

main :: IO ()
main = do
    opt <- execParser opts
    NQueen.run $ n opt
