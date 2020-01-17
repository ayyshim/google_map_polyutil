# google_map_polyutil

Dart bridge between native google map utility class PolyUtil and your application.

Now you can use all PolyUtil methods that are available in google map utility class PolyUtil.

# Usage

Import `package:google_map_polyutil/google_map_polyutil.dart` and then you are all set to call all it's static methods.

# Methods available

* `containsLocation` [Future<bool>] : Computes whether the given point lies inside the specified polygon.
* `decode` [Future<List<LatLng>>] : Decodes an encoded path string into a sequence of LatLngs.
* `distanceToLine` [Future<double>] : Computes the distance on the sphere between the point p and the line segment start to end.
* `encode` [Future<String>] :  Encodes a sequence of LatLngs into an encoded path string.
* `isClosedPolygon` [Future<bool>] : Returns true if the provided list of points is a closed polygon (i.e., the first and last points are the same), and false if it is not.
* `isLocationOnEdge` [Future<bool>] : Computes whether the given point lies on or near the edge of a polygon, within a specified tolerance in meters.
* `isLocationOnPath` [Future<bool>] : Computes whether the given point lies on or near a polyline, within a specified tolerance in meters.
* `simplify` Future<List<LatLng>> : Simplifies the given poly (polyline or polygon) using the Douglas-Peucker decimation algorithm.

# Example

```dart
// Let's prepare dummy arguments.
List<LatLng> paths = [];
paths.add(LatLng(0,0));
paths.add(LatLng(0,1));
paths.add(LatLng(0,2));
paths.add(LatLng(0,4));

// Coordinate you want to check if it lies within or near path.
LatLng point = LatLng(0, 3);

String encodedString = "???_ibE?_seK?_ibE";
```

###  containsLocation

```dart
GoogleMapPolyUtil.containsLocation(
	point: point,
    polygon: paths
).then((result) => print(result));
```

### decode

```dart
GoogleMapPolyUtil.decode(
	encodedPath: encodedPath
).then((result) => print(result));
```

### distanceToLine

```dart
GoogleMapPolyUtil.distanceToLine(
	point: LatLng(0, 0),
    start: LatLng(0, 0),
    end: LatLng(0, 8)
).then((result) => print(result));
```

### encode

```
GoogleMapPolyUtil.encode(
	path: paths
).then((result) => print(result));
```

### isClosedPolygon

```dart
GoogleMapPolyUtil.isClosedPolygon(
	poly: path,
    polygon: paths
).then((result) => print(result));
```

### isLocationOnEdge

```
GoogleMapPolyUtil.isLocationOnEdge(
	point: point,
    polygon: paths
).then((result) => print(result));
```

### isLocationOnPath

```dart
GoogleMapPolyUtil.isLocationOnEdge(
	point: point,
    polygon: paths
).then((result) => print(result));
```

### simplify

```dart
GoogleMapPolyUtil.simplify(
	poly: paths,
    tolerance: 100
).then((result) => print(result));
```

# Author

[Ashim Upadhaya](https://github.com/ayyshim)

> *Note : This plugin can only be used for android application. iOS support in not available yet.* 