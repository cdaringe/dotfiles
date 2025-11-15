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
- **Run tests after every edit** - ensure changes don't break existing functionality.
- Prefer passing dependencies as inputs (dependency injection) over imports.
- Keep functions testable through pure functions and explicit dependencies.

## Code Quality & Tooling

- **Run the project's code formatter before committing** - formatting is non-negotiable.
- **Run tests after every edit** - catch regressions immediately.
- Address linter warnings - they exist for a reason.
- No dead code - delete unused code, don't comment it out.
- Keep the codebase clean and well-maintained.

## Data Transformation

- Pipeline data transformations - compose small functions into larger ones.
- Avoid intermediate mutations - chain transformations immutably.
- Use declarative patterns that describe what, not how.
- Separate data from behavior - prefer data structures over objects with methods.

## Side Effects

- Isolate side effects at the edges of your system.
- Pure core, imperative shell - keep business logic pure.
- Make side effects explicit through type signatures (e.g., IO<T>, Task<T>).
- Defer execution - return descriptions of work rather than performing it.

## Code Organization

- Organize by feature/domain, not by technical layer.
- Colocate related functions and types.
- Small modules with clear, single purposes.
- Prefer many small files over large monolithic ones.

## Performance & Pragmatism

- Functional style first, optimize when needed with measurement.
- Don't sacrifice clarity for cleverness.
- It's okay to be imperative at system boundaries (DB, I/O, framework integration).
- Use the right tool for the job - functional is preferred, not required everywhere.
