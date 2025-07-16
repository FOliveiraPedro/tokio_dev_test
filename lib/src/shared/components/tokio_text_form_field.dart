import 'package:flutter/material.dart';
import 'package:tokio_teste/src/shared/colors.dart';

class TokioTextFormField extends StatefulWidget {
  final bool showLabel;
  final String label;
  final String hintText;
  final bool showError;
  final bool hasIcon;
  final IconData? icon;
  final TextEditingController controller;
  late TextInputType? keyboardType;
  late bool? obscureText;

  TokioTextFormField({
    super.key,
    required this.showLabel,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.showError,
    required this.hasIcon,
    this.icon,
    this.obscureText,
    this.keyboardType,
  });

  @override
  State<TokioTextFormField> createState() => _TokioTextFormFieldState();
}

class _TokioTextFormFieldState extends State<TokioTextFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType ?? TextInputType.emailAddress,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: tokioGreen,
                width: 2.0,
              ),
            ),
            focusColor: tokioGreen,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
            labelText: widget.label,
            labelStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          obscureText: widget.obscureText ?? false,
        ),
        Visibility(
            visible: widget.showError,
            child: const Text(
              "Campo Obrigatório",
              style: TextStyle(color: Colors.red),
            )),
      ],
    );
  }
}
