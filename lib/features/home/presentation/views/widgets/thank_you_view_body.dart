import 'package:flutter/material.dart';
import 'package:payment_gateway/constants.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_dashed_line.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_positioned_circle_avatar.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kThankYouBGColor,
            ),
          ),
          CustomPositionedCircleAvatar(
            left: -20,
          ),
          CustomPositionedCircleAvatar(
            right: -20,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2 + 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20 + 8, right: 20 + 8),
              child: CustomDashedLine(),
            ),
          ),
          Positioned(
            top: -40,
            left: 0,
            right: 0,
            child: CustomCircleAvatar(),
          ),
        ],
      ),
    );
  }
}
