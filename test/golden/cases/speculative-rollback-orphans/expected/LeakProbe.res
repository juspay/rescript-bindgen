type props = {
  value?: string,  // ⚪ loose — was `Leaked`
}

@module("demo")
external make: React.component<props> = "LeakProbe"
