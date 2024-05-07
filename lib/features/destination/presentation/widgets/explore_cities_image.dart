import 'package:extended_image/extended_image.dart';

import 'package:flutter/material.dart';

import 'parallax_horiz_delegate.dart';

class ExploreCitiesImage extends StatelessWidget {
  ExploreCitiesImage({super.key, required this.url});
  final String url;
  final imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: ParallaxHorizDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: imageKey,
      ),
      children: [
        Image.asset(
          url,
          key: imageKey,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ],
    );
  }
}
