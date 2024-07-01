// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
// //
// // import '../search/models/CollegeDetailListModel.dart';
// //
// // class MapScreen extends StatefulWidget {
// //   final List<LatLng> locations;
// //   final List<Message> institutions;
// //
// //   const MapScreen({Key? key, required this.locations,required this.institutions}) : super(key: key);
// //   @override
// //   _MapScreenState createState() => _MapScreenState();
// // }
// //
// // class _MapScreenState extends State<MapScreen> {
// //   late GoogleMapController mapController;
// //
// //   Set<Marker> _markers = {}; // Set of markers
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _addMarkers();
// //   }
// //
// //   void _addMarkers() {
// //     for (int i = 0; i < widget.locations.length; i++) {
// //       _markers.add(
// //         Marker(
// //           markerId: MarkerId('id-$i'),
// //           position: widget.locations[i],
// //           infoWindow: InfoWindow(
// //             title: '${widget.institutions[i].instnm}',
// //             snippet: '${widget.institutions[i].city}',
// //
// //           ),
// //         ),
// //       );
// //     }
// //   }
// //
// //   void _onMapCreated(GoogleMapController controller) {
// //     mapController = controller;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: myAppbar(title: "Map"),
// //       body: GoogleMap(
// //         onMapCreated: _onMapCreated,
// //         initialCameraPosition: CameraPosition(
// //           target: widget.locations.isNotEmpty ? widget.locations.first : LatLng(0, 0),
// //           zoom: 11.0,
// //         ),
// //         markers: _markers,
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
// import 'dart:ui' as ui;
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// class my{
//
//
//
//
//   static Future<BitmapDescriptor> getMarkerImageFromUrl(
//       String url, {
//         required int targetWidth,
//       }) async {
//     assert(url != null);
//     final File markerImageFile = await
//     DefaultCacheManager().getSingleFile(url);
//     if (targetWidth != null) {
//       return ImageUtils.convertImageFileToBitmapDescriptor(markerImageFile,
//           size: targetWidth);
//     } else {
//       Uint8List markerImageBytes = await markerImageFile.readAsBytes();
//       return BitmapDescriptor.fromBytes(markerImageBytes);
//     }
//   }
//
//
//
//
//   static Future<BitmapDescriptor> convertImageFileToBitmapDescriptor(
//       File imageFile,
//       {int size = 100,
//         bool addBorder = false,
//         Color borderColor = Colors.white,
//         double borderSize = 10,
//         Color titleColor = Colors.transparent,
//         Color titleBackgroundColor = Colors.transparent}) async {
//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//     final Paint paint = Paint()..color;
//     final TextPainter textPainter = TextPainter(
//       textDirection: TextDirection.ltr,
//     );
//     final double radius = size / 2;
//
//     //make canvas clip path to prevent image drawing over the circle
//     final Path clipPath = Path();
//     clipPath.addRRect(RRect.fromRectAndRadius(
//         Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
//         Radius.circular(100)));
//     clipPath.addRRect(RRect.fromRectAndRadius(
//         Rect.fromLTWH(size / 2.toDouble(), size + 20.toDouble(), 10, 10),
//         Radius.circular(100)));
//     canvas.clipPath(clipPath);
//
//     //paintImage
//     final Uint8List imageUint8List = await imageFile.readAsBytes();
//     final ui.Codec codec = await ui.instantiateImageCodec(imageUint8List);
//     final ui.FrameInfo imageFI = await codec.getNextFrame();
//     paintImage(
//         canvas: canvas,
//         rect: Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
//         image: imageFI.image);
//
//     //convert canvas as PNG bytes
//     final _image = await pictureRecorder
//         .endRecording()
//         .toImage(size, (size * 1.1).toInt());
//     final data = await _image.toByteData(format: ui.ImageByteFormat.png);
//
//     //convert PNG bytes as BitmapDescriptor
//     return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
//   }
//
// }