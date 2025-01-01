import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/My Chats Model/My Chats Model.dart';
import '../Model/Spicific Chat Messages/Spicific Chat Messages.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  MyChatsModel? myChatsModel;
  SpecificChatMessages? specificChatMessages;
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

  Future<void> getSpecificChatMessages({required String ID , required String pageNum,}) async {
    emit(GetSpecificChatMessagesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.messages}/$ID',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
        query: {
          'page' : pageNum
        }
      );
      specificChatMessages = SpecificChatMessages.fromJson(response.data);
      for( var element in specificChatMessages!.chats){
        myChats.insert(0,element);
      }
      emit(GetSpecificChatMessagesSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetSpecificChatMessagesError());
    }
  }



  Future<void> sendMessages({required String ID , required String message}) async {

    try {
      final response = await DioHelper.post(
          end_ponit: '${EndPoints.messages}/$ID',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          data: {
            'text' : message
          }
      );
      emit(SendMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(SendMessageError());
    }
  }



}
