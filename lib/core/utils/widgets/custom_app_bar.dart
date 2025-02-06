import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/styles.dart';

AppBar buildAppBar({required BuildContext context, required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: Styles.style25,
    ),
    centerTitle: true,
    leading: Center(
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          size: 28,
        ),
      ),
    ),
  );
}
