import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/data/data_sources/remote/apI_endpoint_urls.dart';
import 'package:colleage_thriver/data/data_sources/remote/api_client.dart';
import 'package:colleage_thriver/presentation/messages_screen/models/all_message_model.dart';
import 'package:colleage_thriver/presentation/messages_screen/models/chat_room_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../main.dart';
import '../../../sockettt/sockettt.dart';


class MessagesController extends GetxController {
  TextEditingController messageTextEditingController = TextEditingController();
  final  Rxn<ChatRoomModel> chatRoomModel = Rxn();
  final  Rxn<AllMessageModel> allMessageModel = Rxn();

  // RxList<Message> messages = <Message>[].obs;

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
        activeChatId.value =chatRoomModel.value?.chat?.id ?? 0;
        print("activeChatId.value==>${activeChatId.value}");

        ApiClient()
            .getRequest(
                endPoint: AppUrls.all_messages +
                    chatRoomModel.value!.chat!.id.toString())
            .then((value) {

          allMessageModel.value = AllMessageModel.fromJson(value.data);
        });
        try {} catch (e, s) {
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
    var apiData = ApiClient().postRequest(
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
    sockettt.dispose();
  }
}
