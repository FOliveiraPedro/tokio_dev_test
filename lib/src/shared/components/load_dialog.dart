import 'package:flutter/material.dart';
import 'package:tokio_teste/src/shared/colors.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      insetPadding: const EdgeInsets.symmetric(horizontal: 100),
      backgroundColor: darkBlue,
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          print(width);
          return Container(
            height: height - 700,
            width: width,
            color: darkBlue,
            child: Center(
              child: CircularProgressIndicator(color: tokioGreen,),
            ),
          );
        },
      ),
    );
  }
}
