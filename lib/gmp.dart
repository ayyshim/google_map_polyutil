import 'package:google_map_polyutil/transform.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMP {
  static const MethodChannel _channel =
      const MethodChannel('google_map_polyutil');

  static Future<bool> containsLocation(
      LatLng point, List<LatLng> polygon, bool geodesic) async {
    final mapPoint = Transform.latLngToHashMap(point);
    final listPolygon = Transform.listOfLatLngToHashMap(polygon);

    final args = {
      "point": mapPoint,
      "polygon": listPolygon,
      "geodesic": geodesic
    };

    return await _channel.invokeMethod("containsLocation", args);
  }

  static Future<List<LatLng>> decode(String encodedPath) async {
    final args = {"encodedPath": encodedPath};
    final t = await _channel.invokeMethod("decode", args) as List;

    final mapT = t.map((to) => {"lat": to["lat"], "lng": to["lng"]}).toList();

    return Transform.listOfHashMapToLatLng(mapT);
  }

  static Future<double> distanceToLine(
      LatLng point, LatLng start, LatLng end) async {
    final mapPoint = Transform.latLngToHashMap(point);
    final mapStart = Transform.latLngToHashMap(start);
    final mapEnd = Transform.latLngToHashMap(end);

    final args = {"p": mapPoint, "start": mapStart, "end": mapEnd};

    return await _channel.invokeMethod("distanceToLine", args);
  }

  static Future<String> encode(List<LatLng> path) async {
    final mapPath = Transform.listOfLatLngToHashMap(path);

    final args = {"path": mapPath};

    return await _channel.invokeMethod("encode", args);
  }

  static Future<bool> isClosedPolygon(List<LatLng> poly) async {
    final mapPoly = Transform.listOfLatLngToHashMap(poly);

    final args = {"poly": mapPoly};

    return await _channel.invokeMethod("isClosedPolygon", args);
  }

  static Future<bool> isLocationOnEdge(LatLng point, List<LatLng> polygon,
      bool geodesic, double tolerance) async {
    final mapPoint = Transform.latLngToHashMap(point);
    final mapPolygon = Transform.listOfLatLngToHashMap(polygon);

    final args = {
      "point": mapPoint,
      "polygon": mapPolygon,
      "geodesic": geodesic,
      "tolerance": tolerance
    };

    return await _channel.invokeMethod("isLocationOnEdge", args);
  }

  static Future<bool> isLocationOnPath(LatLng point, List<LatLng> polyline,
      bool geodesic, double tolerance) async {
    final mapPoint = Transform.latLngToHashMap(point);
    final mapPolyline = Transform.listOfLatLngToHashMap(polyline);

    final args = {
      "point": mapPoint,
      "polyline": mapPolyline,
      "geodesic": geodesic,
      "tolerance": tolerance
    };

    return await _channel.invokeMethod("isLocationOnPath", args);
  }

  static Future<List<LatLng>> simplify(
      List<LatLng> poly, double tolerance) async {
    final mapPoly = Transform.listOfLatLngToHashMap(poly);

    final args = {"poly": mapPoly, "tolerance": tolerance};
    final t = await _channel.invokeMethod("simplify", args) as List;
    final mapT = t.map((to) => {"lat": to["lat"], "lng": to["lng"]}).toList();

    return Transform.listOfHashMapToLatLng(mapT);
  }
}
