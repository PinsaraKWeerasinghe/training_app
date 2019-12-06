import 'package:dear_diary/models/models.dart';
import 'package:dear_diary/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EntryList extends StatefulWidget {
  @override
  _EntryListState createState() => _EntryListState();
}

class _EntryListState extends State<EntryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return EntryTile(
          entry: Entry(
            title: 'Test',
            description: 'Description',
            user: User(name: 'Azeem'),
          ),
        );
      },
    );
  }
}
