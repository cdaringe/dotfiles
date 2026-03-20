# TypeScript Guidelines

## Type System

- Use `const` by default, `let` only when necessary, never `var`.
- Use `as const` assertions for literal types.
- Leverage union types and discriminated unions over enums.
- Define narrow, precise types - avoid `any` and minimize `unknown`.
- New projects should always enable strictest compiler settings (strict: true, noUncheckedIndexAccess: true).

## Type definitions

- Prefer `T[]` vs `Array<T>`


## Functional Patterns

- Prefer functional, immutable styles using Array & Object prototype methods.
- Use `Array.map`, `filter`, `reduce` over imperative loops. `for loops` are discouraged.
- Leverage optional chaining (`?.`) and nullish coalescing (`??`).
- Use function composition and piping utilities, OR, linear, flat code derived from functional patterns.
- Avoid `this` - prefer free functions over methods.
- Avoid nested function definitions greater than a few lines of code long. Prefer top-level functions.

## Immutability

- Spread operators for copying: `{ ...obj, field: newValue }`.
- Immutable updates: `array.map(...)` over `array.push(...)`.

## Type Narrowing

- Use discriminated unions for state machines.
- Leverage type guards and `is` predicates.
- Make impossible states impossible to represent.

```typescript
// Good: impossible to have loading with data or error
type State<T, E> =
  | { status: 'loading' }
  | { status: 'success'; data: T }
  | { status: 'error'; data: E }
```

## Consolidated state management

- **Consolidate state containers**. For example, prefer a single `useReducer` over multiple `useState` calls. Data modeling like `type Foo = { phase: "loading", data: null } | { phase: "loaded", data: Data } | { phase: "error", error: Error }` is preferred.
- If you have expressions like `setError` and `setSuccess` and `setLoading`, it is a huge red code smell.

## Pattern Matching & Exhaustiveness

```typescript
// Use discriminated unions with switch for exhaustive matching
function handle(state: State): string {
  switch (state.status) {
    case 'loading': return 'Loading...'
    case 'success': return state.data
    case 'error': return state.error.message
  }
  // TypeScript ensures all cases are handled
}
```

## Monadic Types - Result, Option, etc.

- Use Result types for functions that can fail, instead of throwing exceptions.

```typescript
// Prefer this pattern
type Result<T, E> = { ok: true; data: T } | { ok: false; data: E }

// Over throwing exceptions
function parse(input: string): Result<Data, ParseError> {
  // implementation
}
```

- Avoid `Option<T>`, and prefer `T | undefined`

## Async Patterns

- Prefer `async/await` for readability over raw Promises.
- Return `Promise<Result<T, E>>` for async operations that can fail.
- Avoid mixing callbacks and promises.
- Use `Promise.all` for parallel operations, not sequential awaits.

## Utility Functions

Build a toolkit of reusable functional utilities:
- `pipe` / `flow` for function composition
- `match` for pattern matching on discriminated unions
- `partition` to split arrays by predicate
- `groupBy` to organize collections
- `unwrap` helpers for Result/Option types

## Data Modeling

```typescript
// Model your domain precisely
type UserId = string & { readonly kind: 'UserId' }
type Email = string & { readonly kind: 'Email' }

// Impossible to mix up
function sendEmail(userId: UserId, email: Email): void
```

## Function Signatures

- Return types should be explicit on exported functions.
- **Functions with 3+ parameters must use object parameters.**
- Maximum 2 positional parameters - use objects beyond that.
- Use destructuring in parameters for clarity.
- Generic functions should have meaningful type parameter names.

```typescript
// Good: 2 or fewer parameters
function add(a: number, b: number): number

// Good: 3+ parameters as object
function createUser({ id, email, role, metadata }: CreateUserInput): Result<User, Error>

// Bad: 3+ positional parameters
function createUser(id: string, email: string, role: string, metadata: object) // Too many!
```

## Logging

- **Never use `console.log`, `console.error`, etc. directly.**
- Always inject logger as a dependency, if the project supports it.
  - React and server code often have loggers in context object.
- Define logger interface for testability and flexibility.
- Make logging a passed dependency, not an import.

## Project & module rules

- Prefer using `src/` for source, `dist/` for compiled output.
- Prefer smaller, testable modules. In contrast to some popular programming opinions, large LOC count per module should be considered candidate for a refactor into a module. 500 LOC or more is a strong signal to modularize.
- Group related modules into folders.
- If the project can be formatted (using prettier, eslint --fix, deno fmt, etc), after you make changes run the formatter. It is common that the formatter is tricky to invoke. Learn how to do it and load it into your project local context when executing.
- On comment usage: use comments over codeblocks that are nuanced or a bit complex. For functions that are already clearly semantic in nature (which you strict to write), do not add frivolous comments. Ask "is this block of work verb self descriptive?". If yes, don't add a comment. If the code block or function under scrutiny is not self descriptive OR has interesting behavior or reasons for existing, do add a concise descriptive comment.


## AVOID THESE PATTERNS

- **`console.*` methods - inject loggers instead.**
- **Functions with 3+ positional parameters - use objects.**
- Class inheritance hierarchies - prefer composition.
- Mutable class properties - prefer readonly.
- Throwing exceptions in business logic.
- Imperative loops - prefer array methods.
- Side effects in the middle of call chains.
- `null` - prefer explicit Option types or undefined.
- Default exports - prefer named exports for better refactoring.
- Use server code in client code. Some dependencies, like zod, graphql, fs, etc. should not be used in client code.
