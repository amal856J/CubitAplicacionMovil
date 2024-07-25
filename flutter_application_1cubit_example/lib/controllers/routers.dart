import 'package:cubit_example/views/list_products_screen.dart';
import 'package:cubit_example/views/my_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterController {
  GoRouter getRoutesConfig() {
    return GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const MyHomePage(title: "Tiendas RD");
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'list-products',
              builder: (BuildContext context, GoRouterState state) {
                return const ListProductsScreen();
              },
            ),
          ],
        ),
      ],
    );
  }
}
