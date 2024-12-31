part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}


final class GetHomeChatLoading extends ChatState {}
final class GetHomeChatSuccess extends ChatState {}
final class GetHomeChatError  extends ChatState {}

final class GetSpecificChatMessagesLoading extends ChatState {}
final class GetSpecificChatMessagesSuccess extends ChatState {}
final class GetSpecificChatMessagesError  extends ChatState {}
