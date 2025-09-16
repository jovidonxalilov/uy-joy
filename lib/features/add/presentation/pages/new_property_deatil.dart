import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uyjoy/config/theme/app_colors.dart';
import 'package:uyjoy/core/constants/app_assets.dart';
import 'package:uyjoy/core/extensions/widget_extension.dart';
import 'package:uyjoy/core/widgets/app_image.dart';
import 'package:uyjoy/core/widgets/app_text.dart';
import 'package:uyjoy/core/widgets/w__container.dart';
import 'package:uyjoy/core/widgets/w_text_form.dart';
import 'package:uyjoy/core/widgets/w_validator.dart';

class PropertyFormScreen extends StatefulWidget {
  const PropertyFormScreen({Key? key}) : super(key: key);

  @override
  State<PropertyFormScreen> createState() => _PropertyFormScreenState();
}

class _PropertyFormScreenState extends State<PropertyFormScreen> {
  // Text Controllers
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

  // 🔥 State variables with ValueNotifier
  final ValueNotifier<int> selectedStudio = ValueNotifier<int>(0);
  final ValueNotifier<int> selectedBathrooms = ValueNotifier<int>(1);
  final ValueNotifier<String> selectedFurnishingStatus = ValueNotifier<String>(
    "Furnished",
  );
  final ValueNotifier<String> selectedRentalFrequency = ValueNotifier<String>(
    "Yearly",
  );
  final ValueNotifier<String> selectedCurrency = ValueNotifier<String>("USD");
  final ValueNotifier<List<String>> selectedAmenities =
      ValueNotifier<List<String>>([]);

  // Amenities list
  final List<Map<String, dynamic>> amenitiesList = [
    {"name": "Hospital, clinic", "selected": false},
    {"name": "Entertainment facilities", "selected": false},
    {"name": "Kindergarten", "selected": false},
    {"name": "Restaurant, facilities", "selected": false},
    {"name": "Resort, farmhouse", "selected": false},
    {"name": "Shops, shopping mall", "selected": false},
    {"name": "Supermarket, shops", "selected": false},
    {"name": "Park, green area", "selected": false},
    {"name": "School", "selected": false},
    {"name": "Playground", "selected": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Number of rooms
        _buildSectionTitle("Title", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: propertyTitleController,
          richText: true,
          hintText: "Enter Property Title",
          keyboardType: TextInputType.text,
          validator: (value) {
            return SimpleValidators.validateText(value, minLength: 10);
          },
        ),
        SizedBox(height: 20.h),
        _buildSectionTitle("Description", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: descriptionController,
          richText: true,
          validator: (value) {
            return SimpleValidators.validateText(value, minLength: 50);
          },
          hintText: "Enter Property Description",
          maxLines: 3,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 20.h),
        _buildSectionTitle("Number of rooms", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: numberOfRoomsController,
          richText: true,
          hintText: "Enter number of rooms",
          keyboardType: TextInputType.number,
          // validator: (value) {
          //   return SimpleValidators.validateText(value, minLength: 10);
          // },
        ),
        SizedBox(height: 8.h),
        ValueListenableBuilder<int>(
          valueListenable: selectedStudio,
          builder: (context, value, _) {
            return _buildNumberSelector(
              controller: numberOfRoomsController,
              selectedValue: value,
              maxValue: 5,
              onChanged: (v) => selectedStudio.value = v,
            );
          },
        ),
        SizedBox(height: 20.h),

        // Number of bathrooms
        _buildSectionTitle("Number of bathrooms", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: numberOfBathroomsController,
          hintText: "Enter number of bathrooms",
          validator: (value) {
            return SimpleValidators.numberInRange(value, min: 1, max: 15);
          },
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 8.h),
        ValueListenableBuilder<int>(
          valueListenable: selectedBathrooms,
          builder: (context, value, _) {
            return _buildNumberSelector(
              showStudio: false,
              controller: numberOfBathroomsController,
              selectedValue: value,
              maxValue: 3,
              onChanged: (v) => selectedBathrooms.value = v,
            );
          },
        ),
        SizedBox(height: 20.h),

        // Area
        _buildSectionTitle("Area m²", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: areaController,
          hintText: "e.g. 150 m²",
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20.h),

        // Floor
        _buildSectionTitle("Floor", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: floorController,
          hintText: "e.g. 5",
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20.h),

        // Total floors
        _buildSectionTitle("Enter total residential floors", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: totalFloorsController,
          hintText: "e.g., 4",
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20.h),

        // Furnishing Status
        _buildSectionTitle("Furnishing Status", isRequired: true),
        SizedBox(height: 8.h),
        ValueListenableBuilder<String>(
          valueListenable: selectedFurnishingStatus,
          builder: (context, value, _) {
            return buildSelectableContainerGroup(
              options: ["Furnished", "Unfurnished"],
              selectedValues: value,
              onChanged: (v) => selectedFurnishingStatus.value = v,
            );
          },
        ),
        SizedBox(height: 20.h),

        // Location
        _buildSectionTitle("Location", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: floorController,
          hintText: "e.g., Downtown Manhattan, NYC",
          keyboardType: TextInputType.number,
          richText: true,
        ),
        SizedBox(height: 20.h),

        // Located nearby
        _buildSectionTitle("Located nearby"),
        SizedBox(height: 12.h),
        ValueListenableBuilder<List<String>>(
          valueListenable: selectedAmenities,
          builder: (context, value, _) {
            return _buildAmenitiesGrid(value);
          },
        ),
        SizedBox(height: 20.h),

        // Rental Frequency
        _buildSectionTitle("Rental Frequency", isRequired: true),
        SizedBox(height: 8.h),
        ValueListenableBuilder<String>(
          valueListenable: selectedRentalFrequency,
          builder: (context, value, _) {
            return buildSelectableContainerGroup(
              options: ["Yearly", "Monthly", "Weekly", "Daily"],
              selectedValues: value,
              onChanged: (v) => selectedRentalFrequency.value = v,
              // isHorizontal: true,
            );
          },
        ),
        SizedBox(height: 20.h),

        // Currency
        _buildSectionTitle("Currency"),
        SizedBox(height: 8.h),
        ValueListenableBuilder<String>(
          valueListenable: selectedCurrency,
          builder: (context, value, _) {
            return buildSelectableContainerGroup(
              options: ["USD", "UZS"],
              selectedValues: value,
              isExpanded: false,
              onChanged: (v) => selectedCurrency.value = v,
            );
          },
        ),
        SizedBox(height: 20.h),

        // Price
        _buildSectionTitle("Price", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: priceController,
          hintText: "2 300",
          suffixWidget: ContainerW(
            width: 104.w,
            height: 36.h,
            radius: 8,
            color: AppColors.base.withOpacity(0.2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage(path: AppAssets.flash),
                AppText(text: "Price Ai", fontSize: 14, fontWeight: 500),
              ],
            ),
          ).paddingOnly(top: 4, right: 4, bottom: 4),
        ),
      ],
    );
  }

  Widget _buildAmenitiesGrid(List<String> currentSelected) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
      ),
      itemCount: amenitiesList.length,
      itemBuilder: (context, index) {
        final amenity = amenitiesList[index];
        final isSelected = currentSelected.contains(amenity["name"]);
        return GestureDetector(
          onTap: () {
            if (isSelected) {
              currentSelected.remove(amenity["name"]);
            } else {
              currentSelected.add(amenity["name"]);
            }
            selectedAmenities.value = List.from(currentSelected);
          },
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  // shape: BoxShape,
                  color: isSelected ? AppColors.base : AppColors.white,
                  border: Border.all(
                    color: isSelected ? AppColors.base : AppColors.skyBase,
                  ),
                ),
                child: isSelected
                    ? const AppImage(path: AppAssets.check, size: 15)
                    : null,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: AppText(
                  text: amenity["name"],
                  maxLines: 3,
                  fontWeight: 400,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          // child: Container(
          //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //   decoration: BoxDecoration(
          //     color: isSelected ? Colors.purple.withOpacity(0.1) : Colors.white,
          //     borderRadius: BorderRadius.circular(8),
          //     border: Border.all(
          //       color: isSelected ? Colors.purple : Colors.grey[300]!,
          //     ),
          //   ),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 16.w,
          //         height: 16.h,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: isSelected ? Colors.purple : Colors.white,
          //           border: Border.all(
          //             color: isSelected ? Colors.purple : Colors.grey[400]!,
          //           ),
          //         ),
          //         child: isSelected
          //             ? const Icon(Icons.check, color: Colors.white, size: 12)
          //             : null,
          //       ),
          //       SizedBox(width: 8.w),
          //       Expanded(
          //         child: Text(
          //           amenity["name"],
          //           style: TextStyle(
          //             fontSize: 12,
          //             color: isSelected ? Colors.purple : Colors.black,
          //           ),
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }

  Widget _buildSectionTitle(
    String title, {
    String? subtitle,
    bool isRequired = false,
  }) {
    return AppText(
      text: title,
      fontSize: 16,
      fontWeight: 600,
      color: AppColors.textC,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    TextInputType? keyboardType,
    bool richText = false,
    Widget? suffixWidget,
    String? Function(String?)? validator,
  }) {
    return WTextField(
      suffixIconWidget: suffixWidget,
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      keyboardType: keyboardType,
      hintText: hintText,
      richText: richText,
      hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
      borderRadius: 12,
      // filled: true,
      fillColor: AppColors.bg,
      borderColor: AppColors.bgLight,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    );
  }

  Widget _buildNumberSelector({
    required int selectedValue,
    required int maxValue,
    required Function(int) onChanged,
    required TextEditingController controller,
    bool showStudio = true,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(showStudio ? maxValue + 1 : maxValue, (index) {
          final value = showStudio ? index : index + 1;
          final label = (showStudio && index == 0)
              ? "Studio"
              : value.toString();

          return GestureDetector(
            onTap: () {
              onChanged(value);
              controller.text = label;
            },
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.bgLight),
                color: selectedValue == value
                    ? AppColors.base.withOpacity(0.2)
                    : AppColors.white,
              ),
              margin: const EdgeInsets.only(right: 8),
              child: Center(
                child: AppText(
                  text: label,
                  fontWeight: 400,
                  fontSize: 14,
                  color: selectedValue == value
                      ? AppColors.base
                      : AppColors.black,
                ),
              ).paddingOnly(top: 8, left: 16, right: 16, bottom: 8),
            ),
          );
        }),
      ),
    );
  }

  Widget buildSelectableContainerGroup({
    required List<String> options,
    required String selectedValues,
    required Function(String) onChanged,
    bool isExpanded = true,
  }) {
    if (isExpanded) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: options.map((option) {
            final isSelected = selectedValues.contains(option);
            return GestureDetector(
              onTap: () => onChanged(option),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.base.withOpacity(0.2)
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.bgLight),
                ),
                // radius: 8,
                child: Center(
                  child: AppText(
                    text: option,
                    fontSize: 14,
                    fontWeight: 400,
                    color: isSelected ? AppColors.base : AppColors.black,
                  ),
                ).paddingOnly(left: 16, top: 8, right: 16, bottom: 8),
              ),
            );
          }).toList(),
        ),
      );
    }
    return Row(
      children: options.map((option) {
        final isSelected = selectedValues.contains(option);
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(option),
            child: Container(
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.base.withOpacity(0.2)
                    : AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.bgLight),
              ),
              // radius: 8,
              child: Center(
                child: AppText(
                  text: option,
                  fontSize: 14,
                  fontWeight: 400,
                  color: isSelected ? AppColors.base : AppColors.black,
                ),
              ).paddingOnly(left: 16, top: 8, right: 16, bottom: 8),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _submitForm() {
    // Form validation va submit logic
    print("Property Title: ${propertyTitleController.text}");
    print("Description: ${descriptionController.text}");
    print("Number of Rooms: ${numberOfRoomsController.text}");
    print("Studio: $selectedStudio");
    print("Number of Bathrooms: ${numberOfBathroomsController.text}");
    print("Selected Bathrooms: $selectedBathrooms");
    print("Area: ${areaController.text}");
    print("Floor: ${floorController.text}");
    print("Total Floors: ${totalFloorsController.text}");
    print("Furnishing Status: $selectedFurnishingStatus");
    print("Location: ${locationController.text}");
    print("Rental Frequency: $selectedRentalFrequency");
    print("Currency: $selectedCurrency");
    print("Price: ${priceController.text}");
    print("Selected Amenities: $selectedAmenities");

    // Success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Property submitted successfully!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    propertyTitleController.dispose();
    descriptionController.dispose();
    numberOfRoomsController.dispose();
    numberOfBathroomsController.dispose();
    areaController.dispose();
    floorController.dispose();
    totalFloorsController.dispose();
    locationController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
