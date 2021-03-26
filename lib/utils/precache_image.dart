import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// {@category Utils}
class PrecacheImages {
  Future<void> init(BuildContext context) async {
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths =
        manifestMap.keys.where((String key) => key.contains('.svg')).toList();
    try {
      imagePaths.forEach((f) async {
        await precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, f),
          null,
        );
      });
    } catch (e) {
      print(e);
    }
  }
}