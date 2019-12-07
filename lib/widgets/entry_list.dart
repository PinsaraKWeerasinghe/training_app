import 'package:dear_diary/models/models.dart';
import 'package:dear_diary/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EntryList extends StatefulWidget {
  final List<Entry> entries;
  EntryList({this.entries});

  @override
  _EntryListState createState() => _EntryListState();
}

class _EntryListState extends State<EntryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.entries.length,
      itemBuilder: (context, index) {
        return EntryTile(
          entry: Entry(
            title: widget.entries[index].title,
            description: widget.entries[index].description,
            user: widget.entries[index].user,
          ),
        );
      },
    );
  }
}
