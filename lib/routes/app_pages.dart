import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logout/bindings/logout_binding.dart';
import '../modules/logout/views/logout_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_screen.dart';
import '../utils/library.dart';
part 'app_routes.dart';
class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;
  static const initialLogin = Routes.LOGIN;
  static const initialHome = Routes.DASHBOARD;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => LogoutScreen(),
      binding: LogoutBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
      transition: Transition.downToUp,
    ),
  ];
}
