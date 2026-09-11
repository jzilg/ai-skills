---
name: ts-style-guide
description: Applies custom functional TypeScript coding standards, relying on implicit typing, undefined over null, immutable constructs, and pure functions. Use when generating TypeScript code.
---

# Functional TypeScript Coding Style

When generating or refactoring TypeScript code, strictly adhere to the following coding conventions:

## 1. Type Strategy (Implicit Over Explicit)

- Prefer implicit type inference whenever TypeScript can infer types safely. Avoid redundant explicit return types or parameter annotations if inferred contextually.
- Define interfaces/types only for object shapes, public API boundaries, or complex function inputs.
- Never use `any`. Rely on implicit context or type parameter inference.
- Prefer `type` over `interface` for defining object models.

## 2. Strict Avoidance of `null`

- Use `undefined` exclusively for missing, optional, or empty values. Never use `null`.
- Prefer optional chaining (`?.`) and nullish coalescing (`??`) for defaulting values.
- Declare optional properties using `?` (e.g., `age?: number`).

## 3. Pure Functional Programming (FP)

- **Immutability:** Use `const` for all declarations. Treat all data structures as immutable.
- **Composition over Iteration:** Express array/collection operations purely through chainable expressions (`map`, `filter`, `reduce`, `flat`). Never write `for`, `for...of`, `while`, or `forEach`.
- **Pure Functions:** Functions must be pure, deterministic, and free of side-effects.
- **Point-Free / Declarative Expressions:** Prefer concise arrow function expressions with implicit returns where readability permits. Avoid multi-line function bodies if a single pure expression suffices.

## 4. Formatting & Expressiveness

- Prefer arrow functions for all function definitions.
- Keep helper/predicate functions tiny, reusable, and composable.
- Use JSDoc comments sparingly, only when function intent cannot be rendered clear by descriptive parameter naming.
