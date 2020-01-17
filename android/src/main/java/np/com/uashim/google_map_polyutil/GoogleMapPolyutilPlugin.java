package np.com.uashim.google_map_polyutil;

import android.util.Log;

import androidx.annotation.NonNull;

import com.google.android.gms.maps.model.LatLng;
import com.google.maps.android.PolyUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** GoogleMapPolyutilPlugin */
public class GoogleMapPolyutilPlugin implements FlutterPlugin, MethodCallHandler {
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    final MethodChannel channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "google_map_polyutil");
    channel.setMethodCallHandler(new GoogleMapPolyutilPlugin());
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "google_map_polyutil");
    channel.setMethodCallHandler(new GoogleMapPolyutilPlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("containsLocation")) {
      ArrayList<HashMap> mapPolygon = (ArrayList<HashMap>) call.argument("polygon");
      HashMap mapPoint = (HashMap) call.argument("point");
      boolean geodesic = (boolean) call.argument("geodesic");

      List<LatLng> path = Transform.hashMapListToLatLngList(mapPolygon);
      LatLng point = Transform.hashMapToLatLng(mapPoint);

      result.success(PolyUtil.containsLocation(point, path, geodesic));

    }
    else if(call.method.equals("decode")) {
      String encodedPath = (String) call.argument("encodedPath");

      result.success(Transform.latLngListToHashMap(PolyUtil.decode(encodedPath)));

    }
    else if(call.method.equals("distanceToLine")) {
      HashMap mapPoint = (HashMap) call.argument("p");
      HashMap mapStart = (HashMap) call.argument("start");
      HashMap mapEnd = (HashMap) call.argument("end");

      LatLng point = Transform.hashMapToLatLng(mapPoint);
      LatLng start = Transform.hashMapToLatLng(mapStart);
      LatLng end = Transform.hashMapToLatLng(mapEnd);

      result.success(PolyUtil.distanceToLine(point, start, end));

    }
    else if(call.method.equals("encode")) {
      ArrayList<HashMap> mapPolygon = (ArrayList<HashMap>) call.argument("path");

      List<LatLng> path = Transform.hashMapListToLatLngList(mapPolygon);

      result.success(PolyUtil.encode(path));

    }
    else if(call.method.equals("isClosedPolygon")) {
      ArrayList<HashMap> mapPolygon = (ArrayList<HashMap>) call.argument("poly");

      List<LatLng> path = Transform.hashMapListToLatLngList(mapPolygon);

      result.success(PolyUtil.isClosedPolygon(path));

    }
    else if(call.method.equals("isLocationOnEdge")) {
      ArrayList<HashMap> mapPolygon = (ArrayList<HashMap>) call.argument("polygon");
      HashMap mapPoint = (HashMap) call.argument("point");
      boolean geodesic = (boolean) call.argument("geodesic");
      double tolerance = (double) call.argument("tolerance");

      List<LatLng> path = Transform.hashMapListToLatLngList(mapPolygon);
      LatLng point = Transform.hashMapToLatLng(mapPoint);

      result.success(PolyUtil.isLocationOnEdge(point, path, geodesic, tolerance));

    }
    else if(call.method.equals("isLocationOnPath")) {
      ArrayList<HashMap> mapPolygon = (ArrayList<HashMap>) call.argument("polyline");
      HashMap mapPoint = (HashMap) call.argument("point");
      boolean geodesic = (boolean) call.argument("geodesic");
      double tolerance = (double) call.argument("tolerance");

      List<LatLng> path = Transform.hashMapListToLatLngList(mapPolygon);
      LatLng point = Transform.hashMapToLatLng(mapPoint);

      result.success(PolyUtil.isLocationOnPath(point, path, geodesic, tolerance));

    }
    else if(call.method.equals("simplify")) {
      ArrayList<HashMap> mapPolygon = (ArrayList<HashMap>) call.argument("poly");
      double tolerance = (double) call.argument("tolerance");

      List<LatLng> path = Transform.hashMapListToLatLngList(mapPolygon);

      result.success(Transform.latLngListToHashMap(PolyUtil.simplify(path, tolerance)));

    }
    else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
  }
}
