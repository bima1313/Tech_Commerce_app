import 'package:flutter/foundation.dart';

@immutable
class Parameters {
  static String category = 'category';
  static String initialPath = '/';
  static String loginPath = '/login';
  static String registerPath = '/register';
  static String resetPasswordPath = '/reset_password';
  static String homePath = '/home';
  static String categoriesPath = 'categories';
  static String categorySelectedPath = 'category_selected/:$category';
  static String detailsPath = 'details';
  static String cartPath = '/cart';
  static String editProfilePath = 'edit_profile';
  static String historyPath = 'history';
  static String historyDetailsPath = 'history_details';
  static String changePasswordPath = 'change_password';
}
