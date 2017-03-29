module ListAdv exposing (..)


splice : Int -> Int -> List a -> List a
splice start deleteCount list =
    (List.take start list) ++ (List.drop (start + deleteCount) list)


indexedFilter : (Int -> a -> Bool) -> List a -> List a
indexedFilter f xs =
    xs
        |> ((\int a -> ( int, a )) |> List.indexedMap)
        |> List.filterMap
            (\( int, a ) ->
                if f int a then
                    Just a
                else
                    Nothing
            )
