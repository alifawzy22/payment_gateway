import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_gateway/constants.dart';

class CustomPaymentMethodCard extends StatelessWidget {
  final bool isActive;
  final String image;
  const CustomPaymentMethodCard(
      {super.key, required this.isActive, required this.image});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 60,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: isActive ? kPrimaryColor : kGreyColor, width: 1.50),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: isActive ? kPrimaryColor : Colors.white,
            blurRadius: 4,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: SizedBox(
        width: 80,
        child: SvgPicture.asset(
          image,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
