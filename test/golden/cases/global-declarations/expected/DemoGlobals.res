// #194: global entry points — reach these package globals through the runtime object named
// in each `@scope(...)`; no module is imported. (e.g. `navigator.gpu`)
@val @scope("navigator") external demoRoot: InstanceTypes.demoRoot = "demoRoot"
