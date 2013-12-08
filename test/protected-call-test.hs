import qualified Scripting.Lua as Lua

test :: Int -> IO ()
test x = print $ "Hello world " ++ (show x)

main :: IO ()
main = do
    l <- Lua.newstate
    Lua.registerhsfunction l "test" test

    Lua.loadstring l "test(5)" "OK"
    ret <- Lua.pcall l 0 0 0
    print ret

    Lua.loadstring l "test()" "NOT OK"
    ret <- Lua.pcall l 0 0 0
    print ret

    Lua.close l
