type controlPointsConfig<'a> = {
  id: string,
  value: 'a,
}
type rec annotation<'a> = {
  options: annotationControlPoint<'a>,
  userOptions: annotationControlPoint<'a>,
}
and annotationEvents<'a> = {
  add?: annotation<'a> => bool,
  remove?: annotation<'a> => bool,
}
and annotationControlPoint<'a> = {
  controlPoints?: array<controlPointsConfig<'a>>,
  events?: annotationEvents<'a>,
}
