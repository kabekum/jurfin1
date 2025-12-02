import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/splash_page.dart';
import 'screens/login_page.dart';
import 'screens/home/navigation_shell.dart';
import 'screens/cases/cases_list_page.dart';
import 'screens/cases/case_detail_page.dart';
import 'screens/chat/chat_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/splash",
    routes: [
      GoRoute(
        path: "/splash",
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => NavigationShell(child: child),
        routes: [
          GoRoute(
            path: "/cases",
            builder: (context, state) => const CasesListPage(),
          ),
          GoRoute(
            path: "/cases/:id",
            builder: (context, state) => CaseDetailPage(caseId: state.pathParameters["id"]!),
          ),
          GoRoute(
            path: "/chat",
            builder: (context, state) => const ChatPage(),
          ),
        ],
      ),
    ],
  );
}
