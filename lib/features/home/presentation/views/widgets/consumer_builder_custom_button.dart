import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway/core/utils/stripe_keys.dart';
import 'package:payment_gateway/core/utils/styles.dart';
import 'package:payment_gateway/core/utils/widgets/custom_elevated_button.dart';
import 'package:payment_gateway/features/home/data/models/customer_input_object_model.dart';
import 'package:payment_gateway/features/home/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway/features/home/presentation/managers/payment_cubit/payment_cubit.dart';
import 'package:payment_gateway/features/home/presentation/managers/payment_cubit/payment_state.dart';
import 'package:payment_gateway/features/home/presentation/views/thank_you_view.dart';

class ConsumerBuilderCustomButton extends StatelessWidget {
  final int amount;
  final String currency;
  const ConsumerBuilderCustomButton({
    super.key,
    required this.amount,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailureState) {
          SnackBar snackBar = SnackBar(
            content: Text(
              state.errMessage,
              style: Styles.style18.copyWith(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          );
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is PaymentSuccessState) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ThankYouView(),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PaymentLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CustomElevatedButton(
            label: 'Continue',
            labelTextStyle: Styles.style24,
            onPressed: () async {
              await BlocProvider.of<PaymentCubit>(context).makePayment(
                paymentIntentInputModel: PaymentIntentInputModel(
                  amount: amount,
                  currency: currency,
                  customerId: StripeKeys.customerId,
                ),
                // customerInputObjectModel: CustomerInputObjectModel(
                //   description: 'This is Description',
                //   email: 'alifawzyali22@gmail.com',
                //   name: 'ali fawzy ali',
                //   paymentMethod: null,
                //   phoneNumber: '01065164103',
                // ),
                merchantDisplayName: 'Tharwat Samy',
              );
            },
          );
        }
      },
    );
  }
}
