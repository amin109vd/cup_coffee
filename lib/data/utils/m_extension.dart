import 'dart:developer';

import 'package:flutter/widgets.dart';

extension MEX on String {
  void toLog() => log(this);

  String get pictureGitHubPath =>
      'https://raw.githubusercontent.com/mes71/fakeApi/master/${this}';
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
