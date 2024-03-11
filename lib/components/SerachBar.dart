
import 'package:flutter/material.dart';
import 'package:food_recipe/view/SeraachScreen/SerachScreen.dart';


class SerachBar extends StatelessWidget {
  SerachBar({Key? key}) : super(key: key);
  final serachcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all()
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(

controller: serachcontroller,
                  decoration: InputDecoration(
                    hintText: 'serach...',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,

                  ),
                ),
              ),
              InkWell(
                  onTap: (){
                    if(serachcontroller.text==''){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Serach is empty')));
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>SerachScreen(query: serachcontroller.text))).then((value) => {
                        serachcontroller.clear()
                      });
                    }

                  },
                  child: Icon(Icons.search_rounded))
            ],
          ),
        ),
      ),
    );
  }
}
