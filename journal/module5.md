# Functional Programming Reflection - Wyatt Rose

**Co-leaders:** Michael Pelitera and Wyatt Rose

**Team:** CPSC 332 – Team B

In [Module 3](module3.md), we used a while loop to allow users to correct an invalid mileage reading. In [Module 4](module4.md), we proposed Java classes to handle each validation rule. For this module, we could add some functional programming features without changing how our language currently works. We propose using pure functions for individual validation checks while keeping our imperative approach for user input and error handling.

## Functional Features

  Pure functions could help us reuse our validation rules without changing the existing values. For example, 
our validate(mileage, 0, 500000); command could use a function that takes the mileage and range limits, then returns true or false. 
The function would always return the same result when given the same values.

  Immutability would also be useful for keeping validated information from being accidentally changed. However, we would not make every 
variable immutable because our Module 3 mileage program needs to update the mileage each time the user enters a new reading.

## Recursion example

  One example where recursion could be useful is checking the mileage of multiple vehicles. 
Instead of creating a separate loop to count valid readings, we could use a recursive function:

```text
     function countValid(readings, index) {
         if (index >= length(readings)) {
             return 0;
         }
         if (validMileage(readings[index])) {
             return 1 + countValid(readings, index + 1);
         }
         return countValid(readings, index + 1);
     }
```

  The function checks one mileage reading before calling itself to check the next. Once it reaches the end of the list 
it returns the number of valid readings. This could be useful for our language if it eventually supports validating multiple 
vehicle records instead of one at a time.

## Implementation Challenges
  The main challenge would be adding functional features without making our language too complicated. Recursion would require us to 
support function calls and return values, while higher order functions would require passing functions as arguments.
Our Module 4 rule design already uses Java classes for validation. Adding pure functions could make some checks easier to reuse 
but we would keep our current imperative approach to avoid scope creep or unnecesary complication in the project.