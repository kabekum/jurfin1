import 'package:go_router/go_router.dart';
import 'screens/splash_page.dart';
import 'screens/login_page.dart';
import 'screens/home/navigation_shell.dart';
import 'screens/cases/cases_list_page.dart';
import 'screens/cases/case_detail_page.dart';
import 'screens/clients/clients_list_page.dart';
import 'screens/clients/client_detail_page.dart';
import 'screens/chat/chat_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (ctx, s) => const SplashPage()),
      GoRoute(path: '/login', builder: (ctx, s) => const LoginPage()),
      ShellRoute(
        builder: (ctx, s, child) => NavigationShell(child: child),
        routes: [
          GoRoute(path: '/cases', builder: (ctx, s) => const CasesListPage()),
          GoRoute(path: '/cases/:id', builder: (ctx, s) => CaseDetailPage(caseId: s.pathParameters['id']!)),
          GoRoute(path: '/clients', builder: (ctx, s) => const ClientsListPage()),
          GoRoute(path: '/clients/:id', builder: (ctx, s) => ClientDetailPage(id: s.pathParameters['id']!)),
          GoRoute(path: '/chat', builder: (ctx, s) => const ChatPage()),
        ],
      ),
    ],
  );
}