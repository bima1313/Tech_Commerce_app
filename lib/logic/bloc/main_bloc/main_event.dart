part of 'main_bloc.dart';

@immutable
sealed class MainEvent extends Equatable {
  const MainEvent();
}

@immutable
class MainEventInitialize implements MainEvent {
  const MainEventInitialize();
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

@immutable
class MainEventCheckoutCompleted implements MainEvent {
  const MainEventCheckoutCompleted();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
