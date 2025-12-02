import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationShell extends StatelessWidget {
  final Widget child;
  const NavigationShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isLarge = MediaQuery.of(context).size.width > 900;

    if (isLarge) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.folder), label: Text("Cases")),
                NavigationRailDestination(icon: Icon(Icons.chat), label: Text("Chat")),
              ],
              selectedIndex: _selectedIndex(context),
              onDestinationSelected: (i) => _navigate(context, i),
            ),
            Expanded(child: child),
          ],
        ),
      );
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex(context),
        onTap: (i) => _navigate(context, i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Cases"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
      ),
    );
  }

  int _selectedIndex(BuildContext context) {
    final loc = GoRouter.of(context).location;
    if (loc.startsWith("/chat")) return 1;
    return 0;
  }

  void _navigate(BuildContext context, int i) {
    switch (i) {
      case 0:
        context.go("/cases");
        break;
      case 1:
        context.go("/chat");
        break;
    }
  }
}
