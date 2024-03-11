//image component
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final image;
  const ImageComponent({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double  height = 300;
     double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child:  Image(
        fit: BoxFit.cover,
        image: NetworkImage(
          image
        ),
        loadingBuilder: (context, child, loading){

          if(loading==null){
            return child;
          }
          else{
            return Container(
              height: height,
                width: width,
decoration: BoxDecoration(
  color: Colors.green
),
            );
          }
        },
        errorBuilder:(context, exception, stac) {
          return Container(
            height:  height,
            width: width,
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.signal_wifi_connected_no_internet_4_outlined),
                Text('no internet connection')
              ],
            ),
          );
        },
      ),



    );
  }
}
