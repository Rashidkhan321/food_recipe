import 'package:flutter/material.dart';
import 'package:food_recipe/components/SerachBar.dart';
import 'package:food_recipe/components/imagecomponent.dart';
import 'package:food_recipe/view%20modal/hoemcontroller/HomeController.dart';

import 'package:get/get.dart';

import '../viewRecipe.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());


   @override
  void initState() {
     controller.getdata();
     controller.itemlist;
controller.loading;

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async  {

        return await showDialog(context: context, builder: (context){
          return AlertDialog(
            content: Text('Do you want to exit the app?'),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop(false);

              }, child: Text('No')),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop(true);

          }, child: Text('Yes'))
            ],
          );
        })??false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('chicken RECIPE'.toUpperCase())),
        ),
        body: Obx(
          ()=>
          controller.loading.value?Center(child: CircularProgressIndicator()):
          Column(
            children: [
              SizedBox(height: 10,),
              SerachBar(),

                Expanded(
                  child: ListView.builder(

                      itemCount: controller.itemlist.length,
                      itemBuilder: (context, index){


                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)
                                =>RecipeDetail(baseurl: controller.itemlist[index].recipe_source.toString(),)));
                              }
                              ,
                              child: Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.green,

                                ),

                                child:ImageComponent(image:controller.itemlist[index].recipe_image.toString() ,)
                              ),
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

                                   controller.itemlist[index].recipename.toString(), style: TextStyle(

                                   fontWeight: FontWeight.w800, fontSize: 20,

                                 ),),
                               )
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
