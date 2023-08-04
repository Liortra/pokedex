part of 'splash_cubit.dart';

@immutable
abstract class BaseSplashState {}

class SplashInitial extends BaseSplashState {}
class LoadingState extends BaseSplashState{}
class NavigateMainPageState extends BaseSplashState{}
class ErrorSplashState extends BaseSplashState{
  final String message;
  final dynamic error;

  ErrorSplashState(this.message, this.error);
}
