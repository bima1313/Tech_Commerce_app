part of 'order_bloc.dart';

@immutable
sealed class OrderEvent extends Equatable {
  const OrderEvent();
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

@immutable
class OrderEventAddCart implements OrderEvent {
  final List<Map<Products, int>>? orders;
  final Products? product;
  final List<String>? sameProduct;

  const OrderEventAddCart({
    required this.orders,
    required this.product,
    required this.sameProduct,
  });

  @override
  List<Object?> get props => [orders, product, sameProduct];

  @override
  bool? get stringify => false;
}

@immutable
class OrderEventEditableItems implements OrderEvent {
  final Products productData;
  final int items;
  final TriggerName triggerName;
  const OrderEventEditableItems({
    required this.productData,
    required this.items,
    required this.triggerName,
  });

  @override
  List<Object?> get props => [productData, items, triggerName];

  @override
  bool? get stringify => false;
}

@immutable
class OrderEventCheckout implements OrderEvent {
  final List<Map<Products, int>>? orders;
  final String userId;
  final double total;
  const OrderEventCheckout({
    this.orders,
    required this.userId,
    required this.total,
  });
  @override
  List<Object?> get props => [orders, userId, total];

  @override
  bool? get stringify => false;
}

// events for routing
@immutable
class OrderEventGoToCartView implements OrderEvent {
  final List<Map<Products, int>>? orders;
  const OrderEventGoToCartView({required this.orders});
  @override
  List<Object?> get props => [orders];

  @override
  bool? get stringify => false;
}
