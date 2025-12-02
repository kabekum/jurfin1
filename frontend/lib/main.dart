import 'package:flutter/material.dart';
import 'app_router.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const JuraApp());
}

class JuraApp extends StatelessWidget {
  const JuraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Jura – Lawyer Management System",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: AppRouter.router,
    );
  }
}
