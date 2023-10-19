import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/newsResponse.dart';
import 'package:newsapp/model/sourceResponse.dart';



class apiManager{
  static const String baseUrl='newsapi.org';
  static const String sourceApi='/v2/top-headlines/sources';
  static const String newsApi='/v2/everything';
  static Future<SourceResponce?> getSources (String categoryId)async{
    /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=193c64fab7f24774bf819c38baf3a34a
     */
    Uri url=Uri.https(baseUrl,sourceApi,
    {
      'apikey':'193c64fab7f24774bf819c38baf3a34a',
      'category' : categoryId
    }
    );
    try{
      http.get(url);
      var response = await http.get(url);
      var bodyString= response.body;
      var json = jsonDecode(bodyString);
     return SourceResponce.fromJson(json);
    }
    catch(e){
      throw e;
    }




  }
  static Future<NewsResponse?> getNewsBySource(String SourceId,{String pageNum='1'})async{
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=193c64fab7f24774bf819c38baf3a34a
     */

    Uri url =Uri.https(baseUrl,newsApi,
    {
      'apikey':'193c64fab7f24774bf819c38baf3a34a',
      'sources':SourceId,
      "page":pageNum,
      "pageSize":"20"


    }
    );
    try{
      http.get(url);
      var response =await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);

    }
    catch(e){
      throw e;
    }



  }
}