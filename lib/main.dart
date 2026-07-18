import 'package:flutter/material.dart';
import 'config/routes/AppRoutes.dart';
import 'config/theme/CinephileTheme.dart';

import 'package:provider/provider.dart';
import 'providers/MovieProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider()..getPopularMovies(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinephile',
      debugShowCheckedModeBanner: false,
      theme: CinephileTheme.darkTheme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
