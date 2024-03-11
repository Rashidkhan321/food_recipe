import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe/components/SerachBar.dart';
import 'package:food_recipe/components/imagecomponent.dart';
import 'package:food_recipe/view%20modal/SerachController/SerachController.dart';
import 'package:food_recipe/view%20modal/hoemcontroller/HomeController.dart';
import 'package:http/http.dart'as http;

import 'package:get/get.dart';

import '../../data/ApiModal.dart';
import '../viewRecipe.dart';
class SerachScreen extends StatefulWidget {
  String query;
  SerachScreen({Key? key, required this.query}) : super(key: key);

  @override
  State<SerachScreen> createState() => _SerachScreenState();
}

class _SerachScreenState extends State<SerachScreen> {
  final serachcontroller = TextEditingController();
  bool loading =true;
  List<ApiModal>serachitem =[];
  getserachdata(String query) async{
    String url = 'https://api.edamam.com/search?q=$query&app_id=f2034871&app_key=003905b76e0cf320827ca4d2213c4b49&from=0&to=80';
    final response =await http.get(Uri.parse(url));
    serachitem.clear();
    Map data = jsonDecode(response.body);

    data["hits"].forEach((element){

      ApiModal modal=new ApiModal();
      modal = ApiModal.fromMap(element["recipe"]);

      serachitem.add(modal);

      setState(() {
        loading = false;
      });





    });


  }

  @override
  void initState() {
    getserachdata(widget.query);


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(widget.query.toUpperCase()+' RECIPE..'.toUpperCase())),
      ),
      body: loading?Center(child: CircularProgressIndicator()):
      Column(
        children: [
          SizedBox(height: 10,),


          Expanded(
            child: ListView.builder(

                itemCount: serachitem.length,
                itemBuilder: (context, index){

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          =>RecipeDetail(baseurl: serachitem[index].recipe_source.toString(),)));
                        }
                        ,
                        child: Stack(
                          children: [
                            Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.green,

                              ),
                              child:ImageComponent(image: serachitem[index].recipe_image.toString(),)
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white54,

                                  ),
                                  child:Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(

                                      serachitem[index].recipename.toString(), style: TextStyle(

                                      fontWeight: FontWeight.w800, fontSize: 20,

                                    ),),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
}
