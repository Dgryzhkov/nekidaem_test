import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:nekidaem_test/scr/pages/auth_page.dart';
import 'package:nekidaem_test/scr/pages/task/task_page.dart';

import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AuthPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/task') {
          final argument = settings.arguments as String;
          return MaterialPageRoute(builder: (_) => TaskPage(token: argument));
        }
        return null;
      },
      initialRoute: '/',
    );
  }
}