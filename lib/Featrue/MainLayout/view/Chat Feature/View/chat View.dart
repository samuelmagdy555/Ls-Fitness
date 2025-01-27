// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Chat%20Feature/View%20Model/chat_cubit.dart';

import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/My Chats Model/My Chats Model.dart';
import 'Chat Room/Chat Room.dart';
import 'package:intl/intl.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
    ChatCubit.get(context).getHomeChats();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(currentState['backgroundImage']), // مسار الصورة
              fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
            ),
          ),
        ),
        title: Text('Chats', style: Theme.of(context).textTheme.bodyLarge),

      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ChatCubit.get(context).myChatsModel != null
              ? ChatCubit.get(context).myChatsModel!.data.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(currentState['backgroundImage']),
                            fit: BoxFit.cover),
                      ),
                      child: ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount:
                              ChatCubit.get(context).myChatsModel!.data.length,
                          itemBuilder: (context, index) {
                            String SenderID = '';
                            String NameID = '';
                            for (var element in ChatCubit.get(context)
                                .myChatsModel!
                                .data[index]
                                .participants) {
                              if (element.userDetails.id != LoginCubit.id) {
                                SenderID = element.userDetails.id;
                              }
                              if (element.userDetails.username !=
                                  LoginCubit.name) {
                                NameID = element.userDetails.username;
                              }
                            }
                            String time = '';
                            var lastMessage = ChatCubit.get(context).myChatsModel?.data?[index].lastMessage;

                            if (lastMessage != null && lastMessage.isNotEmpty && lastMessage[0].createdAt != null) {
                              try {
                                DateTime dateTime = DateTime.parse(lastMessage[0].createdAt);
                                time = DateFormat('MM-dd / HH:mm').format(dateTime); // تنسيق التاريخ
                              } catch (e) {
                                time = ''; // لو فيه خطأ في الفورمات، نرجع قيمة فارغة
                              }
                            } else {
                              time = ''; // لو lastMessage فاضية أو null
                            }

                            return ChatTile(
                              name: NameID,
                              message: ChatCubit.get(context)
                                      .myChatsModel!
                                      .data[index]
                                      .lastMessage!
                                      .isEmpty
                                  ? ''
                                  : ChatCubit.get(context)
                                      .myChatsModel!
                                      .data[index]
                                      .lastMessage![0]
                                      .text,
                              time: time,
                              unreadCount: ChatCubit.get(context)
                                      .myChatsModel!
                                      .data[index]
                                      .lastMessage!
                                      .isEmpty
                                  ? ''
                                  : ChatCubit.get(context)
                                      .myChatsModel!
                                      .data[index]
                                      .lastMessage!
                                      .length
                                      .toString(),
                              image: ChatCubit.get(context)
                                      .myChatsModel!
                                      .data[index]
                                      .image ??
                                  '',
                              id: SenderID,
                              roomId: ChatCubit.get(context)
                                  .myChatsModel!
                                  .data[index]
                                  .id,
                              isGroub: ChatCubit.get(context)
                                  .myChatsModel!
                                  .data[index]
                                  .isGroup,
                              participants: ChatCubit.get(context)
                                  .myChatsModel!
                                  .data[index]
                                  .participants,
                            );
                          }),
                    )
                  : Center(
                      child: Text('No Chats'),
                    )
              : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(currentState['backgroundImage']),
                  fit: BoxFit.cover),
            ),
                child: Center(
                    child: MyLoadingIndicator(height: height, color: Colors.red)),
              );
        },
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String? image;
  final String message;
  String? time;
  final String unreadCount;
  final String id;
  final String roomId;
  final bool isGroub;
  final List<Participants> participants;

  ChatTile({
    required this.name,
    required this.message,
    this.time,
    required this.unreadCount,
    super.key,
    this.image,
    required this.id,
    required this.roomId,
    required this.isGroub,
    required this.participants,
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
            if (isGroub) {
              ChatCubit.get(context).joinRoom(LoginCubit.id, roomId);
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatRoom(
                    name: name,
                    id: id,
                    roomId: roomId,
                    isGroup: isGroub,
                    participants: participants,
                  ),
                ));
          },
          child: SizedBox(
            height: height * .1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Theme.of(context).hintColor,
                  backgroundImage:
                      NetworkImage(image ?? ''), // Replace with your asset path
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: width * .45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time ?? '',
                      style:  Theme.of(context).textTheme.bodySmall
                    ),
                    // if (unreadCount.isNotEmpty)
                    //   Container(
                    //     margin: const EdgeInsets.only(top: 4),
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 8, vertical: 2),
                    //     decoration: BoxDecoration(
                    //       color: Colors.red,
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     child: Text(
                    //       unreadCount,
                    //       style: const TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: .5,
          color: Theme.of(context).dividerColor,
          endIndent: width * .025,
          indent: width * .025,
        )
      ],
    );
  }
}
