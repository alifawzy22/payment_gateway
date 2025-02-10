import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_gateway/constants.dart';
import 'package:payment_gateway/core/utils/assets_data.dart';

class CustomCreditCardContainer extends StatelessWidget {
  const CustomCreditCardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsData.masterCard,
          ),
          SizedBox(
            width: 16,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Credit Card\n',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                    text: 'Mastercard **78',
                    style: TextStyle(color: kGreyColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
