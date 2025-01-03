import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/My Chats Model/My Chats Model.dart';
import '../Model/Send Message Model/Send Message Model.dart';
import '../Model/Spicific Chat Messages/Spicific Chat Messages.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
      for (var element in specificChatMessages!.chats) {
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
      required TextEditingController controller}) async {
    try {
      Chats chat = Chats(
          id: '',
          chat: '',
          sender: Sender(id: LoginCubit.id, username: LoginCubit.name),
          text: message,
          media: [],
          isRead: false,
          seendBy: [],
          reactions: [],
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString());
      myChats.add(chat);

      DioHelper.post(
          end_ponit: '${EndPoints.messages}/$ChatID',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          data: {'text': message});

      sendPrivateMessage(LoginCubit.id, receiverId, message);
      getHomeChats();
      controller.clear();
      emit(SendMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(SendMessageError());
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
      _socket.emit('addUser', {'userId': userId});
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
          isRead: false,
          seendBy: [],
          reactions: [],
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString());
      myChats.add(chat);
      getHomeChats();

      emit(GetSpecificChatMessagesSuccess());
    });

    _socket.on('errorMessage', (error) {
      print('Error: $error');
    });

    // Connect to the server
  }

  void addUser(String userId) {
    _socket.emit('addUser', {'userId': userId});
  }

  // Join a room
  void joinRoom(String userId, String roomId) {
    _socket.emit('joinRoom', {'userId': userId, 'roomId': roomId});
  }

  // Leave a room
  void leaveRoom(String userId, String roomId) {
    _socket.emit('leaveRoom', {'userId': userId, 'roomId': roomId});
  }

  // Send a private message
  void sendPrivateMessage(String senderId, String receiverId, String text) {
    _socket.emit('sendMessage', {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
    });
  }

  // Send a group message
  void sendGroupMessage(String senderId, String roomId,
      Map<String, dynamic> payload, String action) {
    _socket.emit('sendMessage', {
      'senderId': senderId,
      'roomId': roomId,
      'payload': payload,
      'action': action,
    });
  }

  // Disconnect from the server
  void disconnect() {
    _socket.disconnect();
  }
}
