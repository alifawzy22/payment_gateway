import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateway/core/utils/app_strings.dart';
import 'package:payment_gateway/core/utils/stripe_keys.dart';
import 'package:payment_gateway/features/home/presentation/views/home_view.dart';

void main() async {
  Stripe.publishableKey = StripeKeys.publishableKey;
  runApp(const PaymentGateWays());
}

class PaymentGateWays extends StatelessWidget {
  const PaymentGateWays({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeView(),
    );
  }
}
