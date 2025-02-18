import 'package:dartz/dartz.dart';
import 'package:payment_gateway/core/utils/failure.dart';
import 'package:payment_gateway/features/home/data/models/customer_input_object_model.dart';
import 'package:payment_gateway/features/home/data/models/payment_intent_input_model.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    required CustomerInputObjectModel customerInputObjectModel,
    required String merchantDisplayName,
  });
}
