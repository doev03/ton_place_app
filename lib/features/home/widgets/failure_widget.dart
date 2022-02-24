import 'package:flutter/material.dart';
import 'package:ton_place/core/colors.dart';

class FailureDialog extends StatelessWidget {
  const FailureDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final EdgeInsets effectivePadding = MediaQuery.of(context).viewInsets;

    return AnimatedPadding(
      padding: effectivePadding,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Align(
          alignment: dialogTheme.alignment ?? Alignment.center,
          child: Material(
            color: RootColors.constantLight,
            elevation: 24.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            type: MaterialType.card,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                'Ошибка сети',
                style: TextStyle(color: RootColors.constantDark, fontSize: 18, height: 24.0 / 18.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
