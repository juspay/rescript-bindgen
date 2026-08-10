type props = {
  sameField?: GenericInstantiationDistinctTypes.genericInstantiationDistinctSameFieldConfig,
  sameElems?: array<GenericInstantiationDistinctTypes.genericInstantiationDistinctSameFieldConfig>,
  objField?: GenericInstantiationDistinctTypes.genericInstantiationDistinctObjFieldConfig,
  objElems?: array<GenericInstantiationDistinctTypes.genericInstantiationDistinctObjFieldConfig>,
  diffElems?: array<GenericInstantiationDistinctTypes.FnArms.t>,  // ⓘ was `FnArms` — opaque; build with FnArms.fromGenericInstantiationDistinctTakeFnArmsXsConfig / FnArms.fromGenericInstantiationDistinctTakeFnArmsXsConfig2
}

@module("demo")
external make: React.component<props> = "Symmetry"
