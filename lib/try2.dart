// // main.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
//
// // MODEL CLASS
// class Message {
//   final String id;
//   final String text;
//   final String sender;
//   final DateTime createdAt;
//
//   Message({
//     required this.id,
//     required this.text,
//     required this.sender,
//     required this.createdAt,
//   });
//
//   factory Message.fromJson(Map<String, dynamic> json) {
//     return Message(
//       id: json['_id'],
//       text: json['text'],
//       sender: json['sender']['username'],
//       createdAt: DateTime.parse(json['createdAt']),
//     );
//   }
// }
//
// class PaginationResult {
//   final int currentPage;
//   final int totalPages;
//   final int nextPage;
//
//   PaginationResult({
//     required this.currentPage,
//     required this.totalPages,
//     required this.nextPage,
//   });
//
//   factory PaginationResult.fromJson(Map<String, dynamic> json) {
//     return PaginationResult(
//       currentPage: json['currentPage'],
//       totalPages: json['numberOfPages'],
//       nextPage: json['nextPage'] ?? -1,
//     );
//   }
// }
//
// // API HELPER
// class DioHelper {
//   static final Dio _dio = Dio();
//
//   static Future<Map<String, dynamic>> getMessages({
//     required String chatId,
//     required String token,
//     required int page,
//   }) async {
//     final response = await _dio.get(
//       'https://ls-fitness.koyeb.app/api/v1/messages/$chatId',
//       queryParameters: {'page': page},
//       options: Options(
//         headers: {'Authorization': 'Bearer $token'},
//       ),
//     );
//     return response.data;
//   }
// }
//
// // CUBIT
// class ChatCubit extends Cubit<List<Message>> {
//   ChatCubit() : super([]);
//
//   int currentPage = 1;
//   int totalPages = 1;
//   bool isLoading = false;
//
//   Future<void> fetchMessages({required String chatId, required String token}) async {
//     if (isLoading || (currentPage > totalPages)) return;
//
//     isLoading = true;
//     try {
//       final response = await DioHelper.getMessages(
//         chatId: chatId,
//         token: token,
//         page: currentPage,
//       );
//       final newMessages = (response['data'] as List)
//           .map((msg) => Message.fromJson(msg))
//           .toList();
//       final pagination = PaginationResult.fromJson(response['paginationResult']);
//       totalPages = pagination.totalPages;
//
//       if (currentPage <= totalPages) {
//         currentPage = pagination.nextPage != -1 ? pagination.nextPage : pagination.currentPage + 1;
//         emit([...state, ...newMessages]);
//       }
//     } catch (e) {
//       debugPrint('Error fetching messages: $e');
//     } finally {
//       isLoading = false;
//     }
//   }
// }
//
// // UI
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BlocProvider(
//         create: (_) => ChatCubit(),
//         child: ChatScreen(),
//       ),
//     );
//   }
// }
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final ScrollController _scrollController = ScrollController();
//   final String chatId = '677344893acc03f69929812b';
//   final String token =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzAxNDliZDg4NjJiZWRkZmU2Y2E0NWMiLCJpYXQiOjE3MzU2NTcwNjIsImV4cCI6MTc0MzQzMzA2Mn0.hKSPYq4wMxB8zdRtjc52CMjJmONXnGcrnQqqIcMy4Io';
//
//   @override
//   void initState() {
//     super.initState();
//
//     final chatCubit = BlocProvider.of<ChatCubit>(context);
//     chatCubit.fetchMessages(chatId: chatId, token: token);
//
//     _scrollController.addListener(() {
//       if (_scrollController.position.atEdge && _scrollController.position.pixels == 0) {
//         chatCubit.fetchMessages(chatId: chatId, token: token);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Messages'),
//       ),
//       body: BlocBuilder<ChatCubit, List<Message>>(
//         builder: (context, messages) {
//           final chatCubit = BlocProvider.of<ChatCubit>(context);
//
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   controller: _scrollController,
//                   reverse: true,
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final message = messages[index];
//                     return ListTile(
//                       title: Text(message.sender),
//                       subtitle: Text(message.text),
//                       trailing: Text(
//                         '${message.createdAt.hour}:${message.createdAt.minute}',
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               if (chatCubit.isLoading)
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CircularProgressIndicator(),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
// }
