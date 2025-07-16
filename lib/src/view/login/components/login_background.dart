import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import '../../../shared/colors.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: [tokioGreen, tokioYellow],
              transform: GradientRotation(math.pi / 4),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          color: darkGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Acesse através das redes sociais",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/social_media_icons/google.svg",height: 50,width: 50,),
                    SizedBox(width: 35,),
                    SvgPicture.asset("assets/social_media_icons/facebook.svg",height: 50,width: 50,),
                    SizedBox(width: 35,),
                    SvgPicture.asset("assets/social_media_icons/instagram.svg",height: 50,width: 50,),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
