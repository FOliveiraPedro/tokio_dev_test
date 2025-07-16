//Package
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../states/home_states.dart';
//Project

@Injectable()
class HomeController extends Bloc<String, HomeState> implements Disposable {
  // final GetUserUsecase getUserUsecase;

  HomeController() : super(const StartState());

  @override
  Stream<HomeState> mapEventToState(String event) async* {

  }

  @override
  void dispose() {
    close();
  }
}
