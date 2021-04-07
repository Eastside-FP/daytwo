import Prelude

-- This assignment asks you to write a number of Haskell functions.
--
-- I'd prefer you to use the
--
--    myfunc a b = ...
--
-- form rather than 
--
--    myfunc = \a b -> ...
--
-- Submit this via a PR when you're done.
--
-- If you have any questions, please contact me (pragdave@gmail.com) and we'll
-- set up a chat.

-------
-- 1 --
-------

-- write a function `reciprocal` that takes a single parameter and
-- returns the reciprocal of that number. This should make (1a) and (1b) 
-- correct in the main function at the end

reciprocal x = 1/x


-------
-- 2 --
-------

-- write a function square that squared a number. Uncomment (2) below
-- and check it works.

square x = x*x

-------
-- 3 --
-------

-- use the two previous functions to write a new function, `oneOverXSquared`,
-- that returns the reciprocal of the square of its parameter
-- (that it, 1 / x²). Make sure (3) works.

oneOverXSquared x = reciprocal (square x)

-------
-- 4 --
-------

-- The notation `[1..]` represents an infinite list of integers: 1, 2, 3, …
-- We've already seen the `map` function, that takes a function and a list
-- and returns the result of applyuing that function to elemets of the list.
--
-- Write a function that generates an infinite list of 1/x² for x = 1, 2, 3,…
-- Call the function `series`. (4) below should now be correct

series = map oneOverXSquared [1..]

-------
-- 5 --
-------

-- The `take` built-in function returns the first `n` elements of a collection:
--
--      take 5 [1..]    => [ 1, 2, 3, 4, 5 ]
--
-- The `sum` function returns the sum of a collection
--
--      sum [ 1, 2, 3, 4, 5 ]   => 15
--      (could also have written: sum [1..5])
--
--  Write a function `sumOfFirst` that takes a number and a (possibily infinite)
--  list of numbers and returns the sum of the first n elements
--
--       sumOfFirat 5 [1..]     => 15
--
--  Uncomment (5) to verify

sumOfFirst x l = sum(take x l)
-------
-- 6 --
-------

-- This is just for fun. I've supplied the function `eulerSum`
-- which uses the code you've written above to calculate 6 times the
-- sum of the first `n` reciprocals of squares, and then returns the square
-- root of that value
--
-- Play with this function in ghci, passing in powers of 10 (1, 10, 100, ...) 
-- as the parameter. What value does it converge to? 

eulerSum n = sqrt $ 6 * sumOfFirst n series

-- converges to pi

main = do
  print ("1a. Should be 0.5: " ++ (show $ reciprocal 2))
  print ("1b. Should be 4.0: "   ++ (show $ reciprocal 0.25))

  print ("2. Should be 25: " ++ (show $ square 5))

  print ("3. Should be 0.25: " ++ (show $ oneOverXSquared 2))

  print ("4. Should be [1.0, 0.25, 0.11.., 0.0625]: " ++ (show $ take 4 series))

  print ("5. Should be roughly 1.4236: " ++ ( show $ sumOfFirst 4 series))
