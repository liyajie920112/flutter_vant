import 'package:flutter/material.dart';

extension ImageBox on Image {
  static network(
      src,
      double? width,
      double? height,
      BoxFit? fit,
      final ImageFrameBuilder? frameBuilder,
      final ImageLoadingBuilder? loadingBuilder,
      final ImageErrorWidgetBuilder? errorBuilder,
      final String? semanticLabel,
      excludeFromSemantics,
      color,
      colorBlendMode,
      alignment,
      repeat,
      centerSlice,
      matchTextDirection,
      gaplessPlayback,
      filterQuality,
      final bool isAntiAlias,
      Map<String, String>? headers,
      int? cacheWidth,
      int? cacheHeight) {
    return Image.network(src);
  }
}
