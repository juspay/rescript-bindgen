type props = {
  plain?: [#"menubar"],
  dashed?: [#"context-menu"],
  numeric?: [#"2xl"],
}

@module("demo")
external make: React.component<props> = "Kinds"
