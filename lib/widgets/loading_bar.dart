import 'package:flutter/material.dart';
import 'package:wow_food_seller/widgets/progress_bar.dart';
class LoadingDialog extends StatelessWidget {
 final String? message;
 LoadingDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressBar(),
          SizedBox(height: 10,),
          Text(message!+",Please wait..."),

        ],
      ),

    );
  }
}
