import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';
import '../web_view.dart';

class InsuranceTypes extends StatelessWidget {
  const InsuranceTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Add width condition of Web
        if (constraints.maxWidth > 600) {
          return _buildWeb(context);
        } else {
          return _buildMobile(context);
        }
      },
    );
  }

  Widget _buildWeb(BuildContext context){
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    WebView(url: "http://www.google.com")));
          },
          child: Container(
            height: 90,
            width: 85,
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.car_rental_sharp,
                  color: tokioGreen,
                  size: 34,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Automovel",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        SizedBox(width:15),
        Container(
          height: 90,
          width: 85,
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home_filled,
                color: tokioGreen,
                size: 34,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Residencia",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        SizedBox(width:15),
        Container(
          height: 90,
          width: 85,
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.heart_broken,
                color: tokioGreen,
                size: 34,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Vida",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        SizedBox(width:15),
        Container(
          height: 90,
          width: 85,
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.car_rental_sharp,
                color: tokioGreen,
                size: 34,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Acidentes Pessoais",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    WebView(url: "http://www.google.com")));
          },
          child: Container(
            height: 90,
            width: 85,
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.car_rental_sharp,
                  color: tokioGreen,
                  size: 34,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Automovel",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 90,
          width: 85,
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home_filled,
                color: tokioGreen,
                size: 34,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Residencia",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          height: 90,
          width: 85,
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.heart_broken,
                color: tokioGreen,
                size: 34,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Vida",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          height: 90,
          width: 85,
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.car_rental_sharp,
                color: tokioGreen,
                size: 34,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Acidentes Pessoais",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
