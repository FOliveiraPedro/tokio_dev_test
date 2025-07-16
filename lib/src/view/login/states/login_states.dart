abstract class LoginState {}

class StartState implements LoginState {
  const StartState();
}

class LoadingState implements LoginState {
  const LoadingState();
}

class ErrorState implements LoginState {
  const ErrorState();
}

class SuccessState implements LoginState {
  const SuccessState();
}

class NotLoggedState implements LoginState {
  const NotLoggedState();
}
