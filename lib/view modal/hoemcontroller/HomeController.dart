
import 'dart:convert';

import 'package:food_recipe/data/ApiModal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;


class HomeController {

  var itemlist = <ApiModal>[].obs;
RxBool loading = true.obs;

  getdata ()async{
    final url ='https://api.edamam.com/search?q=chicken&app_id=f2034871&app_key=003905b76e0cf320827ca4d2213c4b49&from=0&to=80';
    final response = await  http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    data["hits"].forEach((element){

      ApiModal modal = new ApiModal();
      modal = ApiModal.fromMap(element["recipe"]);
      itemlist.add(modal);
      loading.value= false;

    });
  itemlist.forEach((element) {

    print(element.recipename.toString());

  });
  }



}