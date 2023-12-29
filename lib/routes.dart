import 'package:dynamic_form/screens/create/index.dart';
import 'package:dynamic_form/screens/read/index.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
class Routing {
  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ReadScreen(),
      ),
      GoRoute(
        path: '/create',
        builder: (context, state) => CreatePage(),
      ),
    ],
  );
}
