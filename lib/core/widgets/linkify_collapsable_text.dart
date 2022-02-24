import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linkify/linkify.dart';

typedef LinkTapCallback = void Function(String link);

class LinkifyCollapsableText extends StatefulWidget {
  const LinkifyCollapsableText(
    this.data, {
    Key? key,
    this.style,
    this.linkStyle,
    this.expandButtonText = 'Показать все',
    this.expandButtonStyle,
    this.onUrlTap,
    this.onUserTagTap,
    this.onEmailTap,
  }) : super(key: key);

  final String data;
  final TextStyle? style;
  final TextStyle? linkStyle;
  final String expandButtonText;
  final TextStyle? expandButtonStyle;
  final LinkTapCallback? onUrlTap;
  final LinkTapCallback? onUserTagTap;
  final LinkTapCallback? onEmailTap;

  @override
  State<LinkifyCollapsableText> createState() => _LinkifyCollapsableTextState();
}

class _LinkifyCollapsableTextState extends State<LinkifyCollapsableText> {
  bool _textCollapsed = false;
  TapGestureRecognizer? _moreRecognizer;
  late List<LinkifyElement> _linkifyElements;
  List<TextSpan> _textSpans = <TextSpan>[];

  void builtTextSpans() {
    if (_textCollapsed && _textSpans.isEmpty) {
      int textLength = 0;
      for (int i = 0; i < _linkifyElements.length; i++) {
        if (textLength + _linkifyElements[i].text.length > 203) {
          final endingText = _linkifyElements[i].text.substring(0, 203 - textLength);

          if (_linkifyElements[i] is TextElement) {
            _textSpans.add(TextSpan(text: endingText));
          } else if (_linkifyElements[i] is UrlElement) {
            _textSpans.add(TextSpan(
              text: endingText,
              style: widget.linkStyle,
              recognizer: widget.onUrlTap != null ? (TapGestureRecognizer()..onTap = () => widget.onUrlTap!(_linkifyElements[i].text)) : null,
            ));
          } else if (_linkifyElements[i] is UserTagElement) {
            _textSpans.add(TextSpan(
              text: endingText,
              style: widget.linkStyle,
              recognizer: widget.onUserTagTap != null ? (TapGestureRecognizer()..onTap = () => widget.onUserTagTap!(_linkifyElements[i].text)) : null,
            ));
          }

          _textSpans.add(const TextSpan(text: '...  '));
          _textSpans.add(TextSpan(text: widget.expandButtonText, style: widget.expandButtonStyle, recognizer: _moreRecognizer));
          break;
        } else {
          textLength += _linkifyElements[i].text.length;
        }
      }
    } else if (_textSpans.length != _linkifyElements.length) {
      for (int i = _textSpans.length; i < _linkifyElements.length; i++) {
        if (_linkifyElements[i] is TextElement) {
          _textSpans.add(TextSpan(text: _linkifyElements[i].text));
        } else if (_linkifyElements[i] is UrlElement) {
          _textSpans.add(TextSpan(
            text: _linkifyElements[i].text,
            style: widget.linkStyle,
            recognizer: widget.onUrlTap != null ? (TapGestureRecognizer()..onTap = () => widget.onUrlTap!(_linkifyElements[i].text)) : null,
          ));
        } else if (_linkifyElements[i] is UserTagElement) {
          _textSpans.add(TextSpan(
            text: _linkifyElements[i].text,
            style: widget.linkStyle,
            recognizer: widget.onUserTagTap != null ? (TapGestureRecognizer()..onTap = () => widget.onUserTagTap!(_linkifyElements[i].text)) : null,
          ));
        }
      }
    }
  }

  @override
  void initState() {
    _linkifyElements = linkify(widget.data, options: const LinkifyOptions(humanize: false), linkifiers: [const UrlLinkifier(), const UserTagLinkifier()]);

    String postText = widget.data;
    if (postText.length > 203) {
      _textCollapsed = true;
      _moreRecognizer = TapGestureRecognizer()
        ..onTap = () {
          setState(() {
            _textSpans = _textSpans.getRange(0, _textSpans.length - 3).toList();
            _textCollapsed = false;
          });
        };
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_linkifyElements.isNotEmpty) {
      builtTextSpans();

      return RichText(
        text: TextSpan(
          style: widget.style,
          children: List.from(_textSpans),
        ),
      );
    }

    return Text(widget.data, style: widget.style);
  }
}
