import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway/features/home/data/models/customer_input_object_model.dart';
import 'package:payment_gateway/features/home/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway/features/home/data/repos/payment_repo.dart';
import 'package:payment_gateway/features/home/presentation/managers/payment_cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo paymentRepo;
  PaymentCubit(this.paymentRepo) : super(PaymentInitState());

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    required CustomerInputObjectModel customerInputObjectModel,
    required String merchantDisplayName,
  }) async {
    emit(PaymentLoadingState());
    var result = await paymentRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
      customerInputObjectModel: customerInputObjectModel,
      merchantDisplayName: merchantDisplayName,
    );

    result.fold(
      (failure) {
        emit(PaymentFailureState(errMessage: failure.errMessage));
      },
      (success) {
        emit(PaymentSuccessState());
      },
    );
  }
}
