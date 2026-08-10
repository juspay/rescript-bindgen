type props = {
  field?: GenericInstantiationDistinctTypes.GenericInstantiationDistinctField.t,  // ⓘ was `NamedArmA | NamedArmB` — opaque; build with GenericInstantiationDistinctField.fromNamedArmA / GenericInstantiationDistinctField.fromNamedArmB
  elems?: array<GenericInstantiationDistinctTypes.GenericInstantiationDistinctField.t>,  // ⓘ was `NamedArmA | NamedArmB` — opaque; build with GenericInstantiationDistinctField.fromNamedArmA / GenericInstantiationDistinctField.fromNamedArmB
}

@module("demo")
external make: React.component<props> = "NamedArm"
