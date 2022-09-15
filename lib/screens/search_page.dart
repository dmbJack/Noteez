import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/blocs/bloc/notes_bloc.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/screens/home_page.dart';
import 'package:note_app/utils/constant.dart';

import '../widgets/custom_button.dart';
import 'components/home_screen/list_of_notebox_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Note> notesFind = [];
  void _onSearch(String value, List<Note> notesForSearch) {
    notesFind = notesForSearch
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Note> listOfNote = context.read<NotesBloc>().state.notes;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DelayedDisplay(
                    delay: const Duration(microseconds: 100),
                    // slidingBeginOffset: const Offset(-1, 0),
                    child: CustomButton(
                      onTaped: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      buttonWith: 50,
                      contentWidget: const Icon(
                        Icons.clear,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  DelayedDisplay(
                    delay: const Duration(microseconds: 100),
                    child: SizedBox(
                      width: 280,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _onSearch(value, listOfNote);
                          });
                        },
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 30,
                            ),
                            filled: true,
                            fillColor: primaryColor,
                            hintText: 'Type here...',
                            border: InputBorder.none,
                            hintStyle: const TextStyle(
                                fontSize: 20, color: Colors.grey)),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListOfNoteBoxWidget(notes: notesFind)
            ],
          ),
        ),
      ),
    );
  }
}
