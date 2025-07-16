//Package
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Project
import '../../../core/domain/entity/tokio_user.dart';
import '../states/login_states.dart';

@Injectable()
class LoginController extends Bloc<String, LoginState> implements Disposable {
  LoginController() : super(const StartState());

  late TokioUser tokioUser;

  @override
  Stream<LoginState> mapEventToState(String event) async* {}

  Future<String> login(String cpf, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: "$cpf@tokio.com",
        password: password,
      )
          .then((UserCredential user) async {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.user!.uid)
            .get()
            .then((value) {
          tokioUser = TokioUser(
              name: value.data()!['name'],
              email: value.data()!['email'],
              cpf: value.data()!['cpf'],
              password: '');
        });
      });

      return 'success';
    } catch (e) {
      print(e.toString());

      return 'failure';
    }
  }

  @override
  void dispose() {
    close();
  }
}
