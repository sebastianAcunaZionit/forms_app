import 'package:forms_app/presentation/screens/screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cubit',
      builder: (context, state) => const CubitCounterScreen(),
    ),
    GoRoute(
      path: '/block',
      builder: (context, state) => const BlockCounterScreen(),
    ),
    GoRoute(
      path: '/new-user',
      builder: (context, state) => const RegisterScreen(),
    )
  ],
);
