import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateway/core/utils/dio_service.dart';
import 'package:payment_gateway/core/utils/end_points_names.dart';
import 'package:payment_gateway/core/utils/stripe_keys.dart';
import 'package:payment_gateway/features/home/data/models/customer_input_object_model.dart';
import 'package:payment_gateway/features/home/data/models/customer_object_model.dart';
import 'package:payment_gateway/features/home/data/models/ephemeral_key_object.dart';
import 'package:payment_gateway/features/home/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway/features/home/data/models/payment_intent_model.dart';

class StripeServices {
  final DioServices dioServices;
  static const String stripeServiceBaseUrl = 'https://api.stripe.com/v1/';

  StripeServices({required this.dioServices});

  Future<CustomerObjectModel> createCustomerObject(
      {required CustomerInputObjectModel customerInputObjectModel}) async {
    var result = await dioServices.postMethod(
      path: '$stripeServiceBaseUrl${EndPointsNames.createCustomersObject}',
      token: StripeKeys.secretKey,
      data: customerInputObjectModel.toJson(),
    );

    return CustomerObjectModel.fromJson(result.data);
  }

  Future<EphemeralKeyObject> createEphemeralKeyObject(
      {required String customerId}) async {
    var result = await dioServices.postMethod(
        path: '$stripeServiceBaseUrl${EndPointsNames.createEphemeralKeys}',
        token: StripeKeys.secretKey,
        data: {
          'customer': customerId,
        },
        headers: {
          'Authorization': 'Bearer ${StripeKeys.secretKey}',
          'Stripe-Version': '2023-08-16',
        });

    return EphemeralKeyObject.fromJson(result.data);
  }

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
    required PaymentIntentModel paymentIntentModel,
    required CustomerObjectModel customerObjectModel,
    required EphemeralKeyObject ephemeralKeyObject,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: merchantDisplayName,
        paymentIntentClientSecret: paymentIntentModel.clientSecret,
        customerId: customerObjectModel.customerId,
        customerEphemeralKeySecret: ephemeralKeyObject.secret,
      ),
    );
  }

  Future<void> presentPayment() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    required CustomerInputObjectModel customerInputObjectModel,
    required String merchantDisplayName,
  }) async {
    CustomerObjectModel customerObjectModel = await createCustomerObject(
        customerInputObjectModel: customerInputObjectModel);

    EphemeralKeyObject ephemeralKeyObject = await createEphemeralKeyObject(
        customerId: customerObjectModel.customerId);

    PaymentIntentModel model = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);

    await initPayment(
      merchantDisplayName: merchantDisplayName,
      customerObjectModel: customerObjectModel,
      paymentIntentModel: model,
      ephemeralKeyObject: ephemeralKeyObject,
    );

    await presentPayment();
  }
}
