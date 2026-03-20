# React coding guidelines

1. Small components. If a component exceeds even just 30 lines of code, it is a strong signal that it should be refactored into smaller components. This promotes reusability and testability.
2. Use **named hooks** aggressively. Avoid many small, inline `useEffect`, `useCallback`, etc in a component itself. Prefer using them in named that control the lifecycle of some state, effects, or behavior.
3. Use and reference the component 10 commandments: https://cdaringe.github.io/ui-component-ten-commandments/
4. Be careful not to mix server code into client code. Judiciously use small modules to separate server and client code. It can be useful to use `.server.{ts,tsx}` suffix to make clear some modules are for server usage only.
5. Avoid putting node.js modules or large dependencies into browser code (for example: zod, graphql, node:fs, etc).
