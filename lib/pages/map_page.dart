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
  Set<Marker> myMarkers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            -16.370401,
            -71.537135,
          ),
          zoom: 15,
        ),
        markers: myMarkers,
        onTap: (LatLng position) {
          print(position);
          Marker marker =
              Marker(markerId: MarkerId("Marker001"), position: position);
          myMarkers.add(marker);
          setState(() {});
        },
      ),
    );
  }
}
