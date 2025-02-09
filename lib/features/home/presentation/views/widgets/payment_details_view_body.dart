import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/styles.dart';
import 'package:payment_gateway/core/utils/widgets/custom_elevated_button.dart';
import 'package:payment_gateway/features/home/presentation/views/thank_you_view.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_credit_card_widget.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PaymentMethodsListView()),
        SliverToBoxAdapter(
          child: CustomCreditCardWidget(
            formKey: formKey,
            autoValidateModel: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: CustomElevatedButton(
                label: 'Pay',
                labelTextStyle: Styles.style24,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ThankYouView(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
