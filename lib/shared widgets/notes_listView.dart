import 'package:flutter/material.dart';
import 'package:notes_app/shared%20widgets/custom_note_widget.dart';
class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding:  EdgeInsets.only(bottom: 10),
        child:  NoteWidget(),
      ),
    );
  }
}