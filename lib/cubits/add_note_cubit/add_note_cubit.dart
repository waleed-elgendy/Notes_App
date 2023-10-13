import 'package:bloc/bloc.dart ';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_notes_states.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit(super.initialState);

  addNote(NoteModel note) async{
    emit(AddNoteLoading());
   try{
     var notesBox = Hive.box('notes_box');
     await notesBox.add(note);
     emit(AddNoteSuccess());
   }catch(e){
     emit(AddNoteFailure(e.toString()));
   }
  }
}
