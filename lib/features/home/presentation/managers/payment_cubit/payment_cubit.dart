import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway/features/home/presentation/managers/payment_cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitState());
}
