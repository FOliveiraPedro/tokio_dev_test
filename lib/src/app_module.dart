//Package
import 'package:flutter_modular/flutter_modular.dart';
//Project
import 'view/home/controller/home_controller.dart';
import 'view/home/home.dart';
import 'view/login/controller/login_controller.dart';
import 'view/login/login.dart';
import 'view/login/controller/register_controller.dart';



class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Login Injection
    // BindInject(
    //       (i) => GetReposDatasourceImpl(),
    //   isSingleton: false,
    //   isLazy: true,
    // ),
    // BindInject(
    //       (i) => GetReposRepositoryImpl(i<GetReposDatasource>()),
    //   isSingleton: false,
    //   isLazy: true,
    // ),
    // BindInject(
    //       (i) => GetReposUsecaseImpl(i<GetReposRepository>()),
    //   isSingleton: false,
    //   isLazy: true,
    // ),
    BindInject(
          (i) => LoginController(),
      isSingleton: true,
      isLazy: true,
    ),

    //Register Injection
    BindInject(
          (i) => RegisterController(),
      isSingleton: true,
      isLazy: true,
    ),

    // //Home Injection
    // BindInject(
    //       (i) => GetUserDatasourceImpl(),
    //   isSingleton: false,
    //   isLazy: true,
    // ),
    // BindInject(
    //       (i) => GetUserRepositoryImpl(i<GetUserDatasource>()),
    //   isSingleton: false,
    //   isLazy: true,
    // ),
    // BindInject(
    //       (i) => GetUserUsecaseImpl(i<GetUserRepository>()),
    //   isSingleton: false,
    //   isLazy: true,
    // ),
    BindInject(
          (i) => HomeController(),
      isSingleton: true,
      isLazy: true,
    ),


  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const Login()),
    ChildRoute('/login', child: (_, __) => const Login()),
    ChildRoute('/home', child: (_, args) => Home.fromArgs(args)),
  ];
}
