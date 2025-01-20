import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/api/firebase/firestore/cloud_firestore.dart';
import 'package:e_commerce/data/enums/trigger_name.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderStateUninitialized(isLoading: false)) {
    on<OrderEventAddCart>(
      (event, emit) {
        List<Map<Products, int>> cacheData = event.orders ?? [];
        List<String> sameProduct = event.sameProduct ?? [];

        if (sameProduct.contains(event.product!.name)) {
          final int index = cacheData.indexWhere(
            (order) => order.keys.single.name == event.product!.name,
          );
          final data = cacheData.elementAt(index);
          data.update(data.keys.single, (value) => data.values.single + 1);
          cacheData[index] = data;
        } else {
          final Map<Products, int> order = {event.product!: 1};
          cacheData.add(order);
          sameProduct.add(event.product!.name);
        }
        emit(
          OrderStateCartView(
            isLoading: false,
            orders: cacheData,
            sameProduct: sameProduct,
          ),
        );
      },
    );
    on<OrderEventEditableItems>(
      (event, emit) {
        final currentState = state as OrderStateCartView;
        final index = currentState.orders!.indexWhere(
          (order) => order.keys.single.name == event.productData.name,
        );
        final data = currentState.orders!.elementAt(index);
        List<Map<Products, int>> cacheData = List.from(currentState.orders!);
        if (event.triggerName == TriggerName.add) {
          data.update(event.productData, (value) => event.items + 1);
          cacheData[index] = data;
          final result = cacheData.fold<double>(
            0,
            (previousValue, element) {
              final orderPrice = element.keys.single.price;
              if (element.values.single > 1) {
                final calculateOrderNow = orderPrice * element.values.single;
                return previousValue + calculateOrderNow;
              } else {
                return previousValue + orderPrice;
              }
            },
          );
          emit(
            OrderStateCartView(
              isLoading: false,
              orders: cacheData,
              totalPrices: result,
            ),
          );
        } else if (event.triggerName == TriggerName.remove) {
          if (event.items != 1) {
            data.update(event.productData, (value) => event.items - 1);
            cacheData[index] = data;
            final result = cacheData.fold<double>(
              0,
              (previousValue, element) {
                final orderPrice = element.keys.single.price;
                if (element.values.single > 1) {
                  final calculateOrderNow = orderPrice * element.values.single;
                  return previousValue + calculateOrderNow;
                } else {
                  return previousValue + orderPrice;
                }
              },
            );
            emit(
              OrderStateCartView(
                isLoading: false,
                orders: cacheData,
                totalPrices: result,
              ),
            );
          }
        } else {
          cacheData.removeAt(index);
          final result = cacheData.fold<double>(
            0,
            (previousValue, element) {
              final orderPrice = element.keys.single.price;
              if (element.values.single > 1) {
                final calculateOrderNow = orderPrice * element.values.single;
                return previousValue + calculateOrderNow;
              } else {
                return previousValue + orderPrice;
              }
            },
          );
          emit(
            OrderStateCartView(
              isLoading: false,
              orders: cacheData,
              totalPrices: result,
            ),
          );
        }
      },
    );
    on<OrderEventCheckout>(
      (event, emit) async {
        final currentState = state as OrderStateCartView;
        emit(
          OrderStateCartView(
            isLoading: true,
            orders: currentState.orders,
            totalPrices: state.totalPrices,
          ),
        );
        final Map<String, int> orders = {};
        for (var index = 0; index < currentState.orders!.length; index++) {
          final cacheOrder = currentState.orders!.elementAt(index);
          final order = {cacheOrder.keys.single.name: cacheOrder.values.single};
          orders.addAll(order);
        }
        await CloudFirestore().createOrder(
          userId: event.userId,
          orders: orders,
          total: event.total,
        );

        emit(OrderStateCheckout(isLoading: false));
      },
    );

    // handle routes
    on<OrderEventGoToCartView>(
      (event, emit) {
        final result = event.orders!.fold<double>(
          0,
          (previousValue, element) {
            final orderPrice = element.keys.single.price;
            if (element.values.single > 1) {
              final calculateOrderNow = orderPrice * element.values.single;
              return previousValue + calculateOrderNow;
            } else {
              return previousValue + orderPrice;
            }
          },
        );
        emit(
          OrderStateCartView(
            isLoading: false,
            orders: event.orders,
            totalPrices: result,
          ),
        );
      },
    );
  }
}
