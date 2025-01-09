import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Chat%20Feature/View%20Model/chat_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Chat%20Feature/View%20Model/chat_cubit.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../Model/My Chats Model/My Chats Model.dart';

class ChatRoom extends StatefulWidget {
  final String id;
  final String roomId;
  final String name;
  final bool isGroup;
  final List<Participants> participants;

  ChatRoom(
      {required this.name,
      required this.id,
      required this.roomId,
      required this.isGroup,
      required this.participants});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    ChatCubit.get(context).getSpecificChatMessages(
        ID: widget.roomId, pageNum: currentPage.toString());

    _scrollController.addListener(() {
      print(
          '_scrollController.position.minScrollExtent is ${_scrollController.position.minScrollExtent - 010}');
      print(
          '_scrollController.position.pixels is ${_scrollController.position.pixels}');

      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels ==
            _scrollController.position.minScrollExtent) {
          currentPage++;
          ChatCubit.get(context).getSpecificChatMessages(
              ID: widget.roomId, pageNum: currentPage.toString());
        }
      }
    });
  }

  @override
  void deactivate() {
    print('chat room dispose');
    ChatCubit.get(context).specificChatMessages = null;
    ChatCubit.get(context).myChats = [];

    super.deactivate();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // تنظيف الـ ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/half-length-close-up-portrait-young-hindoo-man-white-shirt-blue-space_155003-26772.jpg?t=st=1735759637~exp=1735763237~hmac=2df5ba350ac04b076137753a0b7ed6b487d3a81a585d75bd76f5b974e3c767a0&w=900'),
            ),
            SizedBox(width: 10),
            Text(
              widget.name,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return ChatCubit.get(context).specificChatMessages != null
                  ? ChatCubit.get(context).myChats.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              controller: _scrollController,
                              reverse: false,
                              scrollDirection: Axis.vertical,
                              physics: AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              shrinkWrap: true,
                              padding: EdgeInsets.all(16),
                              itemCount: ChatCubit.get(context).myChats!.length,
                              itemBuilder: (context, index) {
                                DateTime dateTime = DateTime.parse(
                                    ChatCubit.get(context)
                                        .myChats[index]
                                        .createdAt!);
                                String timeAgo = timeago.format(dateTime);
                                return ChatBubble(
                                  message: ChatCubit.get(context)
                                      .myChats[index]
                                      .text!,
                                  isSentByMe: ChatCubit.get(context)
                                          .myChats[index]
                                          .sender!
                                          .id ==
                                      LoginCubit.id,
                                  time: timeAgo,
                                  isReplayed: ChatCubit.get(context)
                                              .myChats[index]
                                              .repliedTo ==
                                          null
                                      ? true
                                      : false,
                                  isReplayedName: ChatCubit.get(context)
                                      .myChats[index]
                                      .repliedTo !=
                                      null
                                      ? ChatCubit.get(context)
                                      .myChats[index]
                                      .repliedTo!.sender!.username : 'null',
                                  isReplayedText: ChatCubit.get(context)
                                      .myChats[index]
                                      .repliedTo !=
                                      null
                                      ? ChatCubit.get(context)
                                      .myChats[index]
                                      .repliedTo!.text : 'null',
                                );
                              }))
                      : Expanded(
                          child: Center(
                              child: Text(
                            'No messages yet ...',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )),
                        )
                  : Expanded(
                      child: MyLoadingIndicator(
                          height: height * .3, color: Colors.red));
            },
          ),
          ChatInputField(
            roomID: widget.roomId,
            receiverId: widget.id,
            isGroup: widget.isGroup,
            participants: widget.isGroup ? widget.participants : null,
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  final String time;
  final bool isReplayed;
  final String? isReplayedName;
  final String? isReplayedText;

  const ChatBubble({
    required this.message,
    required this.isSentByMe,
    required this.time,
    required this.isReplayed,
     this.isReplayedName,
     this.isReplayedText,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: width*.7
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSentByMe ? Color(0xff850101) : Colors.grey[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: isSentByMe ? Radius.circular(12) : Radius.zero,
                  bottomRight: isSentByMe ? Radius.zero : Radius.circular(12),
                ),
              ),
              child: !isReplayed
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(isReplayedName! , style: TextStyle(
                                fontSize: width*.04,
                                fontWeight: FontWeight.w500
                              ),),
                              Text(isReplayedText!, style: TextStyle(
                                  fontSize: width*.04,
                                  fontWeight: FontWeight.w500
                              ),)


                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '515151qqqqqqqqqqqqqqqqqqqqqqq',
                          style: TextStyle(color: Colors.white,fontSize: width*.04,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  : Text(
                      message,
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
          Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class ChatInputField extends StatefulWidget {
  final String roomID;
  final String receiverId;
  final bool isGroup;
  List<Participants>? participants;

  ChatInputField(
      {required this.roomID,
      required this.receiverId,
      required this.isGroup,
      this.participants});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late TextEditingController message;

  @override
  void initState() {
    super.initState();
    message = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: Border(top: BorderSide(color: Colors.grey[800]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: message,
              cursorColor: Colors.red,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Iconsax.send_1, color: Colors.red),
            onPressed: () {
              ChatCubit.get(context).sendTextMessages(
                  ChatID: widget.roomID,
                  message: message.text,
                  receiverId: widget.receiverId,
                  controller: message,
                  isGroub: widget.isGroup,
                  participants: widget.isGroup ? widget.participants : null);
            },
          ),
        ],
      ),
    );
  }
}
