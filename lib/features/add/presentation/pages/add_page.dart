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

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final ValueNotifier<bool> _isValidNotifier = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();

  String? _serverError;
  int? selectPriceIndex;
  int? selectPropertyTypeIndex;

  @override
  void dispose() {
    _isValidNotifier.dispose();
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
    ).paddingOnly(
      left: 24,
      right: 24,
      top: 48,
      bottom: 24,
    );
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
    return PropertyFormScreen().paddingOnly(left: 24, right: 24, top: 32);
  }

  Widget _buildMenu4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'To\'rtinchi Menu',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bu oxirgi sahifa. Bu yerda jarayon tugaydi va natija ko\'rsatiladi.',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Muvaffaqiyatli yakunlandi!',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green.shade700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Barcha ma\'lumotlar saqlandi va jarayon tugallandi.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
