import 'package:colleage_thriver/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../data/data_sources/remote/apI_endpoint_urls.dart';
import '../main.dart';
import '../presentation/messages_screen/controller/messages_controller.dart';
import '../presentation/messages_screen/models/all_message_model.dart';

late IO.Socket sockettt;

class LifeCycleManager extends StatefulWidget {
  LifeCycleManager({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  // ChatRoomController controller = Get.put(ChatRoomController(),permanent: true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    socketConnect();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('AppLifecycleState: $state');
    if (state == AppLifecycleState.inactive) {
      socketDisConnect();
    } else if (state == AppLifecycleState.hidden) {
      socketDisConnect();
    } else if (state == AppLifecycleState.paused) {
      socketDisConnect();
    } else if (state == AppLifecycleState.resumed) {
      socketConnect();
    } else {
      socketDisConnect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

Future<void> socketConnect() async {
  var _auth = await FirebaseAuth.instance.currentUser?.getIdToken();
  var userId = "93"; // Replace with actual userId
  print("Attempting to connect socket...");

  Map<String, dynamic> headers = {
    'Authorization': 'Bearer ${_auth}',
  };

  sockettt = IO.io(
    "${AppUrls.mainUrl}?userId=$_auth", // Passing userId as a query parameter
    <String, dynamic>{
      "transports": ["websocket"],
      "extraHeaders": headers,
      "autoConnect": false,
    },
  );

  sockettt.connect();

  // Listeners
  sockettt.onConnect((data) {
    print("Socket connected successfully!");
  });

  sockettt.onConnectError((data) {
    print("Connection Error: $data");
  });

  sockettt.onDisconnect((data) {
    print("Socket disconnected.");
  });

  sockettt.on("new-message", (msg) {
    print("messageReceived==>${msg.toString()}");
    print("111chatId==>${msg["chatId"]}");
    print("activeChatId==>${activeChatId.value}");

    try {
      if("${msg["chatId"]}" == "${activeChatId.value}") {
        Get.find<MessagesController>().allMessageModel.value?.messages?.insert(
            0,
            Message(
                createdOn: DateTime.now().toUtc().toIso8601String(),
                chatId:
                Get.find<MessagesController>().chatRoomModel.value!.chat!.id,
                id: null,
                content: msg["message"],
                isMentor: msg["isMentor"],
                senderId: int.parse(msg["sender"].toString())));

        Get.find<MessagesController>().allMessageModel.refresh();

      }


    } catch (e) {
      print("object${e.toString()}");
    }
  });
}

Future<void> socketDisConnect() async {
  print("socketDisConnect_line117");
  sockettt.disconnect(); // Disconnect the
}



