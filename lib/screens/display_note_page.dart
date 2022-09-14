import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/screens/add_note_page.dart';
import 'package:note_app/screens/home_page.dart';
import 'package:note_app/widgets/custom_button.dart';

class DisplayNotePage extends StatelessWidget {
  final Note noteFromParams;
  const DisplayNotePage({
    Key? key,
    required this.noteFromParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                children: [
                  CustomButton(
                      onTaped: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      buttonWith: 50,
                      contentWidget: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                        color: Colors.white,
                      )),
                  CustomButton(
                      onTaped: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddNotePage(
                                  noteFromParams: noteFromParams,
                                )));
                      },
                      buttonWith: 50,
                      contentWidget: const Center(
                          child: Icon(
                        Icons.edit_note_outlined,
                        color: Colors.white,
                        size: 35,
                      ))),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                noteFromParams.title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  DateFormat('kk:mm:ss EEE d MMM')
                      .format(noteFromParams.dateModified),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  noteFromParams.content,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.openSans(
                      wordSpacing: 3,
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
