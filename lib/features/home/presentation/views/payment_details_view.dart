import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/app_strings.dart';
import 'package:payment_gateway/core/utils/widgets/custom_app_bar.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: AppStrings.paymentDetailsAppBarTitle,
        context: context,
      ),
      body: PaymentDetailsViewBody(),
    );
  }
}
