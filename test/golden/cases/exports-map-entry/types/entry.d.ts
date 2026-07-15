// #104: this file is reachable ONLY via package.json `exports` → `.` → `import`/`require` → `types`.
// There is no `types` field and no top-level `index.d.ts`, so pre-#104 resolution returned null.
export declare function greet(name: string): string
export declare const VERSION: string
