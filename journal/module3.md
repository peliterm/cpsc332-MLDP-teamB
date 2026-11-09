# Imperative Programming Reflection – Michael Pelitera

**Co-leaders:** Michael Pelitera and Wyatt Rose  
**Team:** CPSC 332 – Team B

Our team uses one retry loop to check vehicle mileage. We keep the [three vehicle checks from Module 2](https://github.com/peliterm/cpsc332-MLDP-teamB/blob/2016e06f75e336ebaa36077d2dda0577fe468736/Module2/Test1.txt): the entry must be present, be a number, and fall between 0 and 500,000, including both limits. In the inspection apps I support, a recorded zero and a blank field mean different things. Our language makes that distinction here: zero is valid mileage, while a blank field prompts the user to enter a reading.

## Main example

```text
main() {
    let mileage;
    let accepted = false;

    while (!accepted) {
        mileage = input("Enter mileage: ");
        required(mileage);
        type(mileage, number);
        validate(mileage, 0, 500000);

        if (hasErrors()) {
            reportErrors();
        } else {
            accepted = true;
        }
    }
    print("Mileage accepted");
}
```

## Control flow and sequence

We use a `while` loop to repeat the checks and an `if/else` to decide whether to prompt again. Statements run in order from the start of `main`. We set `accepted` to false before the loop so the program prompts at least once. If a check fails, `reportErrors()` tells the user what to correct. If all three pass, the `else` branch sets `accepted` to true and the loop ends. Braces group statements, and semicolons end individual commands. We put the final `print` after the loop so “Mileage accepted” appears only once.

## State and memory

`mileage` and `accepted` are local to `main`. Each call to `input` replaces the previous mileage entry. It reads numeric text as a number, a blank as missing, and other text as a value that fails the type check. A missing entry gets one required-field message. The range check runs only on a number. Each loop pass starts with an empty error list, so correcting an entry clears its earlier errors. The runtime manages this temporary storage, and both local variables go out of scope when `main` returns.

For example, if someone enters `-1`, then `500001`, then `0`, the first two entries each produce a range error and another prompt. The third passes. Running the same checks on every attempt lets someone correct either mistake without restarting the program.

[Sample program](../Module3/vehicle-check.txt) · [Grammar rules](../Module3/control-flow.ebnf)
