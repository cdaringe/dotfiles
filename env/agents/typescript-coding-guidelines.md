# TypeScript Guidelines

## Type System

- Use `const` by default, `let` only when necessary, never `var`.
- Use `as const` assertions for literal types.
- Leverage union types and discriminated unions over enums.
- Define narrow, precise types - avoid `any` and minimize `unknown`.

## Functional Patterns

- Use `Array.map`, `filter`, `reduce` over imperative loops.
- Leverage optional chaining (`?.`) and nullish coalescing (`??`).
- Use function composition and piping utilities, OR, linear, flat code derived from functional patterns.
- Avoid `this` - prefer free functions over methods.

## Result Types

```typescript
// Prefer this pattern
type Result<T, E> = { ok: true; value: T } | { ok: false; error: E }

// Over throwing exceptions
function parse(input: string): Result<Data, ParseError> {
  // implementation
}
```

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

## Option/Maybe Types

```typescript
type Option<T> = { some: true; value: T } | { some: false }

// Prefer Option over null/undefined in business logic
function find<T>(arr: T[], pred: (x: T) => boolean): Option<T> {
  const found = arr.find(pred)
  return found !== undefined
    ? { some: true, value: found }
    : { some: false }
}
```

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

```typescript
// Good: logger as dependency
type LogLevel = 'info' | 'error' | 'debug'
type LogMessage = unknown
type Logger = ({ tags: [LogLevel, ...string[]], message: LogMessage }) => void;

function processData(
  { data, userId }: ProcessInput,
  logger: Logger
): Result<Output, Error> {
  logger({ tags: ["info", "processor"], message: `processing: ${userId}` });
}

// Bad: direct console usage
function processData(data: string) {
  console.log('Processing...'); // Don't do this!
}
```

## Avoid

- **`console.*` methods - inject loggers instead.**
- **Functions with 3+ positional parameters - use objects.**
- Class inheritance hierarchies - prefer composition.
- Mutable class properties - prefer readonly.
- Throwing exceptions in business logic.
- Imperative loops - prefer array methods.
- Side effects in the middle of call chains.
- `null` - prefer explicit Option types or undefined.
- Default exports - prefer named exports for better refactoring.
