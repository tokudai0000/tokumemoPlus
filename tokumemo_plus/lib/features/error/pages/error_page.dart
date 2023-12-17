import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app_wrapper/pages/main_page.dart';

/// エラー時に表示されるページ
class ErrorPage extends HookWidget {
  const ErrorPage({
    super.key,
  });

  static String get pageName => 'error';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ErrorPage',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ErrorPage',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // ボタンの背景色
                  fixedSize: const Size(200, 40), // ボタンのサイズ
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0), // 角の丸み
                  ),
                ),
                onPressed: () {
                  MainPage.go(context);
                },
                child: const Text(
                  'Go Back',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
