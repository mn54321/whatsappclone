import 'package:flutter/material.dart';

class ShortHBar extends StatelessWidget {
  const ShortHBar({super.key, this.height, this.width, this.color});
  final double? height;
  final double? width;
  final double? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 4,
      width: width ?? 25,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(5)),
    );
  }
}
