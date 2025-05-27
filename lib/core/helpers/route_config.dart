import 'package:go_router/go_router.dart';
import 'package:my_personal_portfolio/ui/main_page.dart';


class RouteConfig {
  static GoRouter returnRouter(){
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: MainPage.routeName,
          builder: (context, state) => const MainPage(),

        ),
      ],
    );
  }

}