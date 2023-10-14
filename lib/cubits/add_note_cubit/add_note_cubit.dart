import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_notes_states.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit() : super(AddNotesInitial());

  addNote(NoteModel note) async{
    emit(AddNoteLoading());
   try{
     var notesBox = Hive.box<NoteModel>('notes_box');
     await notesBox.add(note);
     emit(AddNoteSuccess());
   }catch(e){
     emit(AddNoteFailure(e.toString()));
   }
  }
}
