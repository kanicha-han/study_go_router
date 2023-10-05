import 'package:flutter/material.dart';
import 'package:study_go_router/route/route.dart';

class UserPage extends StatelessWidget {
  const UserPage({uid, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'UserPage',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
                onPressed: () {
                  SplashRoute().go(context);
                },
                child: Text('ログイン画面にいく')),
          ],
        ),
      ),
    );
  }
}
