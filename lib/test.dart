import 'dart:async';

import 'package:flutter/material.dart';

Future getImageSize(Image image) async {
  final Completer completer = Completer();

  image.image.resolve(const ImageConfiguration()).addListener(
        (ImageStreamListener(
          (ImageInfo info, bool _) {
            completer.complete(Size(
              info.image.width.toDouble(),
              info.image.height.toDouble(),
            ));
          },
        )),
      );

  final Size imageSize = await completer.future;

  return imageSize;
}
