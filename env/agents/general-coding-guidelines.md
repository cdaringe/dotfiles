# General Coding Guidelines

## Core coding principles

- **Maximize expressions, minimize statements**.
- **Maximize usage of modules, maximize usage of pure functions**.
- **Prefer functional programming style over imperative or OOP**.
- **Immutability by default** - avoid mutation.
- **Composition over inheritance** - build complex behavior from simple
  functions.
- **Maximize module usage, minimize inline logic**. Prefer offloading as much
  work as possible into module specific functions versus inlining logic into any
  given function.

```ts
// good. Maximizes module leverage, minimizes statements/assignments
const main = () =>
  Foo.tryDoWork()
    .then(
      Bar.tryDoWork,
      Foo.logThen(logger)(Foo.tryWorkFallback),
    );

// bad
const main = () => {
  let result = tryDoWork();
  if (result.isOk()) {
    const bar = barTryDoWork();
  } else {
    log(result.data);
    result = tryWorkFallback();
  }
};
```

## Function Design

- **Prefer multiple small functions over fewer long functions**.
- **Prefer higher-order functions (map, filter, reduce), discourage loops**.
- **Prefer object inputs when arity >2 parameters.**
- **Prefer explicit return types** vs implicit.

## Error Handling

- **Prefer Result<T, E> types** over exceptions.
- **Treat errors as data** not control flow.
- **Minimize try/catch** except at large boundaries.

## Type Safety

- **Make illegal states unrepresentable** in types.
- **Maximize use of discriminated unions** when modeling multiple options.
- **Write narrow types**
- **Prefer ternary usage or exhaustive matching in switch**. AVOID `if`
  statements when possible.

## Casting

- AVOID CASTING. Use type guards, pattern matching, or type refinements instead.

## Naming & Clarity

- Use meaningful names for variables and functions.
- Use comments sparingly - prefer self-documenting code.
- Avoid obvious comments that just restate the code.

## Testing & Dependencies

- **Write tests**, not too many.
- **Prefer grid/matrix** definitions versus many test cases.
- **Run tests after every edit** - ensure changes don't break existing
  functionality.
- Prefer passing dependencies as inputs (dependency injection) over imports.
- Keep functions testable through pure functions and explicit dependencies.

## Code Quality & Tooling

- **Run the project's code formatter before committing** - formatting is
  non-negotiable.
- **Run tests after every edit** - catch regressions immediately.
- Address linter warnings - they exist for a reason.
- No dead code - delete unused code, don't comment it out.
- Keep the codebase clean and well-maintained.

## Side Effects

- **Adhere to imperative shell, functional core** philosophy.
- Isolate side effects at the edges of your system.
- Make side effects explicit through type signatures (e.g., IO<T>, Task<T>).
- Defer execution - return descriptions of work rather than performing it.

## Code Organization

- Organize by feature/domain, not by technical layer.
- Colocate related functions and types.
- Small modules with clear, single purposes.
- Prefer many small files over large monolithic ones.
