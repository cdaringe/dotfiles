# Rust Guidelines

## Type System

- Leverage Rust's type system to make invalid states unrepresentable.
- Use newtype pattern for domain types: `struct UserId(Uuid)`.
- Prefer enums with data over separate structs.
- Use `#[non_exhaustive]` for public enums that may grow.

## Error Handling

- Use `Result<T, E>` for all fallible operations.
- Define custom error types with `thiserror` or implement `std::error::Error`.
- Use `?` operator for error propagation.
- Avoid `unwrap()` and `expect()` except in tests or when panic is desired.

```rust
// Good
fn parse_config(path: &Path) -> Result<Config, ConfigError> {
    let content = fs::read_to_string(path)?;
    let config = toml::from_str(&content)?;
    Ok(config)
}
```

## Ownership & Borrowing

- Prefer borrowing (`&T`, `&mut T`) over owned values when possible.
- Use `Clone` judiciously - understand the cost.
- Leverage `Cow<T>` for conditional ownership.
- Return owned values for transformation pipelines.

## Functional Patterns

- Use iterator chains over loops: `map`, `filter`, `filter_map`, `fold`.
- Prefer `collect()` to build collections from iterators.
- Use `Option` and `Result` combinators: `map`, `and_then`, `unwrap_or_else`.
- Leverage pattern matching exhaustively.

```rust
// Good: functional pipeline
items.iter()
    .filter(|item| item.is_active)
    .map(|item| item.process())
    .collect::<Result<Vec<_>, _>>()
```

## Pattern Matching

- Always match exhaustively - let the compiler help you.
- Use `if let` and `while let` for single-pattern matches.
- Use guards in match arms when needed.

```rust
match result {
    Ok(value) if value > 0 => process(value),
    Ok(_) => handle_zero_or_negative(),
    Err(e) => log_error(e),
}
```

## Immutability

- Variables are immutable by default - keep them that way.
- Use `mut` only when mutation is truly needed.
- Prefer transforming and returning new values.
- Use interior mutability (`Cell`, `RefCell`, `Arc<Mutex<T>>`) sparingly.

## Traits & Composition

- Prefer composition over complex type hierarchies.
- Implement standard traits: `Debug`, `Clone`, `PartialEq`, `Eq`.
- Use trait objects (`dyn Trait`) for runtime polymorphism.
- Prefer generics with trait bounds for compile-time polymorphism.
- Keep trait APIs focused and cohesive.

## Async Patterns

- Use `async/await` for asynchronous code.
- Return `Result<T, E>` from async functions for fallible operations.
- Prefer structured concurrency with `tokio::join!` and `tokio::select!`.
- Use channels for communication between tasks.

## Data Modeling

```rust
// Use enums for state machines
enum ConnectionState {
    Disconnected,
    Connecting { started_at: Instant },
    Connected { socket: TcpStream },
    Failed { error: Error, retry_count: u32 },
}
```

## Safety & Performance

- Unsafe code requires justification and safety comments.
- Prefer safe abstractions - use `unsafe` only when necessary.
- Profile before optimizing - don't guess.
- Use zero-cost abstractions - iterators, generics.

## Modules & Organization

- Organize by feature/domain.
- Keep modules focused and cohesive.
- Use `pub(crate)` for internal APIs.
- Prefer flat module hierarchies.

## Testing

- Write unit tests in the same file: `#[cfg(test)] mod tests`.
- Use integration tests in `tests/` directory.
- Test error cases, not just happy paths.
- Use property-based testing (`proptest`, `quickcheck`) for complex logic.

## Code Quality

- **No dead code** - remove unused functions, variables, imports.
- Run `cargo fmt` before committing - formatting is non-negotiable.
- Run `cargo clippy` and address warnings.
- Enable `#![deny(dead_code)]` in lib.rs to catch unused code.
- Run tests after every edit: `cargo test`.

## Avoid

- **Dead code** - delete it, don't comment it out.
- Mutable global state.
- `clone()` without understanding performance impact.
- Premature optimization - measure first.
- Over-abstraction - keep it simple.
- `String` allocations in hot paths - use `&str`.
- Panics in library code - return `Result` instead.
- `#[allow(dead_code)]` without justification.
