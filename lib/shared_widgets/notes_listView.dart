import 'package:flutter/material.dart';
import 'package:notes_app/shared_widgets/note_widget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: const NoteWidget(),
        ),
      ),
    );
  }
}
