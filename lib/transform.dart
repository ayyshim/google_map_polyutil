import 'package:google_maps_flutter/google_maps_flutter.dart';

class Transform {
  static Map<String, dynamic> latLngToHashMap(LatLng _latlng) {
    return {"lat": _latlng.latitude, "lng": _latlng.longitude};
  }

  static List<Map<String, dynamic>> listOfLatLngToHashMap(List<LatLng> _list) {
    return _list.map((point) => latLngToHashMap(point)).toList();
  }

  static LatLng hashMapToLatLng(Map<String, dynamic> _map) {
    return LatLng(_map["lat"], _map["lng"]);
  }

  static List<LatLng> listOfHashMapToLatLng(List<Map<String, dynamic>> _list) {
    List<LatLng> res = _list.map((_map) => hashMapToLatLng(_map)).toList();
    return res;
  }
}
