import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intricate1/feature/notes/data/controller/note_controller.dart';
import 'package:intricate1/feature/notes/ui/screens/note_history_page.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key});

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy, HH:mm').format(now);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_back_ios_rounded),
                        SizedBox(width: 12.w),
                        Text("Back", style: TextStyle(fontSize: 22.sp)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      noteController.addNote(
                        titleController.text,
                        descController.text,
                        formattedDate,
                      );
                      Get.to(() => NoteHistoryPage());
                    },
                    child: Row(
                      children: [
                        Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: const Color(0xff5f6caf),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Image.asset(
                          'assets/profile/image/check.png',
                          height: 14.h,
                          width: 14.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 0,
                      child: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'New Title',
                          hintStyle: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          border: const UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        controller: descController,
                        maxLines: 26,
                        decoration: const InputDecoration(
                          hintText: 'Write Something to your Mind...',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Color(0xff919191),
                          ),
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const Divider(thickness: 3),
                    Text(
                      'Date:- $formattedDate',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color(0xff919191),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
