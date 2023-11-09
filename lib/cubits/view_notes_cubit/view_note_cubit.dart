import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'view_notes_states.dart';

class ViewNotesCubit extends Cubit<ViewNotesStates> {
  ViewNotesCubit() : super(ViewNotesInitial());

  List<NoteModel>? notes;

  fetchNote() {
    var notesBox = Hive.box<NoteModel>('notes_box');
    notes = notesBox.values.toList();
    emit(ViewNotesSuccess());
    // return notes;
  }
}
