# Fraction 2 Decimal

## Question

>Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
>
>If the fractional part is repeating, enclose the repeating part in parentheses.
>
>If multiple answers are possible, return any of them.
>
>It is guaranteed that the length of the answer string is less than 10000 for all the given inputs.
>
>**Examples**
>
>_Example 1:_
>
>Input: numerator = 1, denominator = 2
>Output: "0.5"
>
>_Example 2:_
>
>Input: numerator = 2, denominator = 1
>Output: "2"
>
>_Example 3:_
>
>Input: numerator = 4, denominator = 333
>Output: "0.(012)"
>
>**Constraints**:
>
>- -2^31 <= numerator, denominator <= 2^31 - 1
>- denominator != 0

## Solution

We first prepare a table with remainders & their respective quotients. We also prepare a bitmap & a position map to track the remainders which have been visited before.
We now perform the division operation using these tables and store our updates in the 2 maps.
Once we hit a repeating remainder, we can use the position map to insert the brackets at the correct position in our answer string.

For normal cases, we simply break the loop when the remainder becomes 0.

We also handle cases where there is no fractional part.

## To-do

- [] Handle negative numbers
- [] Include GCD to simplify fractions
