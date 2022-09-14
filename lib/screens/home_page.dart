import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/screens/add_note_page.dart';
import 'package:note_app/screens/search_page.dart';
import 'package:note_app/utils/constant.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_snackbar.dart';
import '../blocs/bloc/notes_bloc.dart';
import 'components/home_screen/list_of_notebox_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Widget listOfNote() {
  //   List<Widget> notesWithWidget = [];
  //   for (var element in notes) {
  //     notesWithWidget.add(NoteBoxWidget(note: element));
  //   }
  //   return Wrap(children: notesWithWidget);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNotePage()));
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notes',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    CustomButton(
                      onTaped: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                              fullscreenDialog: true),
                        );
                      },
                      buttonWith: 50,
                      contentWidget: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<NotesBloc, NotesState>(
                  builder: (context, state) {
                    if (state.notes.isEmpty) {
                      return Center(
                        child: Text(
                          'Vous n\'avez pas de note',
                          style: TextStyle(color: primaryColor, fontSize: 20),
                        ),
                      );
                    }
                    return ListOfNoteBoxWidget(notes: state.notes);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
