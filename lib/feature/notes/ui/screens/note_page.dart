import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/feature/home/ui/screens/bottom_navbar_base_screen.dart';
import 'package:intricate1/feature/notes/data/controller/note_controller.dart';
import 'package:intricate1/feature/notes/ui/screens/note_history_page.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key});

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final NoteController noteController = Get.put(NoteController());



  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    final now = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy, HH:mm').format(now);

    return CustomBackground(
      child: BaseScreen(
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
                            const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Color(0xffFCFCFC),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 22.sp,
                                color: const Color(0xffFCFCFC),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(() {
                        return InkWell(
                          onTap: noteController.isLoading.value
                              ? null
                              : () {
                            noteController.validateAndCreateNote(
                              title: titleController.text,
                              description: descController.text,
                            );
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xffFCFCFC),
                            ),
                          ),
                        );
                      }),
        
                    ],
                  ),
                  SizedBox(height: 10.h),
              Flexible(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 0,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          controller: titleController,
                          decoration: InputDecoration(
                            hintText: 'New Title',
                            hintStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Title cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                          controller: descController,
                          maxLines: 26,
                          decoration: const InputDecoration(
                            hintText: 'Write Something to your Mind...',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xff828282),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Description cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Color(0xffFCFCFC),
                      ),
                      Text(
                        'Date:- $formattedDate',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xff828282),
                        ),
                      ),
                      SizedBox(height: 80.h),
                    ],
                  ),
                ),
              )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
