//Packages
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Project
import '../../../shared/colors.dart';
import '../../../shared/components/shared_components.dart';
import '../../home/home.dart';
import '../controller/login_controller.dart';
import '../login.dart';
import '../controller/register_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ModularState<LoginForm, LoginController> {
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool cpfError = false;
  bool passwordError = false;


  bool validate(String email, String password) {
    if (email == "" || password == "") {
      return false;
    }
    return true;
  }

  void successDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SuccessDialog();
        });
  }

  void loadDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoadingDialog();
        });
  }

  void errorDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(
            message: message,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 5),
            child: TokioTextFormField(
              controller: cpfController,
              showLabel: true,
              label: "CPF",
              hintText: "",
              showError: cpfError,
              hasIcon: true,
              icon: Icons.email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 5),
            child: TokioTextFormField(
              controller: passwordController,
              showLabel: true,
              label: "Senha",
              hintText: "Digite sua senha",
              showError: passwordError,
              obscureText: true,
              hasIcon: true,
              icon: Icons.lock,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: tokioGreen,
                      value: true,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {},
                    ),
                  ),
                  Text(
                    "Lembrar Sempre",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "Esqueceu a senha?",
                style: TextStyle(
                  color: tokioGreen,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
              onTap: () async {
                //Função aqui
                if (validate(cpfController.text,
                    passwordController.text)) {
                  loadDialog();
                  String result = await controller.login(
                      cpfController.text,
                      passwordController.text);
                  if (result == 'success') {
                    Home.navigate(controller.tokioUser);
                  } else {
                    Navigator.pop(context);
                    errorDialog("Não foi possivel logar");
                  }
                } else {
                  setState(() {
                    cpfError = true;
                    passwordError = true;
                  });
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment(-1.0, -1.0),
                    end: Alignment(1.0, 1.0),
                    colors: [tokioGreen, tokioYellow],
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
