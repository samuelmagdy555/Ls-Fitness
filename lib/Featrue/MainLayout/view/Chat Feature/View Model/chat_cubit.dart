import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/Add Reaction Model/Add Reaction Model.dart';
import '../Model/My Chats Model/My Chats Model.dart';
import '../Model/Send Message Model/Send Message Model.dart';
import '../Model/Spicific Chat Messages/Spicific Chat Messages.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io';
import 'package:file_picker/file_picker.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  // Added user with ID: 674715885fb31f7806d196c9
  // Added room : 677344893acc03f69929812b
  // Added user with ID: 670149bd8862beddfe6ca45c
  // Added room : 677344893acc03f69929812b
  static ChatCubit get(context) => BlocProvider.of(context);

  MyChatsModel? myChatsModel;
  SpecificChatMessages? specificChatMessages;
  SendMessageModel? sendMessageModel;
  AddReactionModel? addReactionModel;
  List<Chats> myChats = [];

  Future<void> getHomeChats() async {
    emit(GetHomeChatLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.chats,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);
      myChatsModel = MyChatsModel.fromJson(response.data);
      emit(GetHomeChatSuccess());
    } catch (e) {
      emit(GetHomeChatError());
    }
  }

  Future<void> getSpecificChatMessages({
    required String ID,
    required String pageNum,
  }) async {
    emit(GetSpecificChatMessagesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.messages}/$ID',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          query: {'page': pageNum});
      specificChatMessages = SpecificChatMessages.fromJson(response.data);
      print(specificChatMessages);
      for (var element in specificChatMessages!.chats!) {
        myChats.insert(0, element);
      }
      emit(GetSpecificChatMessagesSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetSpecificChatMessagesError());
    }
  }

  Future<void> sendTextMessages(
      {required String ChatID,
      required String message,
      required String receiverId,
      required TextEditingController controller,
      required bool isGroub,
      List<Participants>? participants}) async {
    try {
      print(isGroub);
      Chats chat = Chats(
          id: '',
          chat: '',
          sender: Sender(id: LoginCubit.id, username: LoginCubit.name),
          text: message,
          media: [],
          reactions: [],
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString());
      myChats.add(chat);

      DioHelper.post(
          end_ponit: '${EndPoints.messages}/$ChatID',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          data: {'text': message});

      if (!isGroub) {
        sendPrivateMessage(senderId: LoginCubit.id, receiverId: receiverId, text:message );
      } else {
        int num = 0;
        joinRoom(LoginCubit.id, ChatID);

        for (var element in participants!) {
          joinRoom(element.userDetails.id, ChatID);
          print('id isssssssssssssssssssssssssssssssssssssss');
          print(element.userDetails!.id);
        }
        sendGroupMessage(LoginCubit.id, ChatID, message, '');
      }

      getHomeChats();
      controller.clear();
      emit(SendMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(SendMessageError());
    }
  }

  Future<void> sendFileMessages({
    required String chatID,
    String? message,
    required String receiverId,
    required TextEditingController controller,
    required bool isGroup,
    required List<File> files, // List of files (images, PDFs, Word documents)
    List<Participants>? participants,
  }) async {
    try {
      // Create media data
      List<Map<String, dynamic>> mediaData = [];

      for (var file in files) {
        String fileName = file.path.split('/').last;

        // Simulating file upload (e.g., API call to upload the file)
        // Replace this with your actual file upload logic
        String fileUrl =
            await uploadFile(file); // Implement this function for uploading

        mediaData.add({
          'fileName': fileName,
          'url': fileUrl,
        });
      }

      // Send message with text and media
      await DioHelper.post(
        end_ponit: '${EndPoints.messages}/$chatID',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
        data: {
          'text': message ?? '',
          'media': mediaData,
        },
      );

      getHomeChats();
      controller.clear();
      emit(SendMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(SendMessageError());
    }
  }

  Future<void> ReplayTextMessages(
      {required String ChatID,
        required String message,
        required String receiverId,
        required TextEditingController controller,
        required bool isGroub,
        required String ReplyMessage,
        List<Participants>? participants}) async {
    try {
      print(isGroub);
      Chats chat = Chats(
          id: '',
          chat: '',
          sender: Sender(id: LoginCubit.id, username: LoginCubit.name),
          text: message,
          media: [],
          repliedTo: RepliedTo(
            sId: LoginCubit.id ,
            text: ReplyMessage,
            sender: Sender(id: LoginCubit.id, username: LoginCubit.name),
          ),
          reactions: [],
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString());
      myChats.add(chat);

      DioHelper.post(
          end_ponit: '${EndPoints.messages}/$ChatID',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          data: {'text': message});

      if (!isGroub) {
        sendPrivateMessage(senderId: LoginCubit.id, receiverId: receiverId, text:message );
      } else {
        int num = 0;
        joinRoom(LoginCubit.id, ChatID);

        for (var element in participants!) {
          joinRoom(element.userDetails.id, ChatID);
          print('id isssssssssssssssssssssssssssssssssssssss');
          print(element.userDetails!.id);
        }
        sendGroupMessage(LoginCubit.id, ChatID, message, '');
      }

      getHomeChats();
      controller.clear();
      emit(SendMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(SendMessageError());
    }
  }

  Future<String> uploadFile(File file) async {
    // Replace this logic with actual file upload (e.g., Firebase, AWS S3, etc.)
    // Simulate upload and return file URL
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    return 'https://example.com/uploads/${file.path.split('/').last}';
  }

// Function to pick files
  Future<List<File>> pickFiles() async {
    List<File> pickedFiles = [];

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'pdf',
          'doc',
          'docx',
          'png'
        ], // Add allowed extensions
      );

      if (result != null) {
        pickedFiles = result.paths.map((path) => File(path!)).toList();
      }
    } catch (e) {
      print("Error picking files: $e");
    }

    return pickedFiles;
  }

  Future<void> handleSendMessage() async {
    List<File> selectedFiles = await pickFiles(); // استدعاء دالة اختيار الملفات
    if (selectedFiles.isNotEmpty) {
      await sendFileMessages(
        chatID: "677344893acc03f69929812b",
        message: "Here are the files",
        receiverId: "674715885fb31f7806d196c9",
        controller: TextEditingController(),
        isGroup: false,
        files: selectedFiles,
      );
    } else {
      print("No files selected.");
    }
  }

  void updateReactionIfExists({
    required List<Chats> myChats,
    required int index,
    required Reactions newReaction,
    required String userIdToCheck,
  }) {
    // تحقق من وجود الرياكشنات
    if (myChats[index].reactions == null) {
      myChats[index].reactions = [];
    }

    // ابحث عن الرياكشن الخاص بالمستخدم المطلوب
    int existingReactionIndex = myChats[index].reactions!.indexWhere(
        (reaction) =>
            reaction.user != null && reaction.user!.sId == userIdToCheck);

    if (existingReactionIndex != -1) {
      // إذا وُجد، قم بتحديث الرياكشن
      myChats[index].reactions![existingReactionIndex] = newReaction;
    } else {
      // إذا لم يُوجد، أضف الرياكشن الجديد
      myChats[index].reactions!.add(newReaction);
    }
  }

  Future<void> addReactionToMessage(
      {required String senderId,
      required String receiverId,
      required String messageId,
      required String emoji,
      required int index}) async {
    emit(AddReactionToMessageLoading());
    try {
      print(index);
      print(messageId);
      sendEmoji(senderId, receiverId, messageId, emoji);
      Reactions newReaction = Reactions(
        user: User(sId: LoginCubit.id, username: LoginCubit.name),
        emoji: emoji,
        id: '',
      );
      updateReactionIfExists(
        myChats: myChats,
        index: index,
        newReaction: newReaction,
        userIdToCheck: LoginCubit.id,
      );

      print(specificChatMessages!.chats![index].text);
      emit(ChangeReactionId());

      final response = await DioHelper.post(
          end_ponit: '${EndPoints.messages}/$messageId/${EndPoints.reactions}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          data: {'emoji': emoji});
      addReactionModel = AddReactionModel.fromJson(response.data);
      myChats[index].reactions!.last.id = addReactionModel!.data!.id;

      emit(AddReactionToMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(AddReactionToMessageError());
    }
  }

  void handleIncomingMessage(String rawMessage) {
    String cleanedMessage = rawMessage
        .replaceAll("{", '{"')
        .replaceAll("}", '"}')
        .replaceAll(": ", '": "')
        .replaceAll(", ", '", "');

    Map<String, dynamic> message = json.decode(cleanedMessage);

    String senderId = message['senderId'];
    String text = message['text'];
    bool isPrivate = message['private'] == "true";

    print('Sender ID: $senderId');
    print('Text: $text');
    print('Private: $isPrivate');
  }

  late IO.Socket _socket;

  // Initialize the connection
  void connect(String userId) {
    print('begain connect');
    _socket = IO.io('https://ls-fitness.koyeb.app', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    _socket.connect();

    // Handle connection events
    _socket.onConnect((_) {
      _socket.emit('addUser', {"userId": userId});
      print('Connected to Socket.IO server');
    });

    _socket.onDisconnect((_) {
      print('Disconnected from Socket.IO server');
    });

    // Handle incoming messages
    _socket.on('receiveMessage', (data) {
      print('New message received: $data');

      Chats chat = Chats(
          id: '',
          chat: '',
          sender: Sender(id: data['senderId'], username: ''),
          text: data['text'],
          media: [],
          reactions: [],
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString());
      myChats.add(chat);
      getHomeChats();

      emit(GetSpecificChatMessagesSuccess());
    });

    _socket.on('receiveRepliedMessage', (data) {
      print('New receiveRepliedMessage received: $data');

      Chats chat = Chats(
          id: data['repliedToMessageId'],
          chat: '',
          sender: Sender(id: data['senderId'], username: data['ownMessageName']),
          text: data['text'],
          media: [
            Media(
                type: data['repliedToMessageId']
            )
          ],
          repliedTo: RepliedTo(
            text: data['repliedToMessageData'],
            sender: Sender(id: data['senderId'], username: data['ownMessageName']),
            media: [
              Media(
                type: data['repliedToMessageId']
              )
            ],


          ),
          reactions: [],
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString());
      myChats.add(chat);
      getHomeChats();

      emit(GetSpecificChatMessagesSuccess());
    });



    _socket.on('receiveReactionToMessage', (data) {
      print('New Reaction received: $data');

      Reactions newReaction = Reactions(
        user: User(sId: data["senderId"], username: ''),
        emoji: data["emoji"],
        id: '',
      );
      for (var element in myChats) {
        if (element.id == data["messageId"]) {
          updateReactionIfExists(
            myChats: myChats,
            index: myChats.indexOf(element),
            newReaction: newReaction,
            userIdToCheck: data["senderId"],
          );
        }
      }

      getHomeChats();

      emit(GetSpecificChatMessagesSuccess());
    });

    _socket.on('errorMessage', (error) {
      print('Error: $error');
    });

    // Connect to the server
  }

  // Join a room
  void joinRoom(String userId, String roomId) {
    print('joinRoom doneeeeeeeeeeee');
    _socket.emit('joinRoom', {'userId': userId, 'roomId': roomId});
  }

  // Leave a room
  void leaveRoom(String userId, String roomId) {
    _socket.emit('leaveRoom', {'userId': userId, 'roomId': roomId});
  }

  // Send a private message
  void sendPrivateMessage({
    required String senderId,
    required String receiverId,
    required String text,
    String? ownMessageName,
    String? repliedToMessageData,
    String? repliedToMessageId,
    List<String> ? media,


  }) {
    _socket.emit('sendMessage', {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'ownMessageName': ownMessageName,
      'repliedToMessageData': repliedToMessageData,
      'repliedToMessageId': repliedToMessageId,
      'media': media
    });
    print('sendPrivateMessage doneeeeeeeeeeee to id ${receiverId}');
  }

  void sendReplayPrivateMessage({
    required String senderId,
    required String receiverId,
    required String text,
    String? ownMessageName,
    String? repliedToMessageData,
    String? repliedToMessageId,
    List<String> ? media,


  }) {
    _socket.emit('receiveRepliedMessage', {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'ownMessageName': ownMessageName,
      'repliedToMessageData': repliedToMessageData,
      'repliedToMessageId': repliedToMessageId,
      'media': media,
      'private': true
    });
    print('sendReplayPrivateMessage doneeeeeeeeeeee to id ${receiverId}');
  }



  void sendEmoji(
      String senderId, String receiverId, String messageId, String emoji) {
    _socket.emit('toggleReaction', {
      'senderId': senderId,
      'receiverId': receiverId,
      'messageId': messageId,
      'emoji': emoji
    });

    print('sendEmoji doneeeeeeeeeeee');
  }

  // Send a group message
  void sendGroupMessage(
      String senderId, String roomId, String payload, String action) {
    _socket.emit('sendMessage', {
      'senderId': senderId,
      'roomId': roomId,
      'payload': payload,
      'action': action,
    });
    print('sendGroupMessage doneeeeeeeeeeee');
  }

  // Disconnect from the server
  void disconnect() {
    _socket.disconnect();
  }
}
