import 'package:csci_project/app/pages/admin_main_page.dart';
import 'package:csci_project/app/pages/auth/login_page.dart';
import 'package:csci_project/app/pages/register_doctor_page.dart';
import 'package:csci_project/app/pages/register_patient_page.dart';
import 'package:csci_project/app/pages/modify_patient_page.dart';
import 'package:csci_project/domain/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  // final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter routes() {
    //AuthenticationBloc authenticationBloc) {
    return GoRouter(
      // navigatorKey: _rootNavigatorKey,
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return const AdminMainPage();
            },
            routes: [
              GoRoute(
                path: 'doctor',
                builder: (BuildContext context, GoRouterState state) {
                  return const RegisterDoctorPage();
                },
              ),
              GoRoute(
                path: 'patient',
                builder: (BuildContext context, GoRouterState state) {
                  return const RegisterPatientPage();
                },
              ),
              GoRoute(
                path: 'modify',
                builder: (BuildContext context, GoRouterState state) {
                  return ModifyPatientPage(oldData: state.extra as Patient);
                },
              ),
            ])
      ],
      // redirect: (context, state) {
      //   // final authenticationBloc2 = context.read<AuthenticationBloc>();
      //   final isLoggedIn = authenticationBloc.state.status ==
      //       AuthenticationStatus.authenticated;
      //   final isLoggingIn = state.location == AppRoutes.login.path ||
      //       state.location == AppRoutes.signUpPage.path;

      //   if (!isLoggedIn && !isLoggingIn) {
      //     return AppRoutes.login.path;
      //   }
      //   if (isLoggedIn && isLoggingIn) {
      //     return AppRoutes.feed.path;
      //   }
      //   // print('REDIRECT $isLoggedIn $isLoggingIn');
      //   return null;
      // },
      // refreshListenable: authenticationBloc,
    );
  }
}
