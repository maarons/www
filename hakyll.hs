{-# LANGUAGE OverloadedStrings #-}

import Prelude hiding (id)
import Control.Category (id)
import Control.Arrow ((>>>), (&&&), (>>^), arr)

import Hakyll

main :: IO ()
main = hakyll $ do
    { match (regex "^static/.*$") $ do
        { route idRoute
        ; compile copyFileCompiler
        }

    ; match "src/robots.txt" $ do
        { route $ constRoute "robots.txt"
        ; compile copyFileCompiler
        }

    ; match "layout/*.html" $ compile templateCompiler

    ; match "layout/*.scss" $ do
        { route $ setExtension ".css"
        ; compile $ cssCompiler
        }

    ; match (regex "^src/.*\\.js$") $ do
        { route $ gsubRoute "^src/" (const "")
        ; compile copyFileCompiler
        }

    ; match (regex "^src/.*\\.scss$") $ do
        { route $ composeRoutes
            (gsubRoute "^src/" (const ""))
            (setExtension ".css")
        ; compile cssCompiler
        }

    ; match (regex "^src/.*\\.html$") $ do
        { route $ gsubRoute "^src/" (const "")
        ; compile $ readPageCompiler
            >>> applyTemplateCompiler "layout/main.html"
            >>> relativizeUrlsCompiler
        }

    ; match (regex "^src/.*\\.markdown$") $ do
        { route $ composeRoutes
            (gsubRoute "^src/" (const ""))
            (setExtension ".html")
        ; compile $ pageCompiler
            >>> applyTemplateCompiler "layout/main.html"
            >>> relativizeUrlsCompiler
        }
    }


cssCompiler :: Compiler Resource String
cssCompiler = getResourceString
    >>> unixFilter "scss" ["-s"]
    >>> arr compressCss
    >>> relativizeCssUrlsCompiler

-- Like `relativizeUrlsCompiler` but for strings instead of pages.
relativizeCssUrlsCompiler :: Compiler String String
relativizeCssUrlsCompiler = getRoute &&& id >>^ uncurry relativize
    where
        relativize :: Maybe FilePath -> String -> String
        relativize Nothing = id
        relativize (Just r) = replace
            "url(\"/"
            ("url(\"" ++ (toSiteRoot r) ++ "/")

replace :: String -> String -> String -> String
replace before after str  = replace' [] str
    where
        replace' s [] = reverse s
        replace' r s
            | take (length before) s == before = replace'
                (foldl (flip (:)) r after)
                (drop (length before) s)
            | otherwise = replace' ((head s):r) (tail s)
