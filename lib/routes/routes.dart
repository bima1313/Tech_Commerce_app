import 'package:flutter/foundation.dart';

@immutable
abstract class Routes {
  static const initialRoute = 'initial';
  static const loginView = 'login';
  static const registerView = 'register';
  static const resetPasswordView = 'reset_password';
  static const mainView = 'main_view';
  static const homeView = 'home';
  static const categoriesView = 'categories';
  static const categorySelectedView = 'category_selected';
  static const detailsView = 'details';
  static const cartView = 'cart';
  static const editProfileView = 'edit_profile';
  static const historyView = 'history';
  static const historyDetailsView = 'history_details';
  static const changePasswordView = 'change_password';
}
