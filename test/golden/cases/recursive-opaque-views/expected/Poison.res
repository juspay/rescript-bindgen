type props = {
  root?: string,  // ⚪ loose — was `Poisoned`
}

@module("demo")
external make: React.component<props> = "Poison"
