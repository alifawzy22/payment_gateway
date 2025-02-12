class PaymentIntentModel {
  final String clientSecret;

  PaymentIntentModel({required this.clientSecret});

  factory PaymentIntentModel.fromJson(jsonData) {
    return PaymentIntentModel(
      clientSecret: jsonData['client_secret'],
    );
  }
}
