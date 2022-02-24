import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class OtherHeader extends StatelessWidget {
  const OtherHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Center(
        child: Text(
          'Ещё',
          style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
