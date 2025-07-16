import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class TokioFormSelector extends StatefulWidget {
  Function login;
  Function register;
  String formType;

  TokioFormSelector({
    super.key,
    required this.login,
    required this.register,
    required this.formType,
  });

  @override
  State<TokioFormSelector> createState() => _TokioFormSelectorState();
}

class _TokioFormSelectorState extends State<TokioFormSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.formType == "cadastrar") {
              setState(() {
                widget.formType = "login";
              });
            }
          },
          child: Text(
            "Entrar",
            style: widget.formType == "login"
                ? TextStyle(
                    color: tokioGreen,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: tokioGreen,
                    decorationThickness: 3)
                : TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: () {
            if (widget.formType == "login") {
              setState(() {
                widget.formType = "cadastrar";
              });
            }
          },
          child: Text(
            "Cadastrar",
            style: widget.formType == "cadastrar"
                ? TextStyle(
                    color: tokioGreen,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: tokioGreen,
                    decorationThickness: 3)
                : TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
          ),
        ),
      ],
    );
  }
}
