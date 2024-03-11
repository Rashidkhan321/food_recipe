
import 'dart:collection';
import 'dart:convert';

import 'package:food_recipe/data/ApiModal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class SerachController extends GetxController{

  var serachitem = <ApiModal>[].obs;

RxBool loading = true.obs;
  getserachdata(String query) async{
    String url = 'https://api.edamam.com/search?q=$query&app_id=f2034871&app_key=003905b76e0cf320827ca4d2213c4b49&from=0&to=100';
    final response =await http.get(Uri.parse(url));
    serachitem.clear();
    Map data = jsonDecode(response.body);

    data["hits"].forEach((element){
      
      ApiModal modal=new ApiModal();
      modal = ApiModal.fromMap(element["recipe"]);

      serachitem.add(modal);


      loading.value= false;


      
      
    });


  }

}