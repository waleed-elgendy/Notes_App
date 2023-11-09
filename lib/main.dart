import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/view_notes_cubit/view_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes_box');
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewNotesCubit(),
      child: ScreenUtilInit(
          designSize: const Size(411.42857142857144, 843.4285714285714),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.dark,
                fontFamily: "Poppins",
              ),
              home: const HomePage(),
            );
          }),
    );
  }
}
