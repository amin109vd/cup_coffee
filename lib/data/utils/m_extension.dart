import 'dart:developer';

import 'package:flutter/widgets.dart';

extension MEX on String {
  String get rTag => '${this}Route';

  void toLog() => log(this);
}

extension MEXWidget on Widget {}

extension MEXNum on num {
  SizedBox get toHeight => SizedBox(
        height: toDouble(),
      );

  SizedBox get toWidth => SizedBox(
        width: toDouble(),
      );
}
