import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/blocs/bloc/notes_bloc.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/screens/display_note_page.dart';
import 'package:note_app/utils/constant.dart';
import 'package:note_app/widgets/custom_snackbar.dart';
import 'package:note_app/widgets/note_box_widget.dart';

class ListOfNoteBoxWidget extends StatelessWidget {
  final List<Note> notes;
  const ListOfNoteBoxWidget({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> notesWithWidget = [];
    bool isTrue = true;
    for (var i = 0; i < notes.length; i++) {
      final element = notes[i];
      //Add element with the same time
      if (notes.indexOf(element) < notes.length - 1 &&
          element.dateCreatedOrModified.day == notes[i + 1].dateCreatedOrModified.day) {
        if (isTrue) {
          notesWithWidget.add(Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            child: Text(
              DateFormat('d MMM yy').format(element.dateCreatedOrModified),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
          ));
          isTrue = false;
        }
      } else {
        isTrue = true;
      }
      notesWithWidget.add(GestureDetector(
          onLongPress: () {
            final alertForDelete = AlertDialog(
              icon: const Icon(
                Icons.delete,
                size: 30,
              ),
              iconColor: Colors.grey,
              elevation: 8,
              title: const Text(
                'Deleting',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: primaryColor,
              content: const Text(
                'Do you want to delete this note ?',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                BlocListener<NotesBloc, NotesState>(
                  listener: (_, state) {
                    if (state is RemoveNoteState) {
                      customSnackBar(
                          context: _, text: 'Note successfully deleted');
                    }
                  },
                  child: TextButton(
                      onPressed: () {
                        context.read<NotesBloc>().add(RemoveNoteEvent(element));
                        // Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            );
            showDialog(context: context, builder: (context) => alertForDelete);
          },
          onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DisplayNotePage(noteFromParams: element),
                ),
              )),
          child: NoteBoxWidget(note: element)));
    }
    return Wrap(children: notesWithWidget);
  }
}
