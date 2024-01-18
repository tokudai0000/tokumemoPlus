import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = routerProvider;
    return MaterialApp.router(
      title: 'トクメモ＋',
      debugShowCheckedModeBanner: false,//Debugのバナーを消す

      // ルーティングに関連する設定
      routeInformationParser: router.routeInformationParser, // URLからルート情報を解析
      routerDelegate: router.routerDelegate, // アプリのナビゲーションロジックを担当
      routeInformationProvider: router.routeInformationProvider, // 現在のルート情報を提供
    );
  }
}
