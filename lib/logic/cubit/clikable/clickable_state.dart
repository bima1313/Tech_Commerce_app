part of 'clickable_cubit.dart';

@immutable
sealed class ClickableState extends Equatable {
  final List<String> favoriteList;

  const ClickableState({required this.favoriteList});

  @override
  List<Object> get props => [favoriteList];
}

@immutable
class ClickableInitial extends ClickableState {
  const ClickableInitial({
    required super.favoriteList,
  });
}
