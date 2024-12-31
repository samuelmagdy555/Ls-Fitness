import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Chat%20Feature/View%20Model/chat_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Chat%20Feature/View%20Model/chat_cubit.dart';

import 'package:timeago/timeago.dart' as timeago;

class ChatRoom extends StatefulWidget {
  final String id;
  final String name;
  final String image;

  ChatRoom({required this.name, required this.image, required this.id});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  void initState() {
    super.initState();
    ChatCubit.get(context).getSpecificChatMessages(ID: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
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
              backgroundImage: NetworkImage(widget.image),
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
                  ? Expanded(
                      child: ListView.builder(
                        padding:  EdgeInsets.all(16),
                          itemCount: ChatCubit.get(context)
                              .specificChatMessages!
                              .data
                              .length,
                          itemBuilder: (context, index) {
                            DateTime dateTime = DateTime.parse(
                                ChatCubit.get(context)
                                    .specificChatMessages!
                                    .data[index]
                                    .createdAt!);
                            String timeAgo = timeago.format(dateTime);
                            return ChatBubble(
                                message: ChatCubit.get(context)
                                    .specificChatMessages!
                                    .data[index]
                                    .text,
                                isSentByMe: ChatCubit.get(context)
                                        .specificChatMessages!
                                        .data[index]
                                        .sender
                                        .id ==
                                    LoginCubit.id,
                                time: timeAgo);
                          }))
                  : Expanded(child: MyLoadingIndicator(height: height * .3, color: Colors.red));
            },
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  final String time;

  const ChatBubble({
    required this.message,
    required this.isSentByMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.red : Colors.grey[800],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: isSentByMe ? Radius.circular(12) : Radius.zero,
                bottomRight: isSentByMe ? Radius.zero : Radius.circular(12),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
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

class ChatInputField extends StatelessWidget {
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
