import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:note_app/screens/loading_page.dart';
import 'package:note_app/utils/constant.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/bloc/notes_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(() => runApp(MyApp()), storage: storage);
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// bool ifStarted=false;
class _MyAppState extends State<MyApp> {
  // void _ifStartedBefore() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   ifStarted = prefs.getBool('isStarted') ?? false;
  //   print(prefs.getBool('isStarted'));
  // }

  @override
  void initState() {
    super.initState();
    // _ifStartedBefore();
  }

  @override
  Widget build(BuildContext context) {
    // print(ifStarted);
    return BlocProvider(
      create: (context) => NotesBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Noteez',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: bgcolor,
        ),
        home: const LoadingPage(),
        // home: SearchPage(),
      ),
    );
  }
}
