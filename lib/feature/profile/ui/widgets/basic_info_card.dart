import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/feature/profile/ui/widgets/basic_info_row.dart';

class BasicInfoCard extends StatelessWidget {
  final List<BasicInfoRow> infos;
  const BasicInfoCard({super.key, required this.infos});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: const Color(0xff919191).withOpacity(0.20),
        ),
      ),
      child: Column(
        children: List.generate(
          infos.length * 2 - 1,
              (i) => i.isEven
              ? infos[i ~/ 2]
              : Divider(
            color: const Color(0xff919191).withOpacity(0.20),
          ),
        ),
      ),
    );
  }
}