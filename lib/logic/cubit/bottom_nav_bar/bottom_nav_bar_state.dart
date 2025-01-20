part of 'bottom_nav_bar_cubit.dart';

@immutable
sealed class BottomNavBarState extends Equatable {
  final int index;
  const BottomNavBarState({required this.index});

  @override
  List<Object> get props => [index];
}

@immutable
class BottomNavBarInitial extends BottomNavBarState {
  const BottomNavBarInitial({required super.index});
}
