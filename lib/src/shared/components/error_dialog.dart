import 'package:flutter/material.dart';
import 'package:tokio_teste/src/shared/colors.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      insetPadding: const EdgeInsets.symmetric(horizontal: 100),
      backgroundColor: darkGrey,
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          print(width);
          return Container(
            height: height - 800,
            width: width,
            color: Colors.white,
            child: Center(
              child: Text(
                message,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18
                ),
              ),
            ),
          );
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: tokioGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: const Center(
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
