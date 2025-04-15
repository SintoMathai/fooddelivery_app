import 'dart:convert';
import 'package:fooddelivery_app/modelclass.dart';
import 'package:http/http.dart' as http;
class Networking {
  Future<Recipe>singleuser(int id) async
  {
    final Url=Uri.parse("https://dummyjson.com/recipes/$id");
    final response=await http.get(Url);

    if(response.statusCode==200)
    {
      final respdata=jsonDecode(response.body);
      final about=Recipe.fromJson(respdata);
      return about;
    }
    else{
      throw Exception("error:${response.statusCode}");

    }
  }
  Future<List<Recipe>> multiuser() async{
    final url=Uri.parse("https://dummyjson.com/recipes");//json:javascript object notaion
    final response=await http.get(url);
    if(response.statusCode==200)
    {
      final respdata=jsonDecode(response.body);
      final receipes=Receipes.fromJson(respdata);
      return receipes.recipes;
    }else
    {
      throw Exception("error: ${response.statusCode}");
    }
  }
}
class item {
  Future<List<Map<String, dynamic>>> searchitem(String Query) async
  {
    final response=await http.get(Uri.parse("https://dummyjson.com/recipes/search?q=$Query"));
    if(response.statusCode==200)
      {
        final data=jsonDecode(response.body);
        return List<Map<String,dynamic>>.from(data['recipes']);
      }
    else {
      throw Exception("error:");
    }
  }
  }
