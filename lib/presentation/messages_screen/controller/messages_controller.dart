import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/data/data_sources/remote/apI_endpoint_urls.dart';
import 'package:colleage_thriver/data/data_sources/remote/api_client.dart';
import 'package:colleage_thriver/presentation/messages_screen/models/all_message_model.dart';
import 'package:colleage_thriver/presentation/messages_screen/models/chat_room_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

/// A controller class for the MessagesScreen.
///
/// This class manages the state of the MessagesScreen, including the
/// current messagesModelObj
class MessagesController extends GetxController {
  TextEditingController messageTextEditingController = TextEditingController();
  Rxn<ChatRoomModel> chatRoomModel = Rxn();
  Rxn<AllMessageModel> allMessageModel = Rxn();

  // RxList<Message> messages = <Message>[].obs;
  late IO.Socket socket;

  @override
  onInit() async {
    super.onInit();

    try {
      ApiClient()
          .postRequest(
              endPoint: AppUrls.chat_with_mentor + (Get.arguments!["mentorId"]),
              body: null)
          .then((value) async {
        chatRoomModel.value = ChatRoomModel.fromJson(value.data);

        ApiClient().getRequest(endPoint: AppUrls.all_messages + chatRoomModel.value!.chat!.id.toString()).then((value) {
          print("ASDFG");
          allMessageModel.value = AllMessageModel.fromJson(value.data);});
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          socket = IO.io(AppUrls.mainUrl, <String, dynamic>{
            'transports': ['websocket'],
            'autoConnect': false,
            'extraHeaders': {'Authorization': 'Bearer ${prefs.get("token")}'}
          });
          socket.connect();
          socket.onConnect((data) {
            print("line 36");
            print(data);
          });

          socket.on('new-message', (data) {
            print('new-message   : $data');
            allMessageModel.value?.messages?.insert(
                0,
                Message(
                    createdOn: DateTime.now().toUtc().toIso8601String(),
                    chatId: chatRoomModel.value!.chat!.id,
                    id: null,
                    content: data["message"],
                    isMentor: data["isMentor"],
                    senderId: int.parse(data["sender"].toString())));
            print('new-message   : $data');
            allMessageModel.refresh();
          });
        } catch (e, s) {
          Logger().e(e, stackTrace: s);
        }
      });
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
    }
  }

  Future<void> onTapSendMessage() async {
    if (messageTextEditingController.text.trim().isEmpty) {
      return;
    }
    var apiData = await ApiClient().postRequest(
      endPoint: AppUrls.send_message,
      body: {
        "chat_id": chatRoomModel.value!.chat!.id,
        "sender_id": chatRoomModel.value!.chat!.userId,
        "isMentor": 0,
        "content": messageTextEditingController.text.trim()
      },
    );
    allMessageModel.value?.messages?.insert(
        0,
        Message(
            createdOn: DateTime.now().toUtc().toIso8601String(),
            chatId: chatRoomModel.value!.chat!.id,
            id: null,
            content: messageTextEditingController.text.trim(),
            isMentor: 0,
            senderId: chatRoomModel.value!.chat!.userId));
    allMessageModel.refresh();
    messageTextEditingController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    socket.dispose();
  }
}


































