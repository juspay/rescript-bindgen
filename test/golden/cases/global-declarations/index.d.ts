// #194: a GLOBAL-only declaration script — no imports, no exports (like @webgpu/types). Exercises every
// global-mode path: a genuinely-constructible runtime object (`new (): DemoGizmo` → keeps `@new make`), an
// INSTANCEOF-ONLY handle (`new (): never` → ctor dropped, no `make`, how 29/39 real @webgpu ctors behave), a
// pure-data descriptor (→ record, never rooted), a flag-const namespace, a method-only runtime object reached
// via a Navigator augmentation entry point, and a canvas getContext augmentation (overload provenance).

interface DemoGizmoDescriptor {
  size: number;
  label?: string;
}

interface DemoGizmo {
  readonly size: number;
  resize(descriptor: DemoGizmoDescriptor): void;
  destroy(): void;
}
declare var DemoGizmo: {
  prototype: DemoGizmo;
  new (): DemoGizmo;
};

interface DemoGizmoUsage {
  readonly READ: number;
  readonly WRITE: number;
}
declare var DemoGizmoUsage: DemoGizmoUsage;

// An INSTANCEOF-only global: obtained from an API (never `new`ed) — its constructor var is `new (): never`.
// The ctor discriminator must DROP `make` and record it as instanceof-only; the abstract handle + methods
// still bind.
interface DemoHandle {
  readonly id: number;
  poll(): void;
}
declare var DemoHandle: {
  prototype: DemoHandle;
  new (): never;
};

interface DemoRoot {
  readonly version: string;
  makeGizmo(descriptor: DemoGizmoDescriptor): DemoGizmo;
  // Promise<T | null> — mirrors navigator.gpu.requestAdapter(); the null MUST survive as Nullable.t (#194 review).
  requestGizmo(descriptor: DemoGizmoDescriptor): Promise<DemoGizmo | null>;
}

interface Navigator {
  readonly demoRoot: DemoRoot;
}

interface HTMLCanvasElement {
  getContext(contextId: "demo"): DemoGizmo | null;
}
