/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/url_strategy_non_web.dart'
  if (dart.library.html) 'src/url_strategy_web.dart';
