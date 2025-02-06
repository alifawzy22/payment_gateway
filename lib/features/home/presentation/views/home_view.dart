import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/app_strings.dart';
import 'package:payment_gateway/core/utils/widgets/custom_app_bar.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(title: AppStrings.homeViewAppBarTitle, context: context),
      body: HomeViewBody(),
    );
  }
}
