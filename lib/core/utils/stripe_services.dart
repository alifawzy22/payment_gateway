import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateway/core/utils/dio_service.dart';
import 'package:payment_gateway/core/utils/end_points_names.dart';
import 'package:payment_gateway/core/utils/stripe_keys.dart';
import 'package:payment_gateway/features/home/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway/features/home/data/models/payment_intent_model.dart';

class StripeServices {
  final DioServices dioServices;
  static const String stripeServiceBaseUrl = 'https://api.stripe.com/v1/';

  StripeServices({required this.dioServices});

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var result = await dioServices.postMethod(
      path: '$stripeServiceBaseUrl${EndPointsNames.createPaymentIntent}',
      token: StripeKeys.secretKey,
      data: paymentIntentInputModel.toJson(),
    );
    return PaymentIntentModel.fromJson(result.data);
  }

  Future<void> initPayment({
    required String merchantDisplayName,
    required String clientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: merchantDisplayName,
        paymentIntentClientSecret: clientSecret,
      ),
    );
  }

  Future<void> presentPayment() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    PaymentIntentModel model = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);

    await initPayment(
        merchantDisplayName: 'ali', clientSecret: model.clientSecret);

    await presentPayment();
  }
}
