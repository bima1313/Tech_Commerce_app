import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/api/firebase/auth/auth_service.dart';
import 'package:e_commerce/data/api/firebase/firestore/cloud_firestore.dart';
import 'package:e_commerce/data/api/mongodb/database.dart';
import 'package:e_commerce/data/models/orders.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainStateHomeView()) {
    on<MainEventInitialize>(
      (event, emit) async {
        final user = CloudAuth().currentUser;
        final products = await fetchDatabase();

        final orderHistories = await CloudFirestore().historyOrders(
          userId: user!.uid,
        );

        emit(MainStateHomeView(
          user: user,
          products: products,
          orderHistories: orderHistories,
        ));
      },
    );
    on<MainEventCheckoutCompleted>(
      (event, emit) async {
        final user = CloudAuth().currentUser;

        final orderHistories = await CloudFirestore().historyOrders(
          userId: user!.uid,
        );

        emit(MainStateHomeView(
          user: state.user,
          products: state.products,
          orderHistories: orderHistories,
        ));
      },
    );
  }
}
