import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: 30.h, bottom: 15.h, right: 15.w, left: 15.w),
              child: CustomTextField(
                onSaved: (value) {
                  title = value;
                },
                hint: 'Title',
                maxlines: 1,
              )),
          Padding(
            padding: EdgeInsets.only(top: 5.h, right: 15.w, left: 15.w),
            child: CustomTextField(
              hint: 'Content',
              maxlines: 7,
              onSaved: (value) {
                content = value;
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.w),
            child: const ColorsListView(),
          ),
          SizedBox(height: 30.h),
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
                      color: const Color(0xffDD614A).value);
                  BlocProvider.of<AddNotesCubit>(context).addNote(note);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                }
              },
            );
          })
        ],
      ),
    );
  }
}
