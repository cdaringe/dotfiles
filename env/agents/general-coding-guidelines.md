# General Coding Guidelines

## Core Principles

- **Functional style is preferred** over imperative and OOP styles.
- **Immutability by default** - avoid mutation whenever possible.
- **Pure functions** - functions should be deterministic with no side effects.
- **Composition over inheritance** - build complex behavior from simple functions.

## Function Design

- Write small, focused functions that do one thing well.
- Prefer expressions over statements.
- Use higher-order functions (map, filter, reduce) over loops.
- Avoid early returns - use expressions and pattern matching instead.

## Error Handling

- **Prefer Result<T, E> types** over throwing exceptions.
- Make errors explicit in function signatures.
- Use type-safe error handling - errors are data, not control flow.
- Avoid try/catch except at system boundaries.

## Type Safety

- **Narrow types** - make illegal states unrepresentable.
- Use discriminated unions over inheritance hierarchies.
- Leverage the type system to encode business rules.
- Prefer compile-time guarantees over runtime checks.

## Naming & Clarity

- Use meaningful names for variables and functions.
- Use comments sparingly - prefer self-documenting code.
- Avoid obvious comments that just restate the code.

## Testing & Dependencies

- Write tests for all business logic.
- Prefer passing dependencies as inputs (dependency injection) over imports.
- Keep functions testable through pure functions and explicit dependencies.
