import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/view_notes_cubit/view_note_cubit.dart';
import 'package:notes_app/shared_widgets/add_note_form.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesStates>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            log(state.errorMessage);
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<ViewNotesCubit>(context).fetchNote();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
