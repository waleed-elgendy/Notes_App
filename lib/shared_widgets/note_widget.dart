import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/pages/edit_note_page.dart';
class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditNote(),
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 28,
          bottom: 28,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffFCC679),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text(
                'Flutter tips',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Build your career with greet projects',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding:  EdgeInsets.only(right: 24),
              child:  Text(
                'may 21,2,2022',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}