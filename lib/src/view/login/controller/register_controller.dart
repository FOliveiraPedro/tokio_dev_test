//Package
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Project
import '../../../core/domain/entity/tokio_user.dart';
import '../states/register_state.dart';

@Injectable()
class RegisterController extends Bloc<String, RegisterState>
    implements Disposable {
  RegisterController() : super(const StartState());

  String? downloadURL;
  String? fileName;
  File? image;

  @override
  Stream<RegisterState> mapEventToState(String event) async* {}

  Future<String> register(TokioUser tokioUser) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: "${tokioUser.cpf}@tokio.com",
        password: tokioUser.password,
      )
          .then((UserCredential user) async {
            print("user id");
            print(user.user!.uid);
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.user!.uid)
            .set({
          'uid': user.user!.uid,
          'email': tokioUser.email,
          'name': tokioUser.name,
          'cpf': tokioUser.cpf
        });
      });
      print("success");
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
