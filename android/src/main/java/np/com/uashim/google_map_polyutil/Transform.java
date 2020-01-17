package np.com.uashim.google_map_polyutil;

import com.google.android.gms.maps.model.LatLng;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Transform {
    public static List<LatLng> hashMapListToLatLngList(ArrayList<HashMap> hashMapArrayList) {
        List<LatLng> path = new ArrayList<LatLng>();
        for(HashMap p : hashMapArrayList) {
            path.add(hashMapToLatLng(p));
        }
        return path;
    }

    public static LatLng hashMapToLatLng(HashMap hashMap) {
        double lat = (double) hashMap.get("lat");
        double lng = (double) hashMap.get("lng");
      return new LatLng(lat, lng);
    }

    public static List<HashMap> latLngListToHashMap(List<LatLng> latLngList) {
        List<HashMap> hashMaps = new ArrayList<HashMap>();
        for(LatLng point: latLngList) {
            hashMaps.add(latLngToHashMap(point));
        }
        return hashMaps;
    }

    public static HashMap<String, Double> latLngToHashMap(LatLng latLng) {
        HashMap<String, Double> point = new HashMap<>();
        point.put("lat", latLng.latitude);
        point.put("lng", latLng.longitude);
        return point;
    }
}
