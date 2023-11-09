import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/cubits/view_notes_cubit/view_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared_widgets/note_widget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewNotesCubit, ViewNotesStates>(
        builder: (context, state) {
      List<NoteModel> notes =
          BlocProvider.of<ViewNotesCubit>(context).notes ?? [];
      return Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
        child: ListView.builder(
          itemCount: notes.length,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: NoteWidget(
              note: notes[index],
            ),
          ),
        ),
      );
    });
  }
}
