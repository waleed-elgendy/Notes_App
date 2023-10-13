import 'package:flutter/material.dart';
import 'package:notes_app/shared_widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/shared_widgets/custom_appBar.dart';
import 'package:notes_app/shared_widgets/notes_listView.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24))),
              context: context,
              builder: (context) {
                return const AddNote();
              });
        },
        child: const Icon(Icons.add),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomAppBar(
              text: "Title",
              icon: IconButton(icon: const Icon(Icons.search_outlined),onPressed: (){},),
            ),
            const Expanded(
              child: NotesListView(),
            )
          ],
        ),
      ),
    );
  }
}
