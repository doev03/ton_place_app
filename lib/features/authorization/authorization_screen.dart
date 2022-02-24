import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/features/authorization/widgets/authorization_button.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SchemeColors.backgroundPrimary,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Крипто социальная сеть с эксклюзивным контентом',
              textAlign: TextAlign.center,
              style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 36, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Based on',
                  style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 16),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: 28,
                  height: 28,
                  child: SvgPicture.asset('assets/ton_logo.svg'),
                ),
                Text(
                  'TON',
                  style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
            const AuthorizationButton(),
            const SizedBox(height: 24),
            Text(
              'Продолжая, вы соглашаетесь с Правилами и Конфиденциальностью.',
              textAlign: TextAlign.center,
              style: TextStyle(color: SchemeColors.foregroundTertiary, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
