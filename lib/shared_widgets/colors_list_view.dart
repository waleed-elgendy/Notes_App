import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isSelected, required this.color})
      : super(key: key);

  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 28.dm,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 24.5.dm,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 26.5.dm,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xffDD614A),
    Color(0xff634B66),
    Color(0xffE8C547),
    Color(0xff7CC6FE),
    Color(0xff21A0A0),
  ];

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
                  BlocProvider.of<AddNotesCubit>(context).color = colors[index];
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
