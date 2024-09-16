import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap({this.height, this.width, super.key});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  factory Gap.horizontalMedium() {
    return const Gap(width: 16);
  }

  factory Gap.horizontalLarge() {
    return const Gap(width: 32);
  }

  factory Gap.verticalMedium() {
    return const Gap(width: 16);
  }

  factory Gap.verticalLarge() {
    return const Gap(width: 32);
  }
}
