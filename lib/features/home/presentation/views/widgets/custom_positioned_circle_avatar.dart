import 'package:flutter/material.dart';

class CustomPositionedCircleAvatar extends StatelessWidget {
  final double? left, right;
  const CustomPositionedCircleAvatar({
    super.key,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      left: left,
      bottom: MediaQuery.of(context).size.height * 0.2,
      child: CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
