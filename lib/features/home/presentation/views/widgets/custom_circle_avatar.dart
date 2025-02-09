import 'package:flutter/material.dart';
import 'package:payment_gateway/constants.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: kThankYouBGColor,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.check,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
