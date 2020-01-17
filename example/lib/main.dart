import 'package:flutter/material.dart';
import 'package:google_map_polyutil/google_map_polyutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<LatLng> polyline = [
    LatLng(0, 0),
    LatLng(0, 1),
    LatLng(0, 3),
    LatLng(0, 4)
  ];
  LatLng point = LatLng(0, 2);

  @override
  void initState() {
    super.initState();
    initAll();
  }

  void initAll() async {
    print("==== InitState ==== ");
    print('Contains location: ${await GoogleMapPolyUtil.containsLocation(polygon: polyline, point: point)}');
    print('Decode : ${await GoogleMapPolyUtil.decode(encodedPath: "???_ibE?_seK?_ibE")}');
    print('Distance to line : ${await GoogleMapPolyUtil.distanceToLine(point: LatLng(0, 5), start: LatLng(0, 3), end: LatLng(0, 9))}');
    print('Encode : ${await GoogleMapPolyUtil.encode(path: polyline)}');
    print('Is closed polygon : ${await GoogleMapPolyUtil.isClosedPolygon(poly: polyline)}');
    print('Is location on edge : ${await GoogleMapPolyUtil.isLocationOnEdge(point: point, polygon: polyline)}');
    print('Is location on path : ${await GoogleMapPolyUtil.isLocationOnPath(point: point, polygon: polyline)}');
    print('Simplify : ${await GoogleMapPolyUtil.simplify(poly: polyline, tolerance: 100)}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google map polyutil"),
      ),
      body: Container(
        child: Center(
          child: Text("Check debug output / console..."),
        ),
      ),
    );
  }
}
