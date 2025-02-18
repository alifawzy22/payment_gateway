import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:payment_gateway/core/utils/dio_service.dart';
import 'package:payment_gateway/core/utils/stripe_services.dart';
import 'package:payment_gateway/features/home/data/repos/payment_repo.dart';
import 'package:payment_gateway/features/home/data/repos/payment_repo_impl.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<DioServices>(DioServices(dio: getIt()));

  getIt.registerSingleton<StripeServices>(StripeServices(dioServices: getIt()));

  getIt
      .registerSingleton<PaymentRepo>(PaymentRepoImpl(stripeServices: getIt()));
}
