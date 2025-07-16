import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';

class ContractsCard extends StatelessWidget {
  const ContractsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            height:70,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 5,
                  color: Colors.white
              ),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 60,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Você ainda não possui seguros contratados",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}
