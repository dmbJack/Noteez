import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/blocs/bloc/notes_bloc.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/screens/display_note_page.dart';
import 'package:note_app/utils/color_list.dart';
import 'package:note_app/widgets/color_circle_widget.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_snackbar.dart';

class AddNotePage extends StatefulWidget {
  final Note? noteFromParams;
  const AddNotePage({
    Key? key,
    this.noteFromParams,
  }) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  int indexColorChoose = 0;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.noteFromParams != null) {
      titleController.text = widget.noteFromParams!.title;
      contentController.text = widget.noteFromParams!.content;
      setState(() {
        indexColorChoose =
            listOfColor.indexOf(widget.noteFromParams!.colorNote);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    onTaped: () {
                      Navigator.pop(context);
                    },
                    buttonWith: 50,
                    contentWidget: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Colors.white,
                    )),
                BlocListener<NotesBloc, NotesState>(
                  listener: (context, state) {
                    if (state is AddNoteState) {
                      customSnackBar(context: context, text: 'Saved');
                      // const snackForSate = SnackBar(
                      //   content: Text('Saved'),
                      //   behavior: SnackBarBehavior.floating,
                      //   margin: EdgeInsets.symmetric(horizontal: 10),
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(snackForSate);
                      // Navigator.pop(context);
                    }
                  },
                  child: CustomButton(
                      bgcolorOfButton: listOfColor[indexColorChoose],
                      onTaped: () {
                        if (widget.noteFromParams != null) {
                          context.read<NotesBloc>().add(UpdateNoteEvent(
                                widget.noteFromParams ??
                                    Note(
                                      title: titleController.text.trim(),
                                      content: contentController.text.trim(),
                                      dateCreatedOrModified: DateTime.now(),
                                      
                                      colorNote: listOfColor[indexColorChoose],
                                    ),
                                Note(
                                  title: titleController.text.trim(),
                                  content: contentController.text.trim(),
                                  dateCreatedOrModified: DateTime.now(),                    
                                  colorNote: listOfColor[indexColorChoose],
                                ),
                              ));
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => DisplayNotePage(
                                    noteFromParams: Note(
                                      title: titleController.text.trim(),
                                      content: contentController.text.trim(),
                                      dateCreatedOrModified: DateTime.now(),
                                     
                                      colorNote: listOfColor[indexColorChoose],
                                    ),
                                  )));
                        } else {
                          context.read<NotesBloc>().add(
                                AddNoteEvent(
                                  Note(
                                    title: titleController.text.trim(),
                                    content: contentController.text.trim(),
                                    dateCreatedOrModified: DateTime.now(),
                                    colorNote: listOfColor[indexColorChoose],
                                  ),
                                ),
                              );
                        }
                      },
                      buttonWith: 70,
                      contentWidget: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: titleController,
              cursorHeight: 30,
              style: const TextStyle(color: Colors.grey, fontSize: 30),
              decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 40, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none))),
            ),
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: contentController,
                  maxLines: 40,
                  cursorHeight: 25,
                  style: const TextStyle(color: Colors.grey, fontSize: 20),
                  decoration: const InputDecoration(
                      hintText: 'Type something...',
                      hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none))),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            ColorCircleWidget(
              rangOfColor: 0,
              colorOfCircle: listOfColor[0],
              indexChoose: indexColorChoose,
              onTap: () => setState(() {
                indexColorChoose = 0;
              }),
            ),
            ColorCircleWidget(
              rangOfColor: 1,
              colorOfCircle: listOfColor[1],
              indexChoose: indexColorChoose,
              onTap: () => setState(() {
                indexColorChoose = 1;
              }),
            ),
            ColorCircleWidget(
              rangOfColor: 2,
              colorOfCircle: listOfColor[2],
              indexChoose: indexColorChoose,
              onTap: () => setState(() {
                indexColorChoose = 2;
              }),
            ),
            ColorCircleWidget(
              rangOfColor: 3,
              colorOfCircle: listOfColor[3],
              indexChoose: indexColorChoose,
              onTap: () => setState(() {
                indexColorChoose = 3;
              }),
            ),
            ColorCircleWidget(
              rangOfColor: 4,
              colorOfCircle: listOfColor[4],
              indexChoose: indexColorChoose,
              onTap: () => setState(() {
                indexColorChoose = 4;
              }),
            ),
            ColorCircleWidget(
              rangOfColor: 5,
              colorOfCircle: listOfColor[5],
              indexChoose: indexColorChoose,
              onTap: () => setState(() {
                indexColorChoose = 5;
              }),
            ),
            ColorCircleWidget(
              rangOfColor: 6,
              colorOfCircle: listOfColor[6],
              indexChoose: indexColorChoose,
              onTap: () => setState(() {
                indexColorChoose = 6;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
