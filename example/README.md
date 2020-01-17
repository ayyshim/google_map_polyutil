# google_map_polyutil_example

Demonstrates how to use the google_map_polyutil plugin.

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

