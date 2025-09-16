import 'package:go_router/go_router.dart';
import 'package:uyjoy/config/router/main_scaffold.dart';
import 'package:uyjoy/config/router/routes.dart';
import 'package:uyjoy/core/widgets/panorama_wodgets.dart';
import 'package:uyjoy/features/add/presentation/pages/add_page.dart';
import 'package:uyjoy/features/auth/presentation/pages/login/login_page.dart';
import 'package:uyjoy/features/auth/presentation/pages/reset_password/reset_otp.dart';
import 'package:uyjoy/features/auth/presentation/pages/reset_password/reset_otp_verify.dart';
import 'package:uyjoy/features/auth/presentation/pages/reset_password/reset_password.dart';
import 'package:uyjoy/features/auth/presentation/pages/sign_up/otp_page.dart';
import 'package:uyjoy/features/auth/presentation/pages/sign_up/otp_verify.dart';
import 'package:uyjoy/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:uyjoy/features/home/presentation/pages/home_page.dart';
import 'package:uyjoy/features/map/presentation/pages/map_page.dart';
import 'package:uyjoy/features/message/presentation/pages/message_page.dart';
import 'package:uyjoy/features/profile/presentation/pages/profile_page.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.login,
  routes: [
    ShellRoute(

      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(path: Routes.home, builder: (context, state) => PropertyGridScreen()),
        GoRoute(path: Routes.map, builder: (context, state) => MapPage()),
        GoRoute(path: Routes.add, builder: (context, state) => AddPage()),
        GoRoute(
          path: Routes.message,
          builder: (context, state) => MessagePage(),
        ),
        GoRoute(
          path: Routes.profile,
          builder: (context, state) => ProfilePage(),
        ),
      ],
    ),
    GoRoute(path: Routes.otp, builder: (context, state) => OtpPage()),
    GoRoute(path: Routes.otpVerify, builder: (context, state) => OtpVerify()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpPage()),
    GoRoute(path: Routes.resetOtp, builder: (context, state) => ResetOtpPage()),
    GoRoute(
      path: Routes.resetOtpVerify,
      builder: (context, state) => ResetOtpVerify(),
    ),
    GoRoute(
      path: Routes.resetPassword,
      builder: (context, state) => ResetPasswordPage(),
    ),
    GoRoute(path: Routes.login, builder: (context, state) => LoginPage()),
  ],
);
