abstract class PaymentState {}

class PaymentInitState extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentSuccessState extends PaymentState {}

class PaymentFailureState extends PaymentState {
  final String errMessage;

  PaymentFailureState({required this.errMessage});
}
