import 'package:flutter/material.dart';
import 'package:nekidaem_test/scr/generated/l10n.dart';

import 'elements/auth_body.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(S.of(context).app_bar_title),
        centerTitle: false,
        backgroundColor: Colors.white12,
      ),
      body: AuthBody(),
    );
  }
}
