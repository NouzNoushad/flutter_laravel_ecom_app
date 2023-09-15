import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'widgets/bloc_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocWidget(
      child: MaterialApp.router(
        title: 'Flutter Ecommerce App',
        routeInformationParser: Routes.goRouter.routeInformationParser,
        routeInformationProvider: Routes.goRouter.routeInformationProvider,
        routerDelegate: Routes.goRouter.routerDelegate,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
