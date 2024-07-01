import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';

import '../search/models/CollegeDetailListModel.dart';

// ignore: must_be_immutable
class MapScreen extends StatefulWidget {
  final List<LatLng> locations;
  final List<Message> institutions;
  var dataBytes;

  MapScreen(
      {Key? key,
      required this.locations,
      required this.institutions,
      required this.dataBytes})
      : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  // List of locations
  // final List<LatLng> widget.locations = [
  //   LatLng(32.59937, -85.488258),
  //   LatLng(33.46412, -86.791799),
  //   LatLng(33.21187, -87.545978),
  //   LatLng(33.50569, -86.799345),
  //   LatLng(33.51377, -86.850552),
  //   LatLng(30.69475, -88.138199),
  //   LatLng(32.35103, -86.284366),
  //   LatLng(32.23267, -110.95081),
  //   LatLng(33.10625, -86.865099),
  //   LatLng(30.69603, -88.178711),
  //   LatLng(32.62925, -87.315206),
  //   LatLng(32.36736, -86.177544),
  //   LatLng(33.82293, -85.765321),
  //   LatLng(34.72325, -92.339778),
  //   LatLng(34.5452, -112.47718),
  //   LatLng(32.4309, -85.708492),
  //   LatLng(32.36431, -86.295677)
  // ];

  Set<Marker> _markers = {}; // Set of markers

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    for (int i = 0; i < widget.locations.length; i++) {
      _markers.add(
        Marker(
          icon: BitmapDescriptor.fromBytes(
              widget.dataBytes.buffer.asUint8List(),
              size: Size(0, 0)),
          markerId: MarkerId('id-$i'),
          position: widget.locations[i],
          infoWindow: InfoWindow(
            title: '${widget.institutions[i].instnm}',
            snippet: '${widget.institutions[i].city}',
          ),
        ),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(title: "Map"),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: widget.locations.isNotEmpty
              ? widget.locations.first
              : LatLng(0, 0),
          zoom: 11.0,
        ),
        markers: _markers,
      ),
    );
  }
}
