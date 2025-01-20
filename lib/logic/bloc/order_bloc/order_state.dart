part of 'order_bloc.dart';

@immutable
sealed class OrderState extends Equatable {
  final bool isLoading;
  final List<Map<Products, int>>? orders;
  final List<String>? sameProduct;
  final double? totalPrices;

  const OrderState({
    required this.isLoading,
    this.orders,
    this.sameProduct,
    this.totalPrices,
  });

  @override
  List<Object?> get props => [isLoading, orders, sameProduct, totalPrices];
}

@immutable
class OrderStateUninitialized extends OrderState {
  const OrderStateUninitialized({required super.isLoading});
}

@immutable
class OrderStateCartView extends OrderState {
  const OrderStateCartView({
    required super.isLoading,
    super.orders,
    super.sameProduct,
    super.totalPrices,
  });

  @override
  List<Object?> get props => [isLoading, orders, totalPrices];
}

@immutable
class OrderStateCheckout extends OrderState {
  const OrderStateCheckout({required super.isLoading});

  @override
  List<Object?> get props => [isLoading];
}
