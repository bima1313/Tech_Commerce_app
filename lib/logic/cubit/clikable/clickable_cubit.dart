import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'clickable_state.dart';

class ClickableCubit extends Cubit<ClickableState> {
  ClickableCubit() : super(ClickableInitial(favoriteList: []));

  void clickChanged({required String productName}) {
    if (state.favoriteList.contains(productName)) {
      final removeFavorite = state.favoriteList
          .where(
            (item) => item != productName,
          )
          .toList();
      emit(ClickableInitial(favoriteList: removeFavorite));
    } else {
      emit(
        ClickableInitial(
          favoriteList: [...state.favoriteList, productName],
        ),
      );
    }
  }
}
