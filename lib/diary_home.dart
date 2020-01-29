import 'package:flutter/material.dart';

class DiaryHome extends StatefulWidget{
//  final void Function(String, String) onPress;
//  const DiaryHome(this.onPress);

  @override
  TestState createState()=> TestState();

}
class TestState extends State<DiaryHome> {//to save text in console
  final titlecontroller = TextEditingController();//to save text in console
  final descriptioncontroller = TextEditingController();//to save text in console


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Container(
              width: 250,
              padding: EdgeInsets.all(8.0),
              child: new TextField(
                controller: titlecontroller,

//                maxLines: 2,
                autocorrect: true,
                decoration: InputDecoration(
                    hintText: 'Submit new..',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    )
                ),
              ),
            ),
          ),

          Container(
            child: Container(

              width: 250,
              padding: EdgeInsets.all(10.0),
              child: new TextField(
                controller: descriptioncontroller,
                maxLines: 13,
                autocorrect: true,
//                obscureText: true,//for password
                decoration: InputDecoration(
                    hintText: 'Enter Descripition',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey),

                    )
                ),
              ),

            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: (){
                String title = titlecontroller.text;//to save text in console
                String description = descriptioncontroller.text;//to save text in console
                if(title == ''){//to save text in console
                  print('Title is Missing..');//to save text in console
                  return;//to save text in console
                }else{//to save text in console
                  print('title : '+ titlecontroller.text);//to save text in console
                }//to save text in console
                if(description == ''){//to save text in console
                  print('Description is Missing..');//to save text in console
                  return;//to save text in console
                }else{//to save text in console
                  print('description : '+ descriptioncontroller.text);//to save text in console

                }//to save text in console
//                widget.onPress(title,description);
                titlecontroller.clear();
                descriptioncontroller.clear();
              },
              child: Text('Submit'),
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.lightBlue),

              ),

            ),
          ),


          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

            ],

          ),
        ],
      ),
    );
  }
}

