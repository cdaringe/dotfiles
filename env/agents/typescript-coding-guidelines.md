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

## Avoid

- Class inheritance hierarchies - prefer composition.
- Mutable class properties - prefer readonly.
- Throwing exceptions in business logic.
- Imperative loops - prefer array methods.
- Side effects in the middle of call chains.
