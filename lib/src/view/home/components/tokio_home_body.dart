import 'package:flutter/material.dart';

import 'home_body_components/contracts_card.dart';
import 'home_body_components/family_card.dart';
import 'home_body_components/insurance_types.dart';

class TokioHomeBody extends StatelessWidget {
  const TokioHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cotar e Contratar",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        InsuranceTypes(),
        Text(
          "Minha Familia",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        FamilyCard(),
        Text(
          "Contratados",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        ContractsCard(),
      ],
    );
  }
}
