import 'package:flutter/material.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/consumer_builder_custom_button.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/payment_methods_list_view.dart';

class ModalBottomSheet extends StatelessWidget {
  final int amount;
  final String currency;
  const ModalBottomSheet({
    super.key,
    required this.amount,
    required this.currency,
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
          ConsumerBuilderCustomButton(
            amount: amount,
            currency: currency,
          ),
        ],
      ),
    );
  }
}
