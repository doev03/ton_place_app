import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/core/models/models.dart';
import 'package:ton_place/core/widgets/linkify_collapsable_text.dart';
import 'package:ton_place/core/widgets/user_photo.dart';
import 'package:ton_place/core/word_ending.dart';

import 'attachments_widget.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.post,
    this.user,
    this.group,
    this.isInner = false,
  })  : assert(user == null || group == null),
        super(key: key);

  final Post post;
  final User? user;
  final Group? group;
  final bool isInner;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isUser = widget.user != null;

    String postText = widget.post.text!;

    return Container(
      margin: widget.isInner ? EdgeInsets.zero : const EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(top: 16, bottom: widget.isInner ? 0 : 16),
      decoration: BoxDecoration(
        color: SchemeColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (isUser) {
                Navigator.pushNamed(context, 'profile', arguments: [widget.user!.id.toString()]);
              } else {
                Navigator.pushNamed(context, 'group', arguments: [widget.group!.id.toString()]);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserPhoto(
                    photoId: isUser ? widget.user!.photoId! : widget.group!.photoId!,
                    photo: isUser ? widget.user!.photo! : widget.group!.photo!,
                    borderRadius: BorderRadius.circular(12),
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${isUser ? widget.user!.firstName : widget.group!.name} ${isUser ? widget.user!.lastName : ''}',
                        style: TextStyle(
                          color: SchemeColors.foregroundPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          height: 22.0 / 16.0,
                        ),
                      ),
                      Text(
                        getDateDiffText(Duration(seconds: DateTime.now().millisecondsSinceEpoch ~/ 1000 - widget.post.createdAt!)),
                        style: TextStyle(color: SchemeColors.foregroundTertiary, fontSize: 14, height: 18.0 / 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (postText.isNotEmpty) const SizedBox(height: 16),
          if (postText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinkifyCollapsableText(
                postText,
                style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 17),
                linkStyle: const TextStyle(decoration: TextDecoration.underline),
                expandButtonStyle: TextStyle(color: SchemeColors.foregroundTertiary),
              ),
            ),
          if (widget.post.attachments!.isNotEmpty) const SizedBox(height: 12),
          if (widget.post.attachments!.isNotEmpty)
            AttachmentsWidget(
              attachments: widget.post.attachments!,
            ),
          if (!widget.isInner)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.post.likes != 0)
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                    child: Text(
                      '${widget.post.likes} лайка',
                      style: TextStyle(color: SchemeColors.foregroundTertiary, fontSize: 16, height: 20.0 / 16.0, decoration: TextDecoration.underline),
                    ),
                  ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                          decoration: BoxDecoration(color: SchemeColors.backgroundSecondary, borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset('assets/like.svg', color: SchemeColors.foregroundTertiary),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(color: SchemeColors.backgroundSecondary, borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset('assets/comment.svg', color: SchemeColors.foregroundTertiary),
                            ),
                            if (widget.post.comments != 0)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  widget.post.comments.toString(),
                                  style: TextStyle(
                                    color: SchemeColors.foregroundTertiary,
                                    fontSize: 16,
                                    height: 22.0 / 16.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(color: SchemeColors.backgroundSecondary, borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset('assets/repost.svg', color: SchemeColors.foregroundTertiary),
                            ),
                            if (widget.post.shares != 0)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  widget.post.shares.toString(),
                                  style: TextStyle(
                                    color: SchemeColors.foregroundTertiary,
                                    fontSize: 16,
                                    height: 22.0 / 16.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      if (widget.post.views != 0)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 18,
                              height: 18,
                              child: SvgPicture.asset(
                                'assets/eye.svg',
                                color: SchemeColors.foregroundTertiary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            if (widget.post.views != 0)
                              Text(widget.post.views.toString(), style: TextStyle(color: SchemeColors.foregroundTertiary, fontSize: 15, height: 18.0 / 15.0)),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
