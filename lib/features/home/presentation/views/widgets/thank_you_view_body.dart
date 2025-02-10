import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_gateway/constants.dart';
import 'package:payment_gateway/core/utils/assets_data.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_dashed_line.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_paid_button.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_positioned_circle_avatar.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_thamk_you_column_info.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 32,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kThankYouBGColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                    left: 22,
                    right: 22,
                  ),
                  child: CustomThankYouColumnInfo(),
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
              Positioned(
                left: 0,
                right: 0,
                bottom: ((MediaQuery.of(context).size.height * 0.2) / 2) - 25,
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          AssetsData.barCode,
                          height: 50,
                        ),
                        CustomPAIDButton(
                          text: 'PAID',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
