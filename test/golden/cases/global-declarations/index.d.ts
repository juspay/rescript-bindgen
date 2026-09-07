// #194: a GLOBAL-only declaration script — no imports, no exports (like @webgpu/types). Exercises every
// global-mode path: a runtime object with a (0-param, instanceof-only) constructor var, a pure-data
// descriptor (→ record, never rooted), a flag-const namespace, a method-only runtime object reached via a
// Navigator augmentation entry point, and a canvas getContext augmentation (overload provenance).

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

interface DemoRoot {
  readonly version: string;
  makeGizmo(descriptor: DemoGizmoDescriptor): DemoGizmo;
}

interface Navigator {
  readonly demoRoot: DemoRoot;
}

interface HTMLCanvasElement {
  getContext(contextId: "demo"): DemoGizmo | null;
}
