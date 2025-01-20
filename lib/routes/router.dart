import 'package:e_commerce/UI/app_initialize.dart';
import 'package:e_commerce/UI/views/cart_view.dart';
import 'package:e_commerce/UI/views/categories_view.dart';
import 'package:e_commerce/UI/views/category_selected_view.dart';
import 'package:e_commerce/UI/views/change_password_view.dart';
import 'package:e_commerce/UI/views/details_view.dart';
import 'package:e_commerce/UI/views/edit_profile_view.dart';
import 'package:e_commerce/UI/views/history_details_view.dart';
import 'package:e_commerce/UI/views/history_view.dart';
import 'package:e_commerce/UI/views/home_view.dart';
import 'package:e_commerce/UI/views/login_view.dart';
import 'package:e_commerce/UI/views/register_view.dart';
import 'package:e_commerce/UI/views/reset_password_view.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:e_commerce/routes/parameters.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    // app initial route
    GoRoute(
      name: Routes.initialRoute,
      path: Parameters.initialPath,
      builder: (context, state) => const AppInitialize(),
    ),

    // authentication routes
    GoRoute(
      name: Routes.loginView,
      path: Parameters.loginPath,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      name: Routes.registerView,
      path: Parameters.registerPath,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      name: Routes.resetPasswordView,
      path: Parameters.resetPasswordPath,
      builder: (context, state) => const ResetPasswordView(),
    ),

    // main routes
    GoRoute(
      name: Routes.homeView,
      path: Parameters.homePath,
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          name: Routes.categoriesView,
          path: Parameters.categoriesPath,
          builder: (context, state) => const CategoriesView(),
          routes: [
            GoRoute(
              name: Routes.categorySelectedView,
              path: Parameters.categorySelectedPath,
              builder: (context, state) {
                final category = state.pathParameters[Parameters.category];

                return CategorySelectedView(category: category);
              },
            ),
          ],
        ),
        GoRoute(
          name: Routes.detailsView,
          path: Parameters.detailsPath,
          builder: (context, state) {
            final product = state.extra as Products?;

            return DetailsView(data: product);
          },
        ),
        GoRoute(
          name: Routes.editProfileView,
          path: Parameters.editProfilePath,
          builder: (context, state) {
            final user = state.extra as User?;

            return EditProfileView(user: user);
          },
        ),
        GoRoute(
          name: Routes.historyView,
          path: Parameters.historyPath,
          builder: (context, state) {
            final user = state.extra as User?;

            return HistoryView(user: user);
          },
          routes: [
            GoRoute(
              name: Routes.historyDetailsView,
              path: Parameters.historyDetailsPath,
              builder: (context, state) {
                final data = state.extra as Map<String, dynamic>;
                return HistoryDetailsView(
                  orders: data['orders'],
                  productData: data['productsData'],
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: Routes.changePasswordView,
          path: Parameters.changePasswordPath,
          builder: (context, state) => const ChangePasswordView(),
        )
      ],
    ),

    GoRoute(
      name: Routes.cartView,
      path: Parameters.cartPath,
      builder: (context, state) => const CartView(),
    ),
  ],
);
