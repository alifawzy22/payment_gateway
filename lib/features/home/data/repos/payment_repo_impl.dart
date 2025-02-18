import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_gateway/core/utils/failure.dart';
import 'package:payment_gateway/core/utils/stripe_services.dart';
import 'package:payment_gateway/features/home/data/models/customer_input_object_model.dart';
import 'package:payment_gateway/features/home/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway/features/home/data/repos/payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final StripeServices stripeServices;

  PaymentRepoImpl({required this.stripeServices});
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    //required CustomerInputObjectModel customerInputObjectModel,
    required String merchantDisplayName,
  }) async {
    try {
      await stripeServices.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
        //customerInputObjectModel: customerInputObjectModel,
        merchantDisplayName: merchantDisplayName,
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
