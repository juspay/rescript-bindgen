type cmd = [#M | #L | #C | #Z]
@unboxed type stringOrValueArray = Str(string) | Arr(array<(cmd, array<float>)>)
