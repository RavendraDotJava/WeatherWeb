package Api;


import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import org.json.JSONException;


public class WeatherdataApi {
    public static ArrayList Headerdata(){
        
        
        ArrayList<String> dta = new ArrayList();
        dta.add("Condition");
        dta.add("Current Location");
        dta.add("Sunrise");
        dta.add("Date");
        dta.add("Current Tempreture");
        dta.add("Minimum Tempreture");
        dta.add("Maximum tempreture");
        dta.add("Humidity");
        dta.add("Sunset");
        dta.add("Visibility");
        dta.add("Windspeed");
        dta.add("Uv Index");
        return dta;
        
        
        
        
    }
    
    
    
          public static ArrayList GetData(String loc) throws IOException, InterruptedException, JSONException {

         

              ArrayList<String> out= new ArrayList();
            
              HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/" +loc+ "/today?unitGroup=metric&key=DRL3ESQZP8UT7HL7E4P8BJB42&contentType=json"))
                .method("GET", HttpRequest.BodyPublishers.noBody()).build();
        HttpResponse<String> response = HttpClient.newHttpClient()
                .send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println(response.body());
        org.json.JSONObject js = new org.json.JSONObject(response.body());
//        System.out.println("----------------------------------------------");
//        System.out.println(js.names());
//        System.out.println(js.getJSONArray("days").getJSONObject(0).get("description"));
//        System.out.println(js.get("address"));
//        System.out.println(js.get("currentConditions"));
//        System.out.println(js.getJSONArray("days").getJSONObject(0).get("sunset").toString());
        String desc = js.getJSONArray("days").getJSONObject(0).get("description").toString();
        String resAdd = js.get("resolvedAddress").toString();
        String Sunrise = js.getJSONArray("days").getJSONObject(0).get("sunrise").toString();
        String Date = js.getJSONArray("days").getJSONObject(0).get("datetime").toString();
        String tem = js.getJSONArray("days").getJSONObject(0).get("temp").toString();
        String mintem = js.getJSONArray("days").getJSONObject(0).get("tempmin").toString();
        String maxtemp = js.getJSONArray("days").getJSONObject(0).get("tempmax").toString();
        String humidid = js.getJSONArray("days").getJSONObject(0).get("humidity").toString();
        String sunse = js.getJSONArray("days").getJSONObject(0).get("sunset").toString();
        String visibil = js.getJSONArray("days").getJSONObject(0).get("visibility").toString();
        String winspeed = js.getJSONArray("days").getJSONObject(0).get("windspeed").toString();
        String uvin = js.getJSONArray("days").getJSONObject(0).get("uvindex").toString();
        out.add(desc);out.add(resAdd);out.add(Sunrise);out.add(Date);out.add(tem+"°C");out.add(mintem+"°C");
        out.add(maxtemp+"°C");out.add(humidid+"%");out.add(sunse);out.add(visibil+"KM");out.add(winspeed+"KPH");out.add(uvin);
        

          return out;

    }
    
}
