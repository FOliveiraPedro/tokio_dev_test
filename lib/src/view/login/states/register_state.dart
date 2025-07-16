abstract class RegisterState {}

class StartState implements RegisterState {
  const StartState();
}

class LoadingState implements RegisterState {
  const LoadingState();
}

class ErrorState implements RegisterState {
  const ErrorState();
}

class SuccessState implements RegisterState {
  const SuccessState();
}
