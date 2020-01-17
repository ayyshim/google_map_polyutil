import 'package:google_map_polyutil/gmp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

/// A helper class regarding Google map native android utility class "PolyUtil".
/// For brief documentation from native class goto
/// https://googlemaps.github.io/android-maps-utils/javadoc/
///
class GoogleMapPolyUtil {
  /// Computes whether the given point lies inside
  /// the specified polygon. The polygon is always considered
  /// closed, regardless of whether the last point equals the
  /// first or not. Inside is defined as not containing the
  /// South Pole -- the South Pole is always outside.
  /// The polygon is formed of great circle segments if
  /// geodesic is true, and of rhumb (loxodromic) segments
  /// otherwise.
  ///
  static Future<bool> containsLocation(
          {@required LatLng point,
          @required List<LatLng> polygon,
          bool geodesic = true}) =>
      GMP.containsLocation(point, polygon, geodesic);

  /// Decodes an encoded path string into a sequence of LatLngs.
  ///
  static Future<List<LatLng>> decode({@required String encodedPath}) =>
      GMP.decode(encodedPath);

  /// Computes the distance on the sphere between the point p
  /// and the line segment start to end.
  /// ### Parameters:
  /// * _[point]_ -  the point to be measured.
  /// * _[start]_ - the beginning of line segment.
  /// * _[end]_ - the end of the line segment.
  ///
  static Future<double> distanceToLine(
          {@required LatLng point,
          @required LatLng start,
          @required LatLng end}) =>
      GMP.distanceToLine(point, start, end);

  /// Encodes a sequence of LatLngs into an encoded path string.
  ///
  static Future<String> encode({@required List<LatLng> path}) =>
      GMP.encode(path);

  /// Returns true if the provided list of points is a closed polygon
  /// (i.e., the first and last points are the same), and false if it is not
  /// ### Parameters:
  /// * _[poly]_ -  polyline or polygon.
  ///
  static Future<bool> isClosedPolygon({@required List<LatLng> poly}) =>
      GMP.isClosedPolygon(poly);

  /// Computes whether the given point lies on or near the edge of a polygon,
  /// within a specified tolerance in meters. The polygon edge is composed of
  /// great circle segments if geodesic is true, and of Rhumb segments
  /// otherwise. The polygon edge is implicitly closed -- the closing segment
  /// between the first point and the last point is included.
  ///
  static Future<bool> isLocationOnEdge(
          {@required LatLng point,
          List<LatLng> polygon,
          bool geodesic = true,
          double tolerance = 100}) =>
      GMP.isLocationOnEdge(point, polygon, geodesic, tolerance);

  /// Computes whether the given point lies on or near a polyline, within a
  /// specified tolerance in meters. The polyline is composed of great circle
  /// segments if geodesic is true, and of Rhumb segments otherwise. The polyline
  /// is not closed -- the closing segment between the first point and the last
  /// point is not included.
  ///
  static Future<bool> isLocationOnPath(
          {@required LatLng point,
          List<LatLng> polygon,
          bool geodesic = true,
          double tolerance = 200}) =>
      GMP.isLocationOnPath(point, polygon, geodesic, tolerance);

  /// Simplifies the given poly (polyline or polygon) using the Douglas-Peucker
  ///  decimation algorithm. Increasing the tolerance will result in fewer points
  /// in the simplified polyline or polygon. When the providing a polygon as
  /// input, the first and last point of the list MUST have the same latitude and
  /// longitude (i.e., the polygon must be closed). If the input polygon is not
  /// closed, the resulting polygon may not be fully simplified. The time
  /// complexity of Douglas-Peucker is O(n^2), so take care that you do not call
  /// this algorithm too frequently in your code.
  /// ### Parameters:
  /// * _[poly]_ -  polyline or polygon to be simplified. Polygon should be closed
  /// (i.e., first and last points should have the same latitude and longitude).
  /// * _[tolerance]_ - in meters. Increasing the tolerance will result in fewer
  /// points in the simplified poly.
  ///
  static Future<List<LatLng>> simplify(
          {@required List<LatLng> poly, @required double tolerance}) =>
      GMP.simplify(poly, tolerance);
}
