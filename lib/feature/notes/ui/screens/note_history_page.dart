import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/feature/notes/data/controller/note_controller.dart';

class NoteHistoryPage extends StatelessWidget {
  final noteController = Get.put(NoteController());

  NoteHistoryPage({super.key});

  List<Map<String, dynamic>> noteHistory = [
    {
      'title': 'How to Calm Your Morning',
      'description':
          'Create a mobile app UI Kit that provides a basic notes functionality but with some improvement.',
      'date': '15/07/2021, 18:30',
    },
    {
      'title': '5-minute breathing exercise',
      'description':
          'Create a mobile app UI Kit that provides a basic notes functionality but with some improvement.',
      'date': '15/07/2021, 18:30',
    },
    {
      'title': 'List 3 things that made you smile this week.',
      'description':
          'Create a mobile app UI Kit that provides a basic notes functionality but with some improvement.',
      'date': '15/07/2021, 18:30',
    },
    {
      'title': 'Drink Water & Hydrate',
      'description':
          'Create a mobile app UI Kit that provides a basic notes functionality but with some improvement.',
      'date': '15/07/2021, 18:30',
    },
    {
      'title': 'New Product Idea Design',
      'description':
          'Create a mobile app UI Kit that provides a basic notes functionality but with some improvement.',
      'date': '15/07/2021, 18:30',
    },
    {
      'title': 'List 3 things that made you smile this week.',
      'description':
          'Create a mobile app UI Kit that provides a basic notes functionality but with some improvement.',
      'date': '15/07/2021, 18:30',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Note History',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffFCFCFC)),
                ),
                Expanded(
                  // child: Obx(
                  //   () => noteController.notes.isEmpty
                  //       ? const Center(child: Text('No notes available'))
                  //       :
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: 16.h),
                    itemCount: noteHistory.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final note = noteHistory[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(8),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        // padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                note['title'],
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffFCFCFC)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  note['description'],
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    color: const Color(0xffFCFCFC),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff7EB243),
                                        Color(0xff024015)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.r),
                                      bottomRight: Radius.circular(8.r))),
                              child: Text(
                                "Date:- ${note['date']}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffFCFCFC),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
