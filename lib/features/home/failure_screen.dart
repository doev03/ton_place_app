import 'package:flutter/material.dart';
import 'package:ton_place/core/colors.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({Key? key, this.callback}) : super(key: key);

  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Не удалось загрузить страницу',
            style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 24, height: 32.0 / 24.0, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            'Произошла ошибка либо страница еще не создана, попробуйте позже',
            style: TextStyle(color: SchemeColors.foregroundTertiary, fontSize: 16, height: 24.0 / 16.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: callback,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: RootColors.tint,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Попробовать еще',
                style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 16, height: 22.0 / 16, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
