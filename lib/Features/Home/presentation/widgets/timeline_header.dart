import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/Features/Home/presentation/widgets/add_memory_sheet.dart';
import 'package:template/core/presentation/managers/color_manager.dart';

class TimelineHeader extends StatelessWidget {
  const TimelineHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Timeline",
            style: TextStyle(
              fontSize: 30,
              color: AppColors.black,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Form(
                  child: TextFormField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      filled: true,
                      hintStyle: const TextStyle(color: Color(0xFF757575)),
                      fillColor: const Color(0xFF979797).withOpacity(0.1),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search...",
                      prefixIcon: const Icon(CupertinoIcons.search),
                    ),
                  ),
                ),
              ),
              // Add icon for adding new post
              const SizedBox(width: 10),
              InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return AddMemorySheet(
                          // onCarAdded: (vehicule) {
                          // ref.read(vehiculesProvider.notifier).state =
                          //     [
                          //   ...ref.read(vehiculesProvider),
                          //   vehicule,
                          // ];

                          // Logger().i(ref.read(vehiculesProvider));

                          // Navigator.pop(context);
                          // },
                          );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFF979797).withOpacity(0.1),
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    CupertinoIcons.add,
                    color: AppColors.grayLevel2,
                    size: 24,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
