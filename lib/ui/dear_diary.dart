
import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {

  DiaryCard( { this.title, this.subtitle,this.discription, this.color});

  final String title;
  final String subtitle;
  final String discription;
  final Color color;
  void m() {

  }
  @override
  Widget build(BuildContext context) {

    return Card(


//        margin: EdgeInsets.only(left: 10.0,right: 10.0,top:20.0,bottom: 250.0),
      color: color,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[


          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(this.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),maxLines: 2),

          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(this.subtitle,maxLines: 1,),
          ),
          Container(

            child: Text(""),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(this.discription,style: TextStyle( fontSize: 15.0),maxLines: 3,),

          ),
          Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              FlatButton(

                color: Colors.cyan,
                child: const Text("show more"),
                onPressed: (){},
              )

            ],
          ),
        ],
      ),
    );

  }


}
