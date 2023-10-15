import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared_widgets/button.dart';
import 'package:notes_app/shared_widgets/colors_list_view.dart';
import 'package:notes_app/shared_widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 15, right: 15, left: 15),
              child: CustomTextField(
                onSaved: (value) {
                  title = value;
                },
                hint: 'Title',
                maxlines: 1,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15, left: 15),
            child: CustomTextField(
              hint: 'Content',
              maxlines: 7,
              onSaved: (value) {
                content = value;
              },
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 11),
            child: ColorsListView(),
          ),
          const SizedBox(height: 30),
          BlocBuilder<AddNotesCubit, AddNotesStates>(builder: (context, state) {
            return CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
              text: 'Add',
              ontap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var note = NoteModel(
                      title: title!,
                      content: content!,
                      date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                      color: Colors.indigo.value);
                  BlocProvider.of<AddNotesCubit>(context).addNote(note);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            );
          })
        ],
      ),
    );
  }
}

