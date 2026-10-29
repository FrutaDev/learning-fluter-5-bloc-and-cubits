import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          name: HomeScreen.name
      ),
      GoRoute(
          path: '/cubits',
          builder: (context, state) => const CubitCounterScreen(),
          name: CubitCounterScreen.name
      ),
      GoRoute(
          path: '/bloc',
          builder: (context, state) => const BlocCounterScreen(),
          name: BlocCounterScreen.name
      ),
      GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen(),
          name: RegisterScreen.name
      ),
    ]
);