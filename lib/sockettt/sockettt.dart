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


// I/flutter (29549): ║                 id: 20,
// I/flutter (29549): ║                 name: "Maya ",
// I/flutter (29549): ║                 lname: "Bradford",
// I/flutter (29549): ║                 "https://www.collegethriverapp.org:4000/profile/1724831626384.jfif"
// I/flutter (29549): ║                 email: "maya@mailinator.com",
// I/flutter (29549): ║                 "$2b$10$mXJJaMHxrz5DUqSX/jQX4es/W.szsC5xuBXI1c27oQ.v4wzNc7wP2"
// I/flutter (29549): ║                 gender: "male",
// I/flutter (29549): ║                 dob: "01/06/2021",
// I/flutter (29549): ║                 ethnicity: "Ad fugiat est beata",
// I/flutter (29549): ║                 branch: "Enim voluptatem con",
// I/flutter (29549): ║                 clg_name: "Gabriel Mooney",
// I/flutter (29549): ║                 hgh_scl_name: null,
// I/flutter (29549): ║                 school_year: null,
// I/flutter (29549): ║                 gpa: null,
// I/flutter (29549): ║                 group_affiliation: null,
// I/flutter (29549): ║                 graduation_month: null,
// I/flutter (29549): ║                 graduation_year: null,
// I/flutter (29549): ║                 actToken: null,
// I/flutter (29549): ║                 is_active: 1,
// I/flutter (29549): ║                 PhoneNumber: "1300013000",
// I/flutter (29549): ║                 address: "Velit exercitationem",
// I/flutter (29549): ║                 zip_code: 38897,
// I/flutter (29549): ║                 career: "Esse nostrum sed ea",
// I/flutter (29549): ║                 expertise: "quis enim ab quisqua",
// I/flutter (29549): ║                 beforeMentored: "yes",
// I/flutter (29549): ║                 mentorExperince: "Itaque excepteur qui",
// I/flutter (29549): ║                 MentorName: "Lamar Wolfe",
// I/flutter (29549): ║                 contactWithMentor: "Temporibus sapiente ",
// I/flutter (29549): ║                 additionalInfo: "Et placeat velit se",
// I/flutter (29549): ║                 additionalResorce: "Perferendis dolores ",
// I/flutter (29549): ║                 date_from: "1981-01-08",
// I/flutter (29549): ║                 date_to: "2027-10-26",
// I/flutter (29549): ║                 time_from: "01:30",
// I/flutter (29549): ║                 time_to: "12:30",
// I/flutter (29549): ║                 created_at: "2024-08-22T11:51:47.000Z",
// I/flutter (29549): ║                 updated_at: "2024-08-22T11:51:47.000Z"
// I/flutter (29549): ║            },
// I/flutter (29549): ║            {
// I/flutter (29549): ║                 id: 21,
// I/flutter (29549): ║                 name: "jaswinder",
// I/flutter (29549): ║                 lname: "singh",
// I/flutter (29549): ║                 "https://www.collegethriverapp.org:4000/profile/1724329596064.sql"
// I/flutter (29549): ║                 email: "jaswinder@yopmail.com",
// I/flutter (29549): ║                 "$2b$10$DJgvkOC7BVAswFmwWkAZGe5WIcUjUX1/SguejOF5xOkI0Tm7uAV6q"
// I/flutter (29549): ║                 gender: null,
// I/flutter (29549): ║                 dob: "08/21/2011",
// I/flutter (29549): ║                 ethnicity: "indore",
// I/flutter (29549): ║                 branch: "it",
// I/flutter (29549): ║                 clg_name: "ips",
// I/flutter (29549): ║                 hgh_scl_name: null,
// I/flutter (29549): ║                 school_year: null,
// I/flutter (29549): ║                 gpa: null,
// I/flutter (29549): ║                 group_affiliation: null,
// I/flutter (29549): ║                 graduation_month: null,
// I/flutter (29549): ║                 graduation_year: null,
// I/flutter (29549): ║                 actToken: null,
// I/flutter (29549): ║                 is_active: 1,
// I/flutter (29549): ║                 PhoneNumber: "9874563214",
// I/flutter (29549): ║                 address: "vishnupuri",
// I/flutter (29549): ║                 zip_code: 452014,
// I/flutter (29549): ║                 career: "btech",
// I/flutter (29549): ║                 expertise: "js",
// I/flutter (29549): ║                 beforeMentored: "yes",
// I/flutter (29549): ║                 mentorExperince: "12",
// I/flutter (29549): ║                 MentorName: "jaswinder",
// I/flutter (29549): ║                 contactWithMentor: "92645278547",
// I/flutter (29549): ║                 additionalInfo: "",
// I/flutter (29549): ║                 additionalResorce: "",
// I/flutter (29549): ║                 date_from: "2024-08-14",
// I/flutter (29549): ║                 date_to: "2024-08-31",
// I/flutter (29549): ║                 time_from: "06:56",
// I/flutter (29549): ║                 time_to: "23:56",
// I/flutter (29549): ║                 created_at: "2024-08-22T12:26:36.000Z",
// I/flutter (29549): ║                 updated_at: "2024-08-22T12:26:36.000Z"
// I/flutter (29549): ║            },
