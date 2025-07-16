import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';

class FamilyCard extends StatelessWidget {
  const FamilyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return         Container(
      height: 175,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_circle_outline,
            color: Colors.white,
            size: 70,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Adicione aqui membros da sua familia e \ncompartilhe os seguros com eles",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}
