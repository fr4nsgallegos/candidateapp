import 'package:candidateapp/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ControllersApp {
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void funcion() {}
}
