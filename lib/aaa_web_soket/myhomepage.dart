// // import 'package:flutter/material.dart';
// // import 'package:web_socket_channel/web_socket_channel.dart';
// //
// // class MyHomePage extends StatefulWidget {
// //   final WebSocketChannel channel;
// //   MyHomePage({required this.channel});
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   TextEditingController editingController = new TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     return  Scaffold(
// //       appBar: AppBar(title:Text("web soket"),),
// //       body: new Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: new Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
// //             new Form(
// //               child: new TextFormField(
// //                 decoration: new InputDecoration(labelText: "Send any message"),
// //                 controller: editingController,
// //               ),
// //             ),
// //             new StreamBuilder(
// //               stream: widget.channel.stream,
// //               builder: (context, snapshot) {
// //                 return new Padding(
// //                   padding: const EdgeInsets.all(20.0),
// //                   child: new Text(snapshot.hasData ? '${snapshot.data}' : ''),
// //                 );
// //               },
// //             )
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: new FloatingActionButton(
// //         child: new Icon(Icons.send),
// //         onPressed: _sendMyMessage,
// //       ),
// //
// //     );
// //   }
// //   void _sendMyMessage() {
// //     if (editingController.text.isNotEmpty) {
// //       widget.channel.sink.add(editingController.text);
// //     }
// //   }
// //   @override
// //   void dispose() {
// //     widget.channel.sink.close();
// //     super.dispose();
// //   }
// // }
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/io.dart';
//
//
// class WebsocketDemo extends StatefulWidget {
//   const WebsocketDemo({Key? key}) : super(key: key);
//
//   @override
//   State<WebsocketDemo> createState() => _WebsocketDemoState();
// }
//
// class _WebsocketDemoState extends State<WebsocketDemo> {
//   String btcUsdtPrice = "0";
//   final channel = IOWebSocketChannel.connect('wss://stream.binance.com:9443/ws/btcusdt@trade');
//
//
//   @override
//   void initState() {
//     super.initState();
//     streamListener();
//   }
//
//   streamListener() {
//     channel.stream.listen((message) {
//       // channel.sink.add('received!');
//       // channel.sink.close(status.goingAway);
//       Map getData = jsonDecode(message);
//       setState(() {
//         btcUsdtPrice = getData['p'];
//       });
//        print(getData['p']);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "BTC/USDT Price",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   fontSize: 30),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 btcUsdtPrice,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 250, 194, 25),
//                     fontSize: 30),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
