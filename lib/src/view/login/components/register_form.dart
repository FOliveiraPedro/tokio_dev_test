//Packages
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Project
import '../../../core/domain/entity/tokio_user.dart';
import '../../../shared/colors.dart';
import '../../../shared/components/shared_components.dart';
import '../controller/register_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState
    extends ModularState<RegisterForm, RegisterController> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpfController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool nameError = false;
  bool emailError = false;
  bool cpfError = false;
  bool passwordError = false;
  bool confirmPasswordError = false;
  File? _selectedImage;

  bool validate(String email, String password, String cpf, String name,
      String confirmPassword) {
    if (email == "" ||
        password == "" ||
        cpf == "" ||
        name == "" ||
        confirmPassword == "") {
      return false;
    }
    if (password != confirmPassword) {
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
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
              child: TokioTextFormField(
                controller: nameController,
                showLabel: true,
                label: "Nome completo",
                hintText: "Digite seu nome completo",
                showError: nameError,
                hasIcon: true,
                icon: Icons.person,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 12, right: 25),
              child: TokioTextFormField(
                controller: emailController,
                showLabel: true,
                label: "E-mail",
                hintText: "Digite seu e-mail",
                showError: emailError,
                hasIcon: true,
                icon: Icons.email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 12, right: 25),
              child: TokioTextFormField(
                controller: cpfController,
                showLabel: true,
                label: "CPF",
                hintText: "Digite seu CPF",
                showError: cpfError,
                hasIcon: true,
                icon: Icons.email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 12, right: 25),
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
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 12, right: 25),
              child: TokioTextFormField(
                controller: confirmPasswordController,
                showLabel: true,
                label: "Confirme sua senha",
                hintText: "Confirme sua senha",
                showError: confirmPasswordError,
                obscureText: true,
                hasIcon: true,
                icon: Icons.lock,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () async {
                  //Função aqui
                  if (validate(
                      emailController.text,
                      passwordController.text,
                      cpfController.text,
                      nameController.text,
                      confirmPasswordController.text)) {
                    loadDialog();
                    String result = await controller.register(TokioUser(
                      cpf: cpfController.text,
                      email: emailController.text,
                      name: nameController.text,
                      password: passwordController.text,
                    ));
                    if (result == 'success') {
                      Navigator.pop(context);
                      successDialog();
                    } else {
                      Navigator.pop(context);
                      errorDialog("Não foi possivel logar");
                    }
                  } else {
                    setState(() {
                      emailError = true;
                      passwordError = true;
                      cpfError = true;
                      nameError = true;
                      confirmPasswordError = true;
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
            )
          ],
        ),
      ),
    );
  }
}
