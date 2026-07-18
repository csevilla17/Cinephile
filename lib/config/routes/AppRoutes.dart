import 'package:flutter/material.dart';
import '../../screens/HomeScreen.dart';
import '../../screens/LoginScreen.dart';
import '../../screens/SubscriptionScreen.dart';
import '../../screens/ExplorerScreen.dart';
import '../../screens/InfoScreen.dart';
import '../../screens/InfoScreenDev.dart';

abstract class AppRoutes {
  static const initialRoute = '/home';

  static Map<String, WidgetBuilder> get routes => {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/subscription': (context) => const SubscriptionScreen(),
        '/explorer': (context) => const ExplorerScreen(),
        '/info': (context) => const InfoScreen(),
        '/info-dev': (context) => const InfoScreenDev(),
      };
}
