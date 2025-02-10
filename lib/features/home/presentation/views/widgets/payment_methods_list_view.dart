import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/assets_data.dart';
import 'package:payment_gateway/features/home/data/payment_methods_model.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_payment_method_card.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<PaymentMethodsModel> paymentMethodsModelList = [
    PaymentMethodsModel(image: AssetsData.credit),
    PaymentMethodsModel(image: AssetsData.paypal),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        //padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsModelList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            child: CustomPaymentMethodCard(
              isActive: currentIndex == index,
              image: paymentMethodsModelList[index].image,
            ),
          );
        },
      ),
    );
  }
}
