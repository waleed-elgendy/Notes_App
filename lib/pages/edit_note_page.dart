import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/view_notes_cubit/view_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared_widgets/colors_list_view.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            CustomAppBar(
              text: "Edit",
              icon: IconButton(
                icon: Icon(
                  FontAwesomeIcons.check,
                  size: 22.dm,
                ),
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.content = content ?? widget.note.content;
                  widget.note.save();
                  BlocProvider.of<ViewNotesCubit>(context).fetchNote();
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
              maxlines: 1,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.content,
              maxlines: 7,
            ),
            SizedBox(
              height: 15.h,
            ),
            EditNoteColorList(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({Key? key, required this.note}) : super(key: key);
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;

  List<Color> colors = const [
    Color(0xffDD614A),
    Color(0xff634B66),
    Color(0xffE8C547),
    Color(0xff7CC6FE),
    Color(0xff21A0A0),
  ];
  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (28 * 2).h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color = colors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: colors[index],
                  isSelected: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
