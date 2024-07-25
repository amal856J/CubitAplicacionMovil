import 'package:cubit_example/controllers/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_example/cubits/shopping_cart_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = RouterController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShoppingCartCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: routerConfig.getRoutesConfig(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo Cubit',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
        ),
      ),
    );
  }
}
