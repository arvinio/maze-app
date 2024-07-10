part of 'intro_cubit.dart';

sealed class IntroState extends Equatable {
  const IntroState();

  @override
  List<Object> get props => [];
}

final class IntroInitial extends IntroState {}

final class IsFirstRun extends IntroState{}

final class SplashLoading extends IntroState{}

final class UserLoggedIn extends IntroState{}
final class UserNotLoggedIn extends IntroState{}


