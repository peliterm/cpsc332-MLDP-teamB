# Object-Oriented Design Reflection – Michael Pelitera

**Co-leaders:** Michael Pelitera and Wyatt Rose

**Team:** CPSC 332 – Team B

In [Module 2](module2.md), we used ANTLR to generate a Java parser for our validation commands. Our [Module 3 mileage program](../Module3/vehicle-check.txt) uses those commands inside a retry loop. Wyatt and I discussed using Java this round. My proposal is to use Java classes to check each reading. For example, someone writing a mileage rule enters `validate(mileage, 0, 500000);`. The Java evaluator would represent that command as `new RangeRule("mileage", 0, 500000)`.

## Rule design in pseudocode

```text
abstract class ValidationRule(private fieldName)
    final check(record) = accepts(record.lookup(fieldName))
    abstract accepts(value)

class RequiredRule(field) extends ValidationRule(field)
    override accepts(value) = value is present

class TypeRule(field, private expectedType) extends ValidationRule(field)
    override accepts(value) = value has type expectedType

class RangeRule(field, private minimum, private maximum) extends ValidationRule(field)
    override accepts(value) = minimum <= value and value <= maximum
```

## How the rules work

Encapsulation keeps the field name and range limits private. Once we set the mileage maximum to 500,000, the caller can check a reading but cannot raise the limit to make it pass. Through inheritance, all three rules share the same field lookup in `check`. Marking `check` as `final` in Java keeps that lookup the same across the rules. The call to `accepts` uses polymorphism. For a reading of 500,001, `RequiredRule` finds a value and passes. `RangeRule` compares that same reading with its limits and fails.

## Features we include, modify, or exclude

The evaluator uses one level of inheritance, with a subclass for each kind of check. We adapt object creation to our command syntax. When someone writes `validate(year, 1900, 2026);` in the [Module 2 vehicle example](../Module2/Test1.txt), the evaluator creates a `RangeRule` with those limits. Mileage uses the same class with different limits. We leave user-defined classes out of the language because the three validation commands already cover these checks.

## Modeling challenge

The tricky part was deciding who controls the retry. Each rule will answer one question about the reading. The evaluator will run the mileage checks in order and record the first failure for that field. A blank stops at `required` and produces one message. Text such as “unknown” stops at `type`. Zero reaches `validate` and passes. The [Module 3 loop](module3.md) can then report the error and ask again, or accept the reading.
