import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FormCard extends StatefulWidget {
  @override
  _FormCardState createState() => _FormCardState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _FormCardState extends State<FormCard> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius:
                    BorderRadius.all(new Radius.circular(100.0))
              ),
              hintText: 'Submit New',
            ),
            controller: titleController,
          ),

          SizedBox(height: 10.0,),

          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Enter Description',
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(new Radius.circular(25.0))
              ),
            ),
            maxLines: 8,
          ),

          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {
              print('title :- '+titleController.text);
              print('description :- '+descriptionController.text);
              titleController.clear();
              descriptionController.clear();
            },
            color: Colors.blue,
            child:
            Text('Submit',style: TextStyle(fontSize: 20)
            ),
          ),
        ],
      ),
    );
  }
}
