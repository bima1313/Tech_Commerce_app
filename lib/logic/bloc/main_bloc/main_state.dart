part of 'main_bloc.dart';

@immutable
sealed class MainState extends Equatable {
  final User? user;
  final Iterable<Products>? products;
  final Iterable<Orders>? orderHistories;

  const MainState({
    this.user,
    this.products,
    this.orderHistories,
  });

  @override
  List<Object?> get props => [user, products, orderHistories];
}

@immutable
class MainStateHomeView extends MainState {
  const MainStateHomeView({
    super.user,
    super.products,
    super.orderHistories,
  });

  @override
  List<Object?> get props => [user, products, orderHistories];
}
