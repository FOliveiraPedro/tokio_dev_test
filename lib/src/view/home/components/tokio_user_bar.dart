import 'package:flutter/material.dart';

import '../../../core/domain/entity/tokio_user.dart';
import '../../../shared/colors.dart';

class TokioUserBar extends StatefulWidget {
  final TokioUser tokioUser;
  const TokioUserBar({super.key, required this.tokioUser});

  @override
  State<TokioUserBar> createState() => _TokioUserBarState();
}

class _TokioUserBarState extends State<TokioUserBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.0, 0.0),
          end: Alignment(1.0, 0.0),
          colors: [tokioGreen, tokioYellow],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 50,),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bem vindo",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                widget.tokioUser.name,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
