//Package
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Project
import '../../core/domain/entity/tokio_user.dart';
import '../../shared/colors.dart';
import 'components/tokio_drawer.dart';
import 'components/tokio_home_body.dart';
import 'components/tokio_user_bar.dart';
import 'controller/home_controller.dart';

class Home extends StatefulWidget {
  late TokioUser tokioUser;

  Home({super.key});

  Home.fromArgs(dynamic arguments) {
    tokioUser = arguments.data['user'];
  }

  static void navigate(TokioUser user) {
    Modular.to.pushNamed(
      '/home',
        arguments: {'user': user}
    );
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends ModularState<Home, HomeController> {
  final usernameController = TextEditingController();

  List<String> suggestionList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ))),
        centerTitle: true,
        title: Text(
          "Tokio",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          )
        ],
        backgroundColor: darkGrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TokioUserBar(tokioUser: widget.tokioUser,),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 75,
          //   padding: EdgeInsets.only(left: 16),
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment(-1.0, 0.0),
          //       end: Alignment(1.0, 0.0),
          //       colors: [tokioGreen, tokioYellow],
          //     ),
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       CircleAvatar(
          //         radius: 24,
          //       ),
          //       SizedBox(
          //         width: 8,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Bem vindo",
          //             style: TextStyle(color: Colors.white),
          //           ),
          //           Text(
          //             "Pedro F Oliveira",
          //             style: TextStyle(fontSize: 20, color: Colors.white),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TokioHomeBody(),
          )
        ],
      ),
      drawer: TokioDrawer(tokioUser: widget.tokioUser,),
    );
  }
}
