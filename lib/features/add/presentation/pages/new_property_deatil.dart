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

// class PropertyFormScreen extends StatefulWidget {
//   final TextEditingController propertyTitleController;
//   final TextEditingController descriptionController;
//   final TextEditingController numberOfRoomsController;
//   final TextEditingController numberOfBathroomsController;
//   final TextEditingController areaController;
//   final TextEditingController floorController;
//   final TextEditingController totalFloorsController;
//   final TextEditingController locationController;
//   final TextEditingController priceController;
//
//   const PropertyFormScreen({
//     super.key,
//     required this.priceController,
//     required this.numberOfRoomsController,
//     required this.propertyTitleController,
//     required this.descriptionController,
//     required this.numberOfBathroomsController,
//     required this.areaController,
//     required this.floorController,
//     required this.totalFloorsController,
//     required this.locationController,
//   });
//
//   @override
//   State<PropertyFormScreen> createState() => _PropertyFormScreenState();
// }
//
// class _PropertyFormScreenState extends State<PropertyFormScreen> {
//   // Text Controllers
//
//   // 🔥 State variables with ValueNotifier
//   final ValueNotifier<int> selectedStudio = ValueNotifier<int>(0);
//   final ValueNotifier<int> selectedBathrooms = ValueNotifier<int>(1);
//   final ValueNotifier<String> selectedFurnishingStatus = ValueNotifier<String>(
//     "Furnished",
//   );
//   final ValueNotifier<String> selectedRentalFrequency = ValueNotifier<String>(
//     "Yearly",
//   );
//   final ValueNotifier<String> selectedCurrency = ValueNotifier<String>("USD");
//   final ValueNotifier<List<String>> selectedAmenities =
//       ValueNotifier<List<String>>([]);
//
//   // Amenities list
//   final List<Map<String, dynamic>> amenitiesList = [
//     {"name": "Hospital, clinic", "selected": false},
//     {"name": "Entertainment facilities", "selected": false},
//     {"name": "Kindergarten", "selected": false},
//     {"name": "Restaurant, facilities", "selected": false},
//     {"name": "Resort, farmhouse", "selected": false},
//     {"name": "Shops, shopping mall", "selected": false},
//     {"name": "Supermarket, shops", "selected": false},
//     {"name": "Park, green area", "selected": false},
//     {"name": "School", "selected": false},
//     {"name": "Playground", "selected": false},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Number of rooms
//         _buildSectionTitle("Title", isRequired: true),
//         SizedBox(height: 8.h),
//         _buildTextField(
//           controller: widget.propertyTitleController,
//           richText: true,
//           hintText: "Enter Property Title",
//           keyboardType: TextInputType.text,
//           validator: (value) {
//             return SimpleValidators.validateText(value, minLength: 10);
//           },
//         ),
//         SizedBox(height: 20.h),
//         _buildSectionTitle("Description", isRequired: true),
//         SizedBox(height: 8.h),
//         _buildTextField(
//           controller: widget.descriptionController,
//           richText: true,
//           validator: (value) {
//             return SimpleValidators.validateText(value, minLength: 50);
//           },
//           hintText: "Enter Property Description",
//           maxLines: 3,
//           keyboardType: TextInputType.text,
//         ),
//         SizedBox(height: 20.h),
//         _buildSectionTitle("Number of rooms", isRequired: true),
//         SizedBox(height: 8.h),
//         _buildTextField(
//           controller: widget.numberOfRoomsController,
//           richText: true,
//           hintText: "Enter number of rooms",
//           keyboardType: TextInputType.number,
//           // validator: (value) {
//           //   return SimpleValidators.validateText(value, minLength: 10);
//           // },
//         ),
//         SizedBox(height: 8.h),
//         ValueListenableBuilder<int>(
//           valueListenable: selectedStudio,
//           builder: (context, value, _) {
//             return _buildNumberSelector(
//               controller: widget.numberOfRoomsController,
//               selectedValue: value,
//               maxValue: 5,
//               onChanged: (v) => selectedStudio.value = v,
//             );
//           },
//         ),
//         SizedBox(height: 20.h),
//
//         // Number of bathrooms
//         _buildSectionTitle("Number of bathrooms", isRequired: true),
//         SizedBox(height: 8.h),
//         _buildTextField(
//           controller: widget.numberOfBathroomsController,
//           hintText: "Enter number of bathrooms",
//           validator: (value) {
//             return SimpleValidators.numberInRange(value, min: 1, max: 15);
//           },
//           keyboardType: TextInputType.number,
//         ),
//         SizedBox(height: 8.h),
//         ValueListenableBuilder<int>(
//           valueListenable: selectedBathrooms,
//           builder: (context, value, _) {
//             return _buildNumberSelector(
//               showStudio: false,
//               controller: widget.numberOfBathroomsController,
//               selectedValue: value,
//               maxValue: 3,
//               onChanged: (v) => selectedBathrooms.value = v,
//             );
//           },
//         ),
//         SizedBox(height: 20.h),
//
//         // Area
//         _buildSectionTitle("Area m²", isRequired: true),
//         SizedBox(height: 8.h),
//         _buildTextField(
//           controller: widget.areaController,
//           hintText: "e.g. 150 m²",
//           keyboardType: TextInputType.number,
//         ),
//         SizedBox(height: 20.h),
//
//         // Floor
//         _buildSectionTitle("Floor", isRequired: true),
//         SizedBox(height: 8.h),
//         _buildTextField(
//           controller: widget.floorController,
//           hintText: "e.g. 5",
//           keyboardType: TextInputType.number,
//         ),
//         SizedBox(height: 20.h),
//
//         // Total floors
//         _buildSectionTitle("Enter total residential floors", isRequired: true),
//         SizedBox(height: 8.h),
//         _buildTextField(
//           controller: widget.totalFloorsController,
//           hintText: "e.g., 4",
//           keyboardType: TextInputType.number,
//         ),
//         SizedBox(height: 20.h),
//
//         // Furnishing Status
//         _buildSectionTitle("Furnishing Status", isRequired: true),
//         SizedBox(height: 8.h),
//         ValueListenableBuilder<String>(
//           valueListenable: selectedFurnishingStatus,
//           builder: (context, value, _) {
//             return buildSelectableContainerGroup(
//               options: ["Furnished", "Unfurnished"],
//               selectedValues: value,
//               onChanged: (v) => selectedFurnishingStatus.value = v,
//             );
//           },
//         ),
//         SizedBox(height: 20.h),
//
//         // Location
//         _buildSectionTitle("Location", isRequired: true),
//         SizedBox(height: 8.h),
//         _buildTextField(
//           controller: widget.floorController,
//           hintText: "e.g., Downtown Manhattan, NYC",
//           keyboardType: TextInputType.number,
//           richText: true,
//         ),
//         SizedBox(height: 20.h),
//
//         // Located nearby
//         _buildSectionTitle("Located nearby"),
//         SizedBox(height: 12.h),
//         ValueListenableBuilder<List<String>>(
//           valueListenable: selectedAmenities,
//           builder: (context, value, _) {
//             return _buildAmenitiesGrid(value);
//           },
//         ),
//         SizedBox(height: 20.h),
//
//         // Rental Frequency
//         _buildSectionTitle("Rental Frequency", isRequired: true),
//         SizedBox(height: 8.h),
//         ValueListenableBuilder<String>(
//           valueListenable: selectedRentalFrequency,
//           builder: (context, value, _) {
//             return buildSelectableContainerGroup(
//               options: ["Yearly", "Monthly", "Weekly", "Daily"],
//               selectedValues: value,
//               onChanged: (v) => selectedRentalFrequency.value = v,
//               // isHorizontal: true,
//             );
//           },
//         ),
//         SizedBox(height: 20.h),
//
//         // Currency
//         _buildSectionTitle("Currency"),
//         SizedBox(height: 8.h),
//         ValueListenableBuilder<String>(
//           valueListenable: selectedCurrency,
//           builder: (context, value, _) {
//             return buildSelectableContainerGroup(
//               options: ["USD", "UZS"],
//               selectedValues: value,
//               isExpanded: false,
//               onChanged: (v) => selectedCurrency.value = v,
//             );
//           },
//         ),
//         SizedBox(height: 20.h),
//
//         // Price
//         _buildSectionTitle("Price", isRequired: true),
//         SizedBox(height: 8.h),
//         _buildTextField(
//           controller: widget.priceController,
//           hintText: "2 300",
//           suffixWidget: ContainerW(
//             width: 104.w,
//             height: 36.h,
//             radius: 8,
//             color: AppColors.base.withOpacity(0.2),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AppImage(path: AppAssets.flash),
//                 AppText(text: "Price Ai", fontSize: 14, fontWeight: 500),
//               ],
//             ),
//           ).paddingOnly(top: 4, right: 4, bottom: 4),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildAmenitiesGrid(List<String> currentSelected) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3.5,
//         crossAxisSpacing: 8.w,
//         mainAxisSpacing: 8.h,
//       ),
//       itemCount: amenitiesList.length,
//       itemBuilder: (context, index) {
//         final amenity = amenitiesList[index];
//         final isSelected = currentSelected.contains(amenity["name"]);
//         return GestureDetector(
//           onTap: () {
//             if (isSelected) {
//               currentSelected.remove(amenity["name"]);
//             } else {
//               currentSelected.add(amenity["name"]);
//             }
//             selectedAmenities.value = List.from(currentSelected);
//           },
//           child: Row(
//             children: [
//               Container(
//                 width: 24.w,
//                 height: 24.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4),
//                   // shape: BoxShape,
//                   color: isSelected ? AppColors.base : AppColors.white,
//                   border: Border.all(
//                     color: isSelected ? AppColors.base : AppColors.skyBase,
//                   ),
//                 ),
//                 child: isSelected
//                     ? const AppImage(path: AppAssets.check, size: 15)
//                     : null,
//               ),
//               SizedBox(width: 8.w),
//               Expanded(
//                 child: AppText(
//                   text: amenity["name"],
//                   maxLines: 3,
//                   fontWeight: 400,
//                   fontSize: 16,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//           // child: Container(
//           //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
//           //   decoration: BoxDecoration(
//           //     color: isSelected ? Colors.purple.withOpacity(0.1) : Colors.white,
//           //     borderRadius: BorderRadius.circular(8),
//           //     border: Border.all(
//           //       color: isSelected ? Colors.purple : Colors.grey[300]!,
//           //     ),
//           //   ),
//           //   child: Row(
//           //     children: [
//           //       Container(
//           //         width: 16.w,
//           //         height: 16.h,
//           //         decoration: BoxDecoration(
//           //           shape: BoxShape.circle,
//           //           color: isSelected ? Colors.purple : Colors.white,
//           //           border: Border.all(
//           //             color: isSelected ? Colors.purple : Colors.grey[400]!,
//           //           ),
//           //         ),
//           //         child: isSelected
//           //             ? const Icon(Icons.check, color: Colors.white, size: 12)
//           //             : null,
//           //       ),
//           //       SizedBox(width: 8.w),
//           //       Expanded(
//           //         child: Text(
//           //           amenity["name"],
//           //           style: TextStyle(
//           //             fontSize: 12,
//           //             color: isSelected ? Colors.purple : Colors.black,
//           //           ),
//           //           overflow: TextOverflow.ellipsis,
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//         );
//       },
//     );
//   }
//
//   Widget _buildSectionTitle(String title, {String? subtitle, bool isRequired = false}) {
//     return Row(
//       children: [
//         AppText(
//           text: title,
//           fontSize: 16,
//           fontWeight: 600,
//           color: AppColors.textC,
//         ),
//         if (isRequired)
//           Text(
//             ' *',
//             style: TextStyle(color: Colors.red, fontSize: 16),
//           ),
//       ],
//     );
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     int maxLines = 1,
//     TextInputType? keyboardType,
//     bool richText = false,
//     Widget? suffixWidget,
//     String? Function(String?)? validator,
//   }) {
//     return WTextField(
//       suffixIconWidget: suffixWidget,
//       controller: controller,
//       maxLines: maxLines,
//       validator: validator,
//       keyboardType: keyboardType,
//       hintText: hintText,
//       richText: richText,
//       hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
//       borderRadius: 12,
//       // filled: true,
//       fillColor: AppColors.bg,
//       borderColor: AppColors.bgLight,
//       contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//     );
//   }
//
//   Widget _buildNumberSelector({
//     required int selectedValue,
//     required int maxValue,
//     required Function(int) onChanged,
//     required TextEditingController controller,
//     bool showStudio = true,
//   }) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(showStudio ? maxValue + 1 : maxValue, (index) {
//           final value = showStudio ? index : index + 1;
//           final label = (showStudio && index == 0)
//               ? "Studio"
//               : value.toString();
//
//           return GestureDetector(
//             onTap: () {
//               onChanged(value);
//               controller.text = label;
//             },
//             child: Container(
//               height: 36,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: AppColors.bgLight),
//                 color: selectedValue == value
//                     ? AppColors.base.withOpacity(0.2)
//                     : AppColors.white,
//               ),
//               margin: const EdgeInsets.only(right: 8),
//               child: Center(
//                 child: AppText(
//                   text: label,
//                   fontWeight: 400,
//                   fontSize: 14,
//                   color: selectedValue == value
//                       ? AppColors.base
//                       : AppColors.black,
//                 ),
//               ).paddingOnly(top: 8, left: 16, right: 16, bottom: 8),
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   Widget buildSelectableContainerGroup({
//     required List<String> options,
//     required String selectedValues,
//     required Function(String) onChanged,
//     bool isExpanded = true,
//   }) {
//     if (isExpanded) {
//       return SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: options.map((option) {
//             final isSelected = selectedValues.contains(option);
//             return GestureDetector(
//               onTap: () => onChanged(option),
//               child: Container(
//                 margin: EdgeInsets.only(right: 8.w),
//                 decoration: BoxDecoration(
//                   color: isSelected
//                       ? AppColors.base.withOpacity(0.2)
//                       : AppColors.white,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: AppColors.bgLight),
//                 ),
//                 // radius: 8,
//                 child: Center(
//                   child: AppText(
//                     text: option,
//                     fontSize: 14,
//                     fontWeight: 400,
//                     color: isSelected ? AppColors.base : AppColors.black,
//                   ),
//                 ).paddingOnly(left: 16, top: 8, right: 16, bottom: 8),
//               ),
//             );
//           }).toList(),
//         ),
//       );
//     }
//     return Row(
//       children: options.map((option) {
//         final isSelected = selectedValues.contains(option);
//         return Expanded(
//           child: GestureDetector(
//             onTap: () => onChanged(option),
//             child: Container(
//               margin: EdgeInsets.only(right: 8.w),
//               decoration: BoxDecoration(
//                 color: isSelected
//                     ? AppColors.base.withOpacity(0.2)
//                     : AppColors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: AppColors.bgLight),
//               ),
//               // radius: 8,
//               child: Center(
//                 child: AppText(
//                   text: option,
//                   fontSize: 14,
//                   fontWeight: 400,
//                   color: isSelected ? AppColors.base : AppColors.black,
//                 ),
//               ).paddingOnly(left: 16, top: 8, right: 16, bottom: 8),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
//
//   void _submitForm() {
//     // Form validation va submit logic
//     // print("Property Title: ${propertyTitleController.text}");
//     // print("Description: ${descriptionController.text}");
//     // print("Number of Rooms: ${numberOfRoomsController.text}");
//     // print("Studio: $selectedStudio");
//     // print("Number of Bathrooms: ${numberOfBathroomsController.text}");
//     // print("Selected Bathrooms: $selectedBathrooms");
//     // print("Area: ${areaController.text}");
//     // print("Floor: ${floorController.text}");
//     // print("Total Floors: ${totalFloorsController.text}");
//     // print("Furnishing Status: $selectedFurnishingStatus");
//     // print("Location: ${locationController.text}");
//     // print("Rental Frequency: $selectedRentalFrequency");
//     // print("Currency: $selectedCurrency");
//     // print("Price: ${priceController.text}");
//     // print("Selected Amenities: $selectedAmenities");
//
//     // Success message
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Property submitted successfully!"),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     widget.propertyTitleController.dispose();
//     widget.descriptionController.dispose();
//     widget.numberOfRoomsController.dispose();
//     widget.numberOfBathroomsController.dispose();
//     widget.areaController.dispose();
//     widget.floorController.dispose();
//     widget.totalFloorsController.dispose();
//     widget.locationController.dispose();
//     widget.priceController.dispose();
//     super.dispose();
//   }
// }



class PropertyFormScreen extends StatefulWidget {
  final TextEditingController propertyTitleController;
  final TextEditingController descriptionController;
  final TextEditingController numberOfRoomsController;
  final TextEditingController numberOfBathroomsController;
  final TextEditingController areaController;
  final TextEditingController floorController;
  final TextEditingController totalFloorsController;
  final TextEditingController locationController;
  final TextEditingController priceController;
  final VoidCallback? onChanged; // Validatsiya callback qo'shildi

  const PropertyFormScreen({
    super.key,
    required this.priceController,
    required this.numberOfRoomsController,
    required this.propertyTitleController,
    required this.descriptionController,
    required this.numberOfBathroomsController,
    required this.areaController,
    required this.floorController,
    required this.totalFloorsController,
    required this.locationController,
    this.onChanged, // Callback parameter
  });

  @override
  State<PropertyFormScreen> createState() => _PropertyFormScreenState();
}

class _PropertyFormScreenState extends State<PropertyFormScreen> {
  // ValueNotifier'lar
  final ValueNotifier<int> selectedStudio = ValueNotifier<int>(0);
  final ValueNotifier<int> selectedBathrooms = ValueNotifier<int>(1);
  final ValueNotifier<String> selectedFurnishingStatus = ValueNotifier<String>("Furnished");
  final ValueNotifier<String> selectedRentalFrequency = ValueNotifier<String>("Yearly");
  final ValueNotifier<String> selectedCurrency = ValueNotifier<String>("USD");
  final ValueNotifier<List<String>> selectedAmenities = ValueNotifier<List<String>>([]);

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
  void initState() {
    super.initState();
    _addListeners();
  }

  // Barcha controllerlarga listener qo'shish
  void _addListeners() {
    widget.propertyTitleController.addListener(_onFieldChanged);
    widget.descriptionController.addListener(_onFieldChanged);
    widget.numberOfRoomsController.addListener(_onFieldChanged);
    widget.numberOfBathroomsController.addListener(_onFieldChanged);
    widget.areaController.addListener(_onFieldChanged);
    widget.floorController.addListener(_onFieldChanged);
    widget.totalFloorsController.addListener(_onFieldChanged);
    widget.locationController.addListener(_onFieldChanged);
    widget.priceController.addListener(_onFieldChanged);

    // ValueNotifier'larga ham listener
    selectedFurnishingStatus.addListener(_onFieldChanged);
    selectedRentalFrequency.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    if (widget.onChanged != null) {
      widget.onChanged!();
    }
  }

  @override
  void dispose() {
    _removeListeners();
    super.dispose();
  }

  void _removeListeners() {
    widget.propertyTitleController.removeListener(_onFieldChanged);
    widget.descriptionController.removeListener(_onFieldChanged);
    widget.numberOfRoomsController.removeListener(_onFieldChanged);
    widget.numberOfBathroomsController.removeListener(_onFieldChanged);
    widget.areaController.removeListener(_onFieldChanged);
    widget.floorController.removeListener(_onFieldChanged);
    widget.totalFloorsController.removeListener(_onFieldChanged);
    widget.locationController.removeListener(_onFieldChanged);
    widget.priceController.removeListener(_onFieldChanged);

    selectedFurnishingStatus.removeListener(_onFieldChanged);
    selectedRentalFrequency.removeListener(_onFieldChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Property Title - MAJBURIY
        _buildSectionTitle("Title", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: widget.propertyTitleController,
          richText: true,
          hintText: "Enter Property Title",
          keyboardType: TextInputType.text,
          validator: (value) {
            return SimpleValidators.validateText(value, minLength: 10);
          },
        ),
        SizedBox(height: 20.h),

        // Description - MAJBURIY
        _buildSectionTitle("Description", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: widget.descriptionController,
          richText: true,
          validator: (value) {
            return SimpleValidators.validateText(value, minLength: 20);
          },
          hintText: "Enter Property Description",
          maxLines: 3,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 20.h),

        // Number of rooms - MAJBURIY
        _buildSectionTitle("Number of rooms", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: widget.numberOfRoomsController,
          richText: true,
          hintText: "Enter number of rooms",
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 8.h),
        ValueListenableBuilder<int>(
          valueListenable: selectedStudio,
          builder: (context, value, _) {
            return _buildNumberSelector(
              controller: widget.numberOfRoomsController,
              selectedValue: value,
              maxValue: 5,
              onChanged: (v) {
                selectedStudio.value = v;
                _onFieldChanged(); // Selector o'zgarishi
              },
            );
          },
        ),
        SizedBox(height: 20.h),

        // Number of bathrooms - MAJBURIY
        _buildSectionTitle("Number of bathrooms", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: widget.numberOfBathroomsController,
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
              controller: widget.numberOfBathroomsController,
              selectedValue: value,
              maxValue: 3,
              onChanged: (v) {
                selectedBathrooms.value = v;
                _onFieldChanged(); // Selector o'zgarishi
              },
            );
          },
        ),
        SizedBox(height: 20.h),

        // Area - MAJBURIY
        _buildSectionTitle("Area m²", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: widget.areaController,
          validator: (value) {
            return SimpleValidators.notEmptyIfFilled(value, errorText: "Uy maydonini kiriting");
          },
          hintText: "e.g. 150 m²",
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20.h),

        // Floor - IXTIYORIY
        _buildSectionTitle("Floor", isRequired: false),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: widget.floorController,
          hintText: "e.g. 5",
          validator: (value) {
            return SimpleValidators.notEmptyIfFilled(value, errorText: "Uy qavatini kiriting");
          },
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20.h),

        // Total floors - IXTIYORIY
        _buildSectionTitle("Enter total residential floors", isRequired: false),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: widget.totalFloorsController,
          validator: (value) {
            return SimpleValidators.notEmptyIfFilled(value, errorText: "Umumiy turar joy qavatlarini kiriting");
          },
          hintText: "e.g., 4",
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20.h),

        // Furnishing Status - MAJBURIY (ValueNotifier)
        _buildSectionTitle("Furnishing Status", isRequired: true),
        SizedBox(height: 8.h),
        FormField<String>(
          validator: (value) {
            if (selectedFurnishingStatus.value.isEmpty) {
              return "Iltimos, bittasini tanlang";
            }
            return null;
          },
          builder: (field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<String>(
                  valueListenable: selectedFurnishingStatus,
                  builder: (context, value, _) {
                    return buildSelectableContainerGroup(
                      options: ["Furnished", "Unfurnished"],
                      selectedValues: value,
                      onChanged: (v) {
                        selectedFurnishingStatus.value = v;
                        _onFieldChanged();
                        field.didChange(v); // FormField validator ishlashi uchun
                      },
                    );
                  },
                ),
                if (field.errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Text(
                      field.errorText!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            );
          },
        ),
        SizedBox(height: 20.h),

        // Location - MAJBURIY
        _buildSectionTitle("Location", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: widget.locationController, // floorController emas, locationController
          hintText: "e.g., Downtown Manhattan, NYC",
          keyboardType: TextInputType.text,
          richText: true,
          validator: (value) {
            return SimpleValidators.validateText(value, errorText: "Uy manzilini kiriting kamida 5 ta harf", minLength: 5);
          }
        ),
        SizedBox(height: 20.h),

        // Located nearby - IXTIYORIY
        _buildSectionTitle("Located nearby"),
        SizedBox(height: 12.h),
        ValueListenableBuilder<List<String>>(
          valueListenable: selectedAmenities,
          builder: (context, value, _) {
            return _buildAmenitiesGrid(value);
          },
        ),
        SizedBox(height: 20.h),

        // Rental Frequency - MAJBURIY (ValueNotifier)
        _buildSectionTitle("Rental Frequency", isRequired: true),
        SizedBox(height: 8.h),
        FormField<String>(
          validator: (value) {
            if (selectedRentalFrequency.value.isEmpty) {
              return "Iltimos, bittasini tanlang";
            }
            return null;
          },
          builder: (field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<String>(
                  valueListenable: selectedRentalFrequency,
                  builder: (context, value, _) {
                    return buildSelectableContainerGroup(
                      options: ["Yearly", "Monthly", "Weekly", "Daily"],
                      selectedValues: value,
                      onChanged: (v) {
                        selectedRentalFrequency.value = v;
                        _onFieldChanged();
                        field.didChange(v); // validator uchun kerak
                      },
                    );
                  },
                ),
                if (field.errorText != null) // xato matnini chiqarish
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Text(
                      field.errorText!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            );
          },
        ),
        SizedBox(height: 20.h),

        // Currency - IXTIYORIY
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

        // Price - MAJBURIY
        _buildSectionTitle("Price", isRequired: true),
        SizedBox(height: 8.h),
        _buildTextField(
          controller: widget.priceController,
          hintText: "2 300",
          keyboardType: TextInputType.number,
          validator: (value) {
            return SimpleValidators.notEmptyIfFilled(value, errorText: "Uy narxini kiriting",);
          },
          suffixWidget: ContainerW(
            width: 104.w,
            onTap: _submitForm,
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

  // Qolgan metodlar bir xil
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
        );
      },
    );
  }

  Widget _buildSectionTitle(String title, {String? subtitle, bool isRequired = false}) {
    return Row(
      children: [
        AppText(
          text: title,
          fontSize: 16,
          fontWeight: 600,
          color: AppColors.textC,
        ),
        if (isRequired)
          Text(
            ' *',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
      ],
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
          final label = (showStudio && index == 0) ? "Studio" : value.toString();

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
                  color: selectedValue == value ? AppColors.base : AppColors.black,
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
                  color: isSelected ? AppColors.base.withOpacity(0.2) : AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.bgLight),
                ),
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
                color: isSelected ? AppColors.base.withOpacity(0.2) : AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.bgLight),
              ),
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
    print("Property Title: ${widget.propertyTitleController.text}");
    print("Description: ${widget.descriptionController.text}");
    print("Number of Rooms: ${widget.numberOfRoomsController.text}");
    print("Studio: $selectedStudio");
    print("Number of Bathrooms: ${widget.numberOfBathroomsController.text}");
    print("Selected Bathrooms: $selectedBathrooms");
    print("Area: ${widget.areaController.text}");
    print("Floor: ${widget.floorController.text}");
    print("Total Floors: ${widget.totalFloorsController.text}");
    print("Furnishing Status: $selectedFurnishingStatus");
    print("Location: ${widget.locationController.text}");
    print("Rental Frequency: $selectedRentalFrequency");
    print("Currency: $selectedCurrency");
    print("Price: ${widget.priceController.text}");
    print("Selected Amenities: $selectedAmenities");

    // Success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Property submitted successfully!"),
        backgroundColor: Colors.green,
      ),
    );
  }
}

// Validatsiya funksiyalari - parent widget'da ishlatish uchun
class PropertyFormValidator {
  // Barcha majburiy maydonlarni tekshirish
  static bool isFormValid({
    required String propertyTitle,
    required String description,
    required String numberOfRooms,
    required String numberOfBathrooms,
    required String area,
    required String location,
    required String price,
    required String furnishingStatus,
    required String rentalFrequency,
    // Ixtiyoriy maydonlar
    String? floor,
    String? totalFloors,
  }) {
    // Majburiy maydonlar
    List<bool> requiredFields = [
      // Text maydonlar
      propertyTitle.trim().isNotEmpty && propertyTitle.trim().length >= 10,
      description.trim().isNotEmpty && description.trim().length >= 50,
      location.trim().isNotEmpty,

      // Son maydonlar
      numberOfRooms.isNotEmpty && int.tryParse(numberOfRooms) != null,
      numberOfBathrooms.isNotEmpty && int.tryParse(numberOfBathrooms) != null,
      area.isNotEmpty && double.tryParse(area) != null && double.parse(area) > 0,
      price.isNotEmpty && double.tryParse(price) != null && double.parse(price) > 0,

      // Selector'lar
      furnishingStatus.isNotEmpty,
      rentalFrequency.isNotEmpty,
    ];

    // Ixtiyoriy maydonlar - agar to'ldirilgan bo'lsa, to'g'ri format bo'lishi kerak
    List<bool> optionalFields = [
      floor == null || floor.isEmpty || (int.tryParse(floor) != null && int.parse(floor) > 0),
      totalFloors == null || totalFloors.isEmpty || (int.tryParse(totalFloors) != null && int.parse(totalFloors) > 0),
    ];

    // Mantiqiy tekshiruvlar
    List<bool> logicalValidations = [
      _validateFloorLogic(floor, totalFloors),
    ];

    return requiredFields.every((field) => field) &&
        optionalFields.every((field) => field) &&
        logicalValidations.every((validation) => validation);
  }

  static bool _validateFloorLogic(String? floor, String? totalFloors) {
    if ((floor == null || floor.isEmpty) && (totalFloors == null || totalFloors.isEmpty)) {
      return true; // Ikkalasi ham bo'sh - OK
    }

    if ((floor != null && floor.isNotEmpty) && (totalFloors == null || totalFloors.isEmpty)) {
      return false; // Floor bor, totalFloors yo'q
    }

    if ((floor == null || floor.isEmpty) && (totalFloors != null && totalFloors.isNotEmpty)) {
      return false; // TotalFloors bor, floor yo'q
    }

    // Ikkalasi ham to'ldirilgan
    int? floorNum = int.tryParse(floor ?? '');
    int? totalFloorsNum = int.tryParse(totalFloors ?? '');

    if (floorNum != null && totalFloorsNum != null) {
      return floorNum <= totalFloorsNum && floorNum > 0;
    }

    return false;
  }
}

