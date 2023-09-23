import 'package:candidateapp/utils/controller_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  Color bgColor;
  MapPage({
    Key? key,
    required this.bgColor,
  });
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
  }

  Set<Marker> myMarkers = {};
  final _controller = ControllersApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: GoogleMap(
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            -16.829145,
            -64.800988,
          ),
          zoom: 15,
        ),
        markers: myMarkers,
        onTap: (LatLng position) {
          Marker marker = Marker(
              markerId: MarkerId(myMarkers.length.toString()),
              position: position);
          myMarkers.add(marker);
          setState(() {});
        },
      ),
    );
  }
}
