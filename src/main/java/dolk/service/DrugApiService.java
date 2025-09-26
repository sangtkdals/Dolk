package dolk.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dolk.dto.DrugDTO;

public class DrugApiService {

    private final String serviceKey = "6c3ee356243874540dc95e7ea10497841c2146fffbc30a1ae5cc446d5fe618a6";
    private final String baseUrl = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList";

    public List<DrugDTO> searchDrugsByEfficacy(String efficacyKeyword) throws Exception {
        
        StringBuilder urlBuilder = new StringBuilder(baseUrl);
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("efcyQesitm", "UTF-8") + "=" + URLEncoder.encode(efficacyKeyword, "UTF-8")); // 효능으로 검색
        urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=20");

        String jsonString = getJsonStringFromUrl(urlBuilder.toString());
        return parseJsonToDtoList(jsonString);
    }

    public List<DrugDTO> searchDrugsByName(String nameKeyword) throws Exception {

        StringBuilder urlBuilder = new StringBuilder(baseUrl);
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("itemName", "UTF-8") + "=" + URLEncoder.encode(nameKeyword, "UTF-8")); // 약 이름으로 검색
        urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=20");

        String jsonString = getJsonStringFromUrl(urlBuilder.toString());
        return parseJsonToDtoList(jsonString);
    }
    
    private String getJsonStringFromUrl(String urlString) throws Exception {
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String jsonString = rd.readLine();
        rd.close();
        conn.disconnect();
        return jsonString;
    }

    private List<DrugDTO> parseJsonToDtoList(String jsonString) {
        List<DrugDTO> drugList = new ArrayList<>();
        JsonParser parser = new JsonParser();
        JsonObject jsonObject = parser.parse(jsonString).getAsJsonObject();
        
        if (jsonObject.has("body") && !jsonObject.get("body").isJsonNull()) {
            JsonObject body = jsonObject.getAsJsonObject("body");
            if (body.has("items") && !body.get("items").isJsonNull()) {
                JsonArray items = body.getAsJsonArray("items");

                for (int i = 0; i < items.size(); i++) {
                    JsonObject item = items.get(i).getAsJsonObject();
                    DrugDTO drug = new DrugDTO();
                    
                    if (!item.get("itemName").isJsonNull()) drug.setItemName(item.get("itemName").getAsString());
                    if (!item.get("efcyQesitm").isJsonNull()) drug.setEfcyQesitm(item.get("efcyQesitm").getAsString());
                    if (!item.get("entpName").isJsonNull()) drug.setEntpName(item.get("entpName").getAsString());
                    if (!item.get("itemImage").isJsonNull()) drug.setItemImage(item.get("itemImage").getAsString());
                    
                    drugList.add(drug);
                }
            }
        }
        return drugList;
    }
}