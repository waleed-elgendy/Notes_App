import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/view_notes_cubit/view_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared_widgets/custom_appBar.dart';
import 'package:notes_app/shared_widgets/custom_text_form_field.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key, required this.note}) : super(key: key);
  final NoteModel note;
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomAppBar(
              text: "Edit",
              icon: IconButton(
                icon: const Icon(FontAwesomeIcons.check),
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.content = content ?? widget.note.content;
                  widget.note.save();
                  BlocProvider.of<ViewNotesCubit>(context).fetchNote();
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
              maxlines: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.content,
              maxlines: 7,
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
