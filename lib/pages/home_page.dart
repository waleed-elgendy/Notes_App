import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/shared_widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/shared_widgets/notes_view_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24.dm),
                      topLeft: Radius.circular(24.dm))),
              context: context,
              builder: (context) {
                return const AddNote();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
