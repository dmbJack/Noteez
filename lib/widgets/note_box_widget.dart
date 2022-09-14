import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/model/note.dart';

class NoteBoxWidget extends StatelessWidget {
  final Note note;
  const NoteBoxWidget({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      width: 160,
      height: 160,
      decoration: BoxDecoration(
          color: note.colorNote, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Text(
              note.title,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Text(
            DateFormat('EEE d MMM').format(note.dateModified),
            style: const TextStyle(color: Colors.black54, fontSize: 16),
          )
        ],
      ),
    );
  }
}
