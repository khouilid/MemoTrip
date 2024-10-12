import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/Home/presentation/widgets/file_upload.dart';
import 'package:template/Features/splash/widgets/social_botton.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/theme/shared/font_size.dart';
import 'package:template/theme/shared/spacing.dart';

class AddMemorySheet extends StatefulHookConsumerWidget {
  const AddMemorySheet({super.key});

  @override
  ConsumerState<AddMemorySheet> createState() => _AddMemorySheetState();
}

class _AddMemorySheetState extends ConsumerState<AddMemorySheet> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final title = useTextEditingController();
    final description = useTextEditingController();
    final imageFile = useState<List<String>>([]);

    return Wrap(
      children: [
        Container(
          height: 620,
          padding: EdgeInsets.symmetric(
            vertical: Spacing.xxsmall,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Spacing.base),
              topRight: Radius.circular(Spacing.base),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(
                    top: Spacing.base,
                    bottom: Spacing.large,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: Spacing.large,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.images.sendIcon.path,
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                AppColors.chateauGreen,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'New Trip',
                              style: TextStyle(
                                fontSize: FontSize.xl,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // add singleListView for images here horizontally scrollable
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: [
                                  Container(
                                    width: 100,
                                    margin: EdgeInsets.only(right: 5),
                                    child: FileUpload(
                                      onFileSelected: (file) {
                                        imageFile.value.add(file.path);
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  ...imageFile.value
                                      .map(
                                        (e) => Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 90,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: FileImage(
                                                      File(e),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: 2,
                                                bottom: 2,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    imageFile.value.remove(e);
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              999),
                                                    ),
                                                    child: Icon(
                                                      CupertinoIcons.delete,
                                                      color: AppColors
                                                          .valentineRed,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ]),
                              ),

                              SizedBox(height: Spacing.base),
                              TextFormField(
                                controller: title,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  filled: true,
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  fillColor:
                                      const Color(0xFF979797).withOpacity(0.1),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "Name of your trip",
                                ),
                              ),
                              SizedBox(height: Spacing.base),
                              TextFormField(
                                controller: description,
                                maxLines: 6,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  filled: true,
                                  hintStyle: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  fillColor:
                                      const Color(0xFF979797).withOpacity(0.1),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "Sort summary...",
                                ),
                              ),
                              SizedBox(height: Spacing.base),
                              Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      Assets.images.map.path,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.black.withOpacity(0.4)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.pin,
                                          color: AppColors.white,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Select Location',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: Spacing.base),

                              SocalButton(
                                  textcolor: AppColors.white,
                                  press: () {},
                                  text: "Create Trip",
                                  color: AppColors.chateauGreen,
                                  icon: null),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
