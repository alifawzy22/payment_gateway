import 'package:flutter/material.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 28,
          ),
        ),
      ),
      body: ThankYouViewBody(),
    );
  }
}
