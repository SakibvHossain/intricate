import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/feature/home/ui/screens/bottom_navbar_base_screen.dart';
import 'package:intricate1/feature/notes/data/controller/note_controller.dart';

class NoteHistoryPage extends StatelessWidget {
  final noteController = Get.put(NoteController());

  NoteHistoryPage({super.key}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      noteController.fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: BaseScreen(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: RefreshIndicator(
                onRefresh: () async {
                  await noteController.fetchNotes();
                },
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
                    SizedBox(height: 16.h),
                    Expanded(
                      child: Obx(() {
                        if (noteController.isLoading.value) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (noteController.notes.isEmpty) {
                          return const Center(
                              child: Text(
                                'No notes available',
                                style: TextStyle(color: Colors.white),
                              ));
                        }

                        return GridView.builder(
                          padding: EdgeInsets.only(top: 16.h),
                          itemCount: noteController.notes.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.9,
                          ),
                          itemBuilder: (context, index) {
                            final note = noteController.notes[index];
                            final formattedDate =
                            note.createdAt != null ? '${note.createdAt.day}/${note.createdAt.month}/${note.createdAt.year}, ${note.createdAt.hour}:${note.createdAt.minute}' : "";
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(8),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      note.title,
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
                                        note.content,
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
                                  SizedBox(
                                    height:40,
                                    child: Expanded(
                                      child: Container(
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
                                        child: Center(
                                          child: Text(
                                            'Date:- $formattedDate',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xffFCFCFC),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
