//Packages
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
//Project

import '../../shared/colors.dart';
import '../../shared/components/shared_components.dart';
import 'components/login_background.dart';
import 'components/login_form.dart';
import 'components/register_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static void navigate() {
    Modular.to.pushReplacementNamed(
      '/login',
      arguments: {},
    );
  }

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool cpfError = false;
  bool passwordError = false;
  String formType = "login";

  bool validate(String email, String password) {
    if (email == "" || password == "") {
      return false;
    }
    return true;
  }

  void loadDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoadingDialog();
        });
  }

  void errorDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(
              message: "Ocorreu um erro no login, tente novamente");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            //Background
            LoginBackground(),
            // Column(
            //   children: [
            //     Container(
            //       height: MediaQuery.of(context).size.height * 0.5,
            //       width: MediaQuery.of(context).size.width,
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //           begin: Alignment(-1.0, 0.0),
            //           end: Alignment(1.0, 0.0),
            //           colors: [tokioGreen, tokioYellow],
            //           transform: GradientRotation(math.pi / 4),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: MediaQuery.of(context).size.height * 0.5,
            //       width: MediaQuery.of(context).size.width,
            //       color: darkGrey,
            //     )
            //   ],
            // ),

            //Form Card
            Center(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // Add width condition of Web
                  if (constraints.maxWidth > 600) {
                    return _buildWeb();
                  } else {
                    return _buildMobile();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMobile(){
    return Container(
      height: formType == "login"
          ? MediaQuery.of(context).size.height * 0.4
          : MediaQuery.of(context).size.height * 0.67,

      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 32),
      padding: EdgeInsets.only(left: 32,top: 16,right: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: darkBlue,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Form Selector
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (formType == "cadastrar") {
                    setState(() {
                      formType = "login";
                    });
                  }
                },
                child: Text(
                  "Entrar",
                  style: formType == "login"
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
                  if (formType == "login") {
                    setState(() {
                      formType = "cadastrar";
                    });
                  }
                },
                child: Text(
                  "Cadastrar",
                  style: formType == "cadastrar"
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
          ),

          //Login Form
          Visibility(
            visible: formType == "login" ? true : false,
            child: Expanded(
              child: Center(
                child: LoginForm(),
              ),
            ),
          ),

          //Register Form
          Visibility(
            visible: formType == "cadastrar" ? true : false,
            child: Expanded(child: Center(child: RegisterForm())),
          )
        ],
      ),
    );
  }

  Widget _buildWeb(){
    return Container(
      height: formType == "login"
          ? MediaQuery.of(context).size.height * 0.4
          : MediaQuery.of(context).size.height * 0.67,
      width: MediaQuery.of(context).size.width*0.3,
      margin: EdgeInsets.symmetric(horizontal: 32),
      padding: EdgeInsets.only(left: 32,top: 16,right: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: darkBlue,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Form Selector
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (formType == "cadastrar") {
                    setState(() {
                      formType = "login";
                    });
                  }
                },
                child: Text(
                  "Entrar",
                  style: formType == "login"
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
                  if (formType == "login") {
                    setState(() {
                      formType = "cadastrar";
                    });
                  }
                },
                child: Text(
                  "Cadastrar",
                  style: formType == "cadastrar"
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
          ),

          //Login Form
          Visibility(
            visible: formType == "login" ? true : false,
            child: Expanded(
              child: Center(
                child: LoginForm(),
              ),
            ),
          ),

          //Register Form
          Visibility(
            visible: formType == "cadastrar" ? true : false,
            child: Expanded(child: Center(child: RegisterForm())),
          )
        ],
      ),
    );
  }
}
