import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../../home/pages/home_page.dart';
import '../../setting/pages/setting_page.dart';
import '../../club_list/pages/club_list_page.dart';
import '../../news/pages/news_page.dart';
import 'widgets/tab_navigator.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  static String get pageName => 'main';
  static String get pagePath => '/$pageName';

  /// go_routerを使用した画面遷移のメソッドを定義
  static void go(BuildContext context) {
    context.go(pagePath);
  }

  /// 従来のNavigatorを使用した画面遷移のメソッドを定義
  static Future<void> showNav1(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pushReplacement<void, void>(
        PageTransition(
          type: PageTransitionType.fade,
          child: const MainPage(),
          duration: const Duration(milliseconds: 500),
          settings: RouteSettings(name: pageName),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widgetsState =
    useState<List<(GlobalKey<NavigatorState>, String, Widget)>>(
      [
        (
        GlobalKey<NavigatorState>(),
        HomePage.pageName,
        const HomePage(),
        ),
        (
        GlobalKey<NavigatorState>(),
        ClubListPage.pageName,
        const ClubListPage(),
        ),
        (
        GlobalKey<NavigatorState>(),
        NewsPage.pageName,
        const NewsPage(),
        ),
        (
        GlobalKey<NavigatorState>(),
        SettingPage.pageName,
        const SettingPage(),
        ),
      ],
    );
    final widgets = widgetsState.value;

    final selectedTabIndexState = useState(0);
    final selectedTabIndex = selectedTabIndexState.value;

    return Scaffold(
      // キーボードが表示されたときにScaffoldのボディがリサイズされるのを防ぐ
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: selectedTabIndex,
        children: List.generate(
          widgets.length,
              (index) => TabNavigator(
            navigatorKey: widgets[index].$1,
            page: widgets[index].$3,
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          // タブを切り替える
          selectedTabIndexState.value = index;
        },
        selectedIndex: selectedTabIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.feed),
            icon: Icon(Icons.feed_outlined),
            label: 'News',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.groups_3),
            icon: Icon(Icons.groups_3_outlined),
            label: 'ClubList',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
