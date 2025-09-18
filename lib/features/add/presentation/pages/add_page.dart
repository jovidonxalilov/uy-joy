import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uyjoy/config/theme/app_colors.dart';
import 'package:uyjoy/core/constants/app_assets.dart';
import 'package:uyjoy/core/extensions/widget_extension.dart';
import 'package:uyjoy/core/widgets/app_image.dart';
import 'package:uyjoy/core/widgets/app_text.dart';
import 'package:uyjoy/core/widgets/w__container.dart';
import 'package:uyjoy/core/widgets/w_custom_app_bar.dart';
import 'package:uyjoy/core/widgets/w_text_form.dart';
import 'package:uyjoy/features/add/presentation/pages/new_property_deatil.dart';
import 'package:uyjoy/features/add/presentation/pages/upload_image_widget.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

// class _AddPageState extends State<AddPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   // Controllers
//   final propertyTitleController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final numberOfRoomsController = TextEditingController();
//   final numberOfBathroomsController = TextEditingController();
//   final areaController = TextEditingController();
//   final floorController = TextEditingController();
//   final totalFloorsController = TextEditingController();
//   final locationController = TextEditingController();
//   final priceController = TextEditingController();
//
//   // Notifiers
//   final currentIndex = ValueNotifier<int>(0);
//   final selectedImagesNotifier = ValueNotifier<List<File>>([]);
//   final selectedFurnishingStatus = ValueNotifier<String>("Furnished");
//   final selectedRentalFrequency = ValueNotifier<String>("Yearly");
//   final isValidNotifier = ValueNotifier<bool>(false);
//
//   int? selectPriceIndex;
//   int? selectPropertyTypeIndex;
//
//   final tabTitles = ['Step 1', 'Menu 2', 'Menu 3', 'Menu 4'];
//
//   @override
//   void dispose() {
//     propertyTitleController.dispose();
//     descriptionController.dispose();
//     numberOfRoomsController.dispose();
//     numberOfBathroomsController.dispose();
//     areaController.dispose();
//     floorController.dispose();
//     totalFloorsController.dispose();
//     locationController.dispose();
//     priceController.dispose();
//     currentIndex.dispose();
//     selectedImagesNotifier.dispose();
//     selectedFurnishingStatus.dispose();
//     selectedRentalFrequency.dispose();
//     isValidNotifier.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: WCustomAppBar(
//         title: AppText(text: "Add Listing", fontWeight: 700, fontSize: 32),
//         centerTitle: false,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             /// Tabs
//             ValueListenableBuilder<int>(
//               valueListenable: currentIndex,
//               builder: (_, index, __) {
//                 return Row(
//                   children: tabTitles.asMap().entries.map((entry) {
//                     final isActive = index == entry.key;
//                     return Expanded(
//                       child: GestureDetector(
//                         onTap: () => currentIndex.value = entry.key,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(color: AppColors.grey200),
//                               bottom: BorderSide(
//                                 color: (isActive || entry.key < index)
//                                     ? AppColors.base
//                                     : Colors.transparent,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                           child: AppText(
//                             text: entry.value,
//                             textAlign: TextAlign.center,
//                             fontSize: 16,
//                             fontWeight: 400,
//                             color: (isActive || entry.key < index)
//                                 ? AppColors.base
//                                 : AppColors.light,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//
//             /// Content
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   onChanged: _validateRequiredFields,
//                   child: ValueListenableBuilder<int>(
//                     valueListenable: currentIndex,
//                     builder: (_, index, __) => _buildContent(index),
//                   ),
//                 ),
//               ),
//             ),
//
//             /// Bottom Buttons
//             ValueListenableBuilder<int>(
//               valueListenable: currentIndex,
//               builder: (_, index, __) {
//                 return ContainerW(
//                   color: AppColors.white,
//                   radius: 0,
//                   height: 75.h,
//                   child: Row(
//                     children: [
//                       if (index > 0)
//                         ContainerW(
//                           onTap: () => currentIndex.value--,
//                           width: 100,
//                           height: 51,
//                           radius: 8,
//                           color: AppColors.grey200,
//                           child: Center(
//                             child: AppText(
//                                 text: "Back", fontWeight: 600, fontSize: 16),
//                           ),
//                         ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: WContainer(
//                           isValidNotifier: isValidNotifier,
//                           onTap: () {
//                             if (index < tabTitles.length - 1) {
//                               currentIndex.value++;
//                             } else {
//                               /// 4-chi tabdan keyin yangi step
//                               currentIndex.value++;
//                             }
//                           },
//                           radius: 8,
//                           height: 51,
//                           color: AppColors.base,
//                           text: "Next",
//                           textColor: AppColors.white,
//                         ),
//                       ),
//                     ],
//                   ).paddingAll(12),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContent(int index) {
//     switch (index) {
//       case 0:
//         return _buildStep1();
//       case 1:
//         return _buildMenu2();
//       case 2:
//         return _buildMenu3();
//       case 3:
//         return _buildMenu4();
//       case 4:
//         return Center(child: AppText(text: "✅ Yangi Step", fontSize: 20));
//       default:
//         return const SizedBox();
//     }
//   }
//
//   Widget _buildStep1() {
//     WidgetsBinding.instance.addPostFrameCallback(
//             (_) => isValidNotifier.value = selectPriceIndex != null);
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AppText(text: 'What type of listing is this?', fontSize: 20, fontWeight: 700),
//         SizedBox(height: 24.h),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 1,
//             mainAxisSpacing: 16.0,
//             childAspectRatio: 2,
//           ),
//           itemCount: priceType.length,
//           itemBuilder: (_, i) => GestureDetector(
//             onTap: () {
//               selectPriceIndex = i;
//               isValidNotifier.value = true;
//             },
//             child: ContainerW(
//               color: selectPriceIndex == i
//                   ? AppColors.base.withOpacity(0.2)
//                   : AppColors.white,
//               border: Border.all(
//                 color: selectPriceIndex == i
//                     ? Colors.transparent
//                     : AppColors.grey200,
//               ),
//               radius: 8,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AppImage(path: priceIcon[i], color: AppColors.base),
//                   SizedBox(height: 12.h),
//                   AppText(text: priceType[i], fontWeight: 700, fontSize: 18),
//                   AppText(text: priceDescription[i], fontSize: 14),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ).paddingAll(24);
//   }
//
//   Widget _buildMenu2() {
//     WidgetsBinding.instance.addPostFrameCallback(
//             (_) => isValidNotifier.value = selectPropertyTypeIndex != null);
//
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 24,
//         mainAxisSpacing: 16,
//         childAspectRatio: 1.5,
//       ),
//       itemCount: propertyType.length,
//       itemBuilder: (_, i) => GestureDetector(
//         onTap: () {
//           selectPropertyTypeIndex = i;
//           isValidNotifier.value = true;
//         },
//         child: ContainerW(
//           color: selectPropertyTypeIndex == i
//               ? AppColors.base.withOpacity(0.2)
//               : AppColors.white,
//           border: Border.all(
//             color: selectPropertyTypeIndex == i
//                 ? Colors.transparent
//                 : AppColors.grey200,
//           ),
//           radius: 8,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AppImage(path: propertyIcon[i], color: AppColors.base),
//               SizedBox(height: 8.h),
//               AppText(text: propertyType[i], fontSize: 14),
//             ],
//           ),
//         ),
//       ),
//     ).paddingAll(24);
//   }
//
//   Widget _buildMenu3() {
//     return ImagePickerWidget(
//       onImagesSelected: (images) => selectedImagesNotifier.value = images,
//     );
//   }
//
//   Widget _buildMenu4() {
//     return PropertyFormScreen(
//       areaController: areaController,
//       descriptionController: descriptionController,
//       floorController: floorController,
//       locationController: locationController,
//       numberOfBathroomsController: numberOfBathroomsController,
//       numberOfRoomsController: numberOfRoomsController,
//       priceController: priceController,
//       propertyTitleController: propertyTitleController,
//       totalFloorsController: totalFloorsController,
//       onChanged: _validateRequiredFields,
//     ).paddingAll(24);
//   }
//
//   void _validateRequiredFields() {
//     final isValid = PropertyFormValidator.isFormValid(
//       propertyTitle: propertyTitleController.text,
//       description: descriptionController.text,
//       numberOfRooms: numberOfRoomsController.text,
//       numberOfBathrooms: numberOfBathroomsController.text,
//       area: areaController.text,
//       location: locationController.text,
//       price: priceController.text,
//       furnishingStatus: selectedFurnishingStatus.value,
//       rentalFrequency: selectedRentalFrequency.value,
//       floor: floorController.text.isEmpty ? null : floorController.text,
//       totalFloors:
//       totalFloorsController.text.isEmpty ? null : totalFloorsController.text,
//     );
//     isValidNotifier.value = isValid;
//   }
//
//   // Mock data
//   final priceType = ['For Rent', 'For Purchase'];
//   final priceDescription = ['Monthly rental property', 'Property for purchase'];
//   final priceIcon = [AppAssets.housee, AppAssets.tag];
//   final propertyType = ['Villa', 'Appartment', 'Pent-house', 'Land'];
//   final propertyIcon = [
//     AppAssets.villa,
//     AppAssets.apartment,
//     AppAssets.pentHouse,
//     AppAssets.land,
//   ];
// }


class _AddPageState extends State<AddPage> {
  final TextEditingController propertyTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController numberOfRoomsController = TextEditingController();
  final TextEditingController numberOfBathroomsController =
  TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController totalFloorsController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final ValueNotifier<String> selectedFurnishingStatus = ValueNotifier<String>(
    "Furnished",
  );
  final ValueNotifier<String> selectedRentalFrequency = ValueNotifier<String>(
    "Yearly",
  );
  final ValueNotifier<bool> _isValidNotifier = ValueNotifier<bool>(false);

  // @override
  // void initState() {
  //   super.initState();
  //   // ValueNotifier'larga listener qo'shish
  //   selectedFurnishingStatus.addListener(_validateRequiredFields);
  //   selectedRentalFrequency.addListener(_validateRequiredFields);
  // }
  final _formKey = GlobalKey<FormState>();

  String? _serverError;
  int? selectPriceIndex;
  int? selectPropertyTypeIndex;
  final ValueNotifier<List<File>> selectedImagesNotifier =
  ValueNotifier<List<File>>([]);

  @override
  void dispose() {
    _isValidNotifier.dispose();
    selectedImagesNotifier.dispose();
    propertyTitleController.dispose();
    descriptionController.dispose();
    numberOfRoomsController.dispose();
    numberOfBathroomsController.dispose();
    areaController.dispose();
    floorController.dispose();
    totalFloorsController.dispose();
    locationController.dispose();
    priceController.dispose();
    selectedFurnishingStatus.dispose();
    selectedRentalFrequency.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  final List<String> tabTitles = ['Step 1', 'Menu 2', 'Menu 3', 'Menu 4'];

  void goToNext() {
    if (currentIndex < tabTitles.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void goToPrevious() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void goToTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WCustomAppBar(
        title: AppText(text: "Add Listing", fontWeight: 700, fontSize: 32),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Row(
                children: tabTitles.asMap().entries.map((entry) {
                  int index = entry.key;
                  String title = entry.value;
                  bool isActive = currentIndex == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => goToTab(index),
                      child: Container(
                        // height: 48,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColors.grey200),
                            bottom: BorderSide(
                              color: (isActive || index < currentIndex)
                                  ? AppColors.base
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: AppText(
                          text: title,
                          textAlign: TextAlign.center,
                          fontSize: 16,
                          fontWeight: 400,
                          color: (isActive || index < currentIndex)
                              ? AppColors.base
                              : AppColors.light,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: () {
                    if (_serverError != null) {
                      setState(() => _serverError = null);
                    }
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _isValidNotifier.value =
                          _formKey.currentState?.validate() ?? false;
                    });
                  },
                  child: _buildContent(),
                ),
              ),
            ),
            ContainerW(
              color: AppColors.white,
              radius: 0,
              height: 75.h,
              // border: Border.all(color: AppColors.grey200),
              child: Row(
                children: [
                  if (currentIndex > 0) ...[
                    ContainerW(
                      // isValidNotifier: _isValidNotifier,
                      onTap: goToPrevious,
                      width: 100,
                      height: 51,
                      radius: 8,
                      color: AppColors.grey200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(text: "Back", fontWeight: 600, fontSize: 16),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                  Expanded(
                    child: currentIndex < tabTitles.length - 1
                        ? WContainer(
                      isValidNotifier: _isValidNotifier,
                      onTap: goToNext,
                      radius: 8,
                      width: double.infinity,
                      height: 51,
                      color: AppColors.base,
                      text: "Next",
                      textColor: AppColors.white,
                    )
                        : SizedBox.shrink(),
                  ),
                ],
              ).paddingOnly(top: 12, left: 24, right: 24, bottom: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (currentIndex) {
      case 0:
        return _buildStep1();
      case 1:
        return _buildMenu2();
      case 2:
        return _buildMenu3();
      case 3:
        return _buildMenu4();
      default:
        return Container();
    }
  }

  final List<String> priceType = ['For Rent', 'For Purchase'];
  final List<String> priceDescription = [
    'Monthly rental property',
    'Property for purchase',
  ];
  final List<String> priceIcon = [AppAssets.housee, AppAssets.tag];

  Widget _buildStep1() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isValidNotifier.value = selectPriceIndex != null;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'What type of listing is this?',
          fontSize: 20,
          fontWeight: 700,
        ),
        SizedBox(height: 24.h),
        SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              // crossAxisSpacing: 24.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 2,
            ),
            itemCount: priceType.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectPriceIndex = index;
                  });
                  _isValidNotifier.value = true;
                },
                child: ContainerW(
                  color: selectPriceIndex == index
                      ? AppColors.base.withOpacity(0.2)
                      : AppColors.white,
                  border: Border.all(
                    color: selectPriceIndex == index
                        ? Colors.transparent
                        : AppColors.grey200,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF141414).withOpacity(0.08),
                      offset: Offset(0, 0),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0xFF141414).withOpacity(0.04),
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                  ],
                  radius: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppImage(
                        path: priceIcon[index],
                        color: selectPriceIndex == index
                            ? AppColors.base
                            : AppColors.base,
                      ),
                      SizedBox(height: 12.h),
                      AppText(
                        color: selectPriceIndex == index
                            ? AppColors.base
                            : AppColors.blackT,
                        text: priceType[index],
                        fontWeight: 700,
                        fontSize: 18,
                      ),
                      AppText(
                        color: selectPriceIndex == index
                            ? AppColors.base
                            : AppColors.textLight,
                        text: priceDescription[index],
                        fontWeight: 400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ).paddingOnly(left: 24, right: 24, top: 48, bottom: 24);
  }

  final List<String> propertyType = [
    'Villa',
    'Appartment',
    'Pent-house',
    'Land',
  ];
  final List<String> propertyIcon = [
    AppAssets.villa,
    AppAssets.apartment,
    AppAssets.pentHouse,
    AppAssets.land,
  ];

  Widget _buildMenu2() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isValidNotifier.value = selectPropertyTypeIndex != null;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'What type of listing is this?',
          fontSize: 20,
          fontWeight: 700,
        ),
        SizedBox(height: 24.h),
        Container(
          height: 300,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.5,
            ),
            itemCount: propertyType.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectPropertyTypeIndex = index;
                  });
                  // Keyingi tugmasini faollashtirish
                  _isValidNotifier.value = true;
                },
                child: ContainerW(
                  // ... qolgan kod bir xil
                  color: selectPropertyTypeIndex == index
                      ? AppColors.base.withOpacity(0.2)
                      : AppColors.white,
                  border: Border.all(
                    color: selectPropertyTypeIndex == index
                        ? Colors.transparent
                        : AppColors.grey200,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF141414).withOpacity(0.08),
                      offset: Offset(0, 0),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0xFF141414).withOpacity(0.04),
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                  ],
                  radius: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppImage(
                        path: propertyIcon[index],
                        color: selectPropertyTypeIndex == index
                            ? AppColors.base
                            : AppColors.blackT,
                      ),
                      SizedBox(height: 8.h),
                      AppText(
                        color: selectPropertyTypeIndex == index
                            ? AppColors.base
                            : AppColors.blackT,
                        text: propertyType[index],
                        fontWeight: 400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ).paddingOnly(left: 24, right: 24, top: 48, bottom: 24);
  }

  Widget _buildMenu3() {
    return ImagePickerWidget(
      onImagesSelected: (List<File> images) {
        selectedImagesNotifier.value = images; // Rasmlarni saqlaymiz
        print('Tanlangan rasmlar soni: ${images.length}');
      },
    );
  }

  Widget _buildMenu4() {
    return PropertyFormScreen(
      areaController: areaController,
      descriptionController: descriptionController,
      floorController: floorController,
      locationController: locationController,
      numberOfBathroomsController: numberOfBathroomsController,
      numberOfRoomsController: numberOfRoomsController,
      priceController: priceController,
      propertyTitleController: propertyTitleController,
      totalFloorsController: totalFloorsController,
      onChanged: _validateRequiredFields,
    ).paddingOnly(left: 24, right: 24, top: 32);
  }

  void _validateRequiredFields() {
    bool isValid = PropertyFormValidator.isFormValid(
      propertyTitle: propertyTitleController.text,
      description: descriptionController.text,
      numberOfRooms: numberOfRoomsController.text,
      numberOfBathrooms: numberOfBathroomsController.text,
      area: areaController.text,
      location: locationController.text,
      price: priceController.text,
      furnishingStatus: selectedFurnishingStatus.value,
      rentalFrequency: selectedRentalFrequency.value,
      floor: floorController.text.isEmpty ? null : floorController.text,
      totalFloors: totalFloorsController.text.isEmpty
          ? null
          : totalFloorsController.text,
    );
    _isValidNotifier.value = isValid;
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade700)),
          Text(value, style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
