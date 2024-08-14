import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chatBot_home_page.dart';
import 'package:maze_app/feature/profile/presentation/view/profile_home_page.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/view/knowledge_page.dart';

@RoutePage()
class BottomNavigation extends StatefulWidget implements AutoRouteWrapper {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<KnowledgeCubit>(), child: this);
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Scaffold(
      body: Center(
        child: Text("page must be added here"),
      ),
    ),
    KnowledgePage(),
   ChatBotHomePage(),
    Scaffold(
      body: Center(
        child: Text("page must be added here"),
      ),
    ),
    ProfileHomePage()

  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: appAssets.communityIcon.svg(
              color: _selectedIndex == 0
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: appAssets.knowledgeIcon.svg(
              color: _selectedIndex == 1
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Knowledge',
          ),
          BottomNavigationBarItem(
            icon: appAssets.liveChatIcon.svg(
              color: _selectedIndex == 2
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Live chat',
          ),
          BottomNavigationBarItem(
            icon: appAssets.trackerIcon.svg(
              color: _selectedIndex == 3
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: appAssets.profileIcon.svg(
              color: _selectedIndex == 4
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).colorScheme.tertiaryText,
      ),
    );
  }
}
