
abstract class HomeState {}

class StartState implements HomeState {
  const StartState();
}

class LoadingState implements HomeState {
  const LoadingState();
}

class ErrorState implements HomeState {
  final String message;
  const ErrorState(this.message);
}

class SuccessState implements HomeState {
  const SuccessState();
}

class NotLoggedState implements HomeState {
  const NotLoggedState();
}
