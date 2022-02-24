import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/features/authorization/repositories/authorization_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorizationButton extends StatefulWidget {
  const AuthorizationButton({Key? key}) : super(key: key);

  @override
  _AuthorizationButtonState createState() => _AuthorizationButtonState();
}

class _AuthorizationButtonState extends State<AuthorizationButton> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: RootColors.tint,
      ),
      child: InkWell(
        onTap: () {
          AuthorizationRepository().auth();
        },
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          child: Center(
            child: Text(
              'Войти через Telegram',
              style: TextStyle(color: RootColors.constantLight, fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
