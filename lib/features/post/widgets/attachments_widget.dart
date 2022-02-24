import 'package:flutter/material.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/core/models/models.dart';
import 'collage_widget.dart';
import 'package:ton_place/features/post/widgets/post_widget.dart';

class AttachmentsWidget extends StatelessWidget {
  const AttachmentsWidget({Key? key, required this.attachments}) : super(key: key);
  final List<Attachment> attachments;

  @override
  Widget build(BuildContext context) {
    bool isLink = false;
    if (attachments.first.type == AttachmentType.link) {
      isLink = true;

      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Запись на стене',
              style: TextStyle(
                color: SchemeColors.foregroundTertiary,
                fontSize: 15,
                height: 18.0 / 15.0,
              ),
            ),
          ),
          PostWidget(
            post: attachments.first.link!.object!,
            user: attachments.first.link!.extra is User ? attachments.first.link!.extra : null,
            group: attachments.first.link!.extra is Group ? attachments.first.link!.extra : null,
            isInner: true,
          ),
        ],
      );
    }

    return Column(
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return CollageWidget(
            attachments: attachments,
            width: constraints.maxWidth,
          );
        }),
      ],
    );
  }
}
