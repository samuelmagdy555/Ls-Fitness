import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  final bool isSentByMe;
  final String message;
  final String time;
  final String? isReplayedName;
  final String? isReplayedText;
  final List<Reaction>? reactions;
  final List<Media>? media;
  final double width;

  const ChatBubble({
    Key? key,
    required this.isSentByMe,
    required this.message,
    required this.time,
    this.isReplayedName,
    this.isReplayedText,
    this.reactions,
    this.media,
    required this.width,
  }) : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  double offsetX = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          offsetX += details.delta.dx;
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          offsetX = 0.0; // Reset position with animation
        });
      },
      child: Transform.translate(
        offset: Offset(offsetX, 0),
        child: Align(
          alignment:
          widget.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: widget.isSentByMe
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ConstrainedBox(
                    constraints:
                    BoxConstraints(maxWidth: widget.width * .5),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17.5, vertical: 12),
                      decoration: BoxDecoration(
                        color: widget.isSentByMe
                            ? const Color(0xff850101)
                            : Colors.grey[800],
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: widget.isSentByMe
                              ? const Radius.circular(12)
                              : Radius.zero,
                          bottomRight: widget.isSentByMe
                              ? Radius.zero
                              : const Radius.circular(12),
                        ),
                      ),
                      child: widget.isReplayedName != null
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.isReplayedName!,
                                  style: TextStyle(
                                    fontSize: widget.width * .035,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.isReplayedText!,
                                  style: TextStyle(
                                    fontSize: widget.width * .035,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            widget.message,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: widget.width * .035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (widget.media != null &&
                              widget.media!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  widget.media!.first.url!,
                                  fit: BoxFit.cover,
                                  width: widget.width * 0.5,
                                ),
                              ),
                            ),
                        ],
                      )
                          : Column(
                        children: [
                          Text(
                            widget.message,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: widget.width * .035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (widget.media != null &&
                              widget.media!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  widget.media!.first.url!,
                                  fit: BoxFit.cover,
                                  width: widget.width * 0.5,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (widget.reactions != null && widget.reactions!.isNotEmpty)
                    Positioned(
                      bottom: -2,
                      right: widget.isSentByMe ? 5 : null,
                      left: widget.isSentByMe ? null : 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.isSentByMe
                              ? const Color(0xff850101)
                              : Colors.grey[900],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.reactions!
                              .map(
                                (reaction) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 1.5),
                              child: Text(
                                reaction.emoji!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    ),
                ],
              ),
              Text(
                widget.time,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Reaction {
  final String emoji;

  Reaction(this.emoji);
}

class Media {
  final String url;

  Media(this.url);
}
