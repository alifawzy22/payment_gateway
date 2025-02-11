import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/styles.dart';
import 'package:payment_gateway/core/utils/widgets/custom_elevated_button.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/payment_methods_list_view.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodsListView(),
          CustomElevatedButton(
            label: 'Continue',
            labelTextStyle: Styles.style24,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
