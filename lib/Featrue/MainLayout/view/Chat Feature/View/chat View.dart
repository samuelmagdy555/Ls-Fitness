// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Chat%20Feature/View%20Model/chat_cubit.dart';

import 'Chat Room/Chat Room.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    ChatCubit.get(context).getHomeChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        title: const Text(
          'Chats',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.red,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ChatCubit.get(context).myChatsModel != null
              ? ListView.builder(

                  padding: EdgeInsets.all(8),
                  itemCount: ChatCubit.get(context).myChatsModel!.data.length,
                  itemBuilder: (context, index) => ChatTile(
                    name: ChatCubit.get(context)
                        .myChatsModel!
                        .data![index]
                        .participants![0]
                        .userDetails!
                        .username,
                    message: ChatCubit.get(context)
                        .myChatsModel!
                        .data![index]
                        .lastMessage[0]
                        .text,
                    time: 'time',
                    unreadCount: ChatCubit.get(context)
                            .myChatsModel!
                            .data![index]
                            .lastMessage
                            .isEmpty
                        ? ''
                        : ChatCubit.get(context)
                            .myChatsModel!
                            .data![index]
                            .lastMessage
                            .length
                            .toString(),
                    image: ChatCubit.get(context)
                        .myChatsModel!
                        .data![index]
                        .image ?? '', id: ChatCubit.get(context)
                      .myChatsModel!
                      .data![index]
                      .id,
                  ),
                )
              : Center(child: MyLoadingIndicator(height: height, color: Colors.red));
        },
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String image;
  final String message;
  final String time;
  final String unreadCount;
  final String id;

  const ChatTile({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    super.key,
    required this.image, required this.id,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print('asdasds');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatRoom(name: name, image: image, id: id,),
                ));
          },
          child: SizedBox(
            height: height * .1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage:
                      NetworkImage(image), // Replace with your asset path
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: width*.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),

                      Text(
                        message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white30,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    if (unreadCount.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          unreadCount,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: .5,
          color: Colors.grey,
          endIndent: width * .025,
          indent: width * .025,
        )
      ],
    );
  }
}
