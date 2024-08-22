import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/consts.dart';
import 'package:todo/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/widgets/Image_item.dart';

class EditImageList extends StatefulWidget {
  const EditImageList({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<EditImageList> createState() => _EditImageListState();
}

class _EditImageListState extends State<EditImageList> {
  int currentIndex = 0;
  @override
  void initState() {
    currentIndex = imagesList.indexOf(widget.taskModel.image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imagesList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                  BlocProvider.of<TasksCubit>(context).image =
                      imagesList[index];
                  setState(() {});
                },
                child: ImageItem(
                  image: imagesList[index],
                  isSlected: currentIndex == index,
                ),
              );
            }));
  }
}
