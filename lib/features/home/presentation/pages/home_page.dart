import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uyjoy/config/theme/app_colors.dart';
import 'package:uyjoy/core/constants/app_assets.dart';
import 'package:uyjoy/core/constants/app_status.dart';
import 'package:uyjoy/core/dp/dp_injection.dart';
import 'package:uyjoy/core/extensions/widget_extension.dart';
import 'package:uyjoy/core/widgets/app_image.dart';
import 'package:uyjoy/core/widgets/app_text.dart';
import 'package:uyjoy/core/widgets/sing_drop_down.dart';
import 'package:uyjoy/core/widgets/w__container.dart';
import 'package:uyjoy/core/widgets/w_custom_app_bar.dart';
import 'package:uyjoy/features/home/domain/usecase/home_usecase.dart';
import 'package:uyjoy/features/home/presentation/bloc/home_bloc.dart';
import '../../data/model/property_model.dart';
import '../bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<String?> propertyController = ValueNotifier<String?>(
    null,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: WCustomAppBar(
        title: AppText(
          text: "Housell",
          fontSize: 32,
          fontWeight: 700,
          color: AppColors.blackT,
        ),
        actions: [
          // Spacer(),
          AppImage(path: AppAssets.notification),
        ],
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            height: 36.h,
            decoration: BoxDecoration(
              color: AppColors.bg,
              boxShadow: [
                // BoxShadow(
                //   color: const Color(0xFF141414).withOpacity(0.08),
                //   offset: const Offset(0, 0),
                //   blurRadius: 8,
                //   spreadRadius: 0,
                // ),
                // BoxShadow(
                //   color: const Color(0xFF141414).withOpacity(0.04),
                //   offset: const Offset(0, 0),
                //   blurRadius: 1,
                //   spreadRadius: 0,
                // ),
              ],
              borderRadius: BorderRadius.circular(12), // radius bo‘lsa
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppImage(path: AppAssets.search),
                SizedBox(width: 12.w),
                AppText(
                  text: "Search Properties",
                  fontSize: 14,
                  fontWeight: 400,
                ),
              ],
            ).paddingOnly(left: 8),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              CustomDropdown(
                width: 275.w,
                hintText: "Property",
                options: ["Popular", "Vip"],
                controller: propertyController,
              ),
              ContainerW(
                color: AppColors.bg,
                radius: 8,
                width: 40.w,
                height: 40.h,

                child: AppText(text: "text"),
              ),
            ],
          ),
          SizedBox(height: 19.h),
          AppText(text: "All Properties", fontWeight: 500, fontSize: 20),
        ],
      ).paddingOnly(top: 0, left: 24, right: 24),
    );
  }
}

class PropertyGridScreen extends StatefulWidget {
  const PropertyGridScreen({super.key});

  @override
  State<PropertyGridScreen> createState() => _PropertyGridScreenState();
}

class _PropertyGridScreenState extends State<PropertyGridScreen> {
  final ValueNotifier<String?> propertyController = ValueNotifier<String?>(
    null,
  );
  ViewMode selectedViewMode = ViewMode.box;

  // Sample data
  final List<PropertyModell> properties = [
    PropertyModell(
      id: 1,
      title: "Modern Downtown Apartment",
      price: "\$1800",
      location: "Tashkent Yunusobod Rayon",
      bedrooms: 3,
      downloads: 105,
      imageUrl:
          "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=400",
      isVip: true,
    ),
    PropertyModell(
      id: 2,
      title: "Modern Downtown House",
      price: "\$1800",
      location: "Tashkent Yunusobod Rayon",
      bedrooms: 3,
      downloads: 105,
      imageUrl:
          "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=400",
      isVip: false,
    ),
    PropertyModell(
      id: 3,
      title: "Luxury Villa",
      price: "\$2500",
      location: "Tashkent Chilonzor Rayon",
      bedrooms: 4,
      downloads: 89,
      imageUrl:
          "https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=400",
      isVip: false,
    ),
    PropertyModell(
      id: 4,
      title: "Cozy Studio",
      price: "\$900",
      location: "Tashkent Mirzo Ulugbek Rayon",
      bedrooms: 1,
      downloads: 67,
      imageUrl:
          "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=400",
      isVip: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  HomeBloc(getIt<HomeGetHousesUsecase>()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: WCustomAppBar(
          title: AppText(
            text: "Housell",
            fontSize: 32,
            fontWeight: 700,
            color: AppColors.blackT,
          ),
          actions: [
            AppImage(path: AppAssets.notification),
          ],
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.mainStatus == MainStatus.loading) {
                return Center(child: CircularProgressIndicator(),);
              }
              if (state.mainStatus == MainStatus.failure) {
                return Center(child: AppText(text: "Malumot kelmadi"),);
              }
              // state.propertyModel!.data[3].floor;
              if (state.mainStatus == MainStatus.succes) {
                final property = state.propertyModel!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        Container(
                          width: double.infinity,
                          height: 36.h,
                          decoration: BoxDecoration(
                            color: AppColors.bg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppImage(path: AppAssets.search),
                              SizedBox(width: 12.w),
                              AppText(
                                text: "Search Properties",
                                fontSize: 14,
                                fontWeight: 400,
                              ),
                            ],
                          ).paddingOnly(left: 8),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomDropdown(
                                hintText: "Property",
                                options: ["Popular", "Vip"],
                                controller: propertyController,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            ContainerW(
                              color: AppColors.bg,
                              radius: 8,
                              width: 40.w,
                              height: 40.h,
                              child: Icon(
                                Icons.tune,
                                size: 20,
                                color: AppColors.blackT,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 19.h),
                        Row(
                          children: [
                            Expanded(
                                child: AppText(
                                    text: "All Properties",
                                    fontWeight: 500,
                                    fontSize: 20
                                )
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: double.infinity,
                                      height: 270.h,
                                      decoration: const BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 40.w,
                                            height: 4.h,
                                            margin: EdgeInsets.only(top: 12.h, bottom: 20.h),
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.circular(2),
                                            ),
                                          ),
                                          _buildViewModeButton(
                                            ViewMode.list,
                                            Icons.list,
                                            'List',
                                          ),
                                          _buildViewModeButton(
                                            ViewMode.box,
                                            Icons.apps,
                                            'Box',
                                          ),
                                          _buildViewModeButton(
                                            ViewMode.gallery,
                                            Icons.photo_library_outlined,
                                            'Gallery',
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: AppImage(path: AppAssets.grid),
                            ),
                          ],
                        ),
                      ],
                    ).paddingOnly(top: 0, left: 16, right: 16),
                    _buildContent(property),
                  ],
                );
              }
             return AppText(text: "Malumot topilmadi");
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(PropertyModel propertyModel) {
    switch (selectedViewMode) {
      case ViewMode.list:
        return _buildListView(propertyModel);
      case ViewMode.box:
        return _buildGridView();
      case ViewMode.gallery:
        return _buildGalleryView();
    }
  }

  Widget _buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        final property = properties[index];
        return _buildPropertyCard(property);
      },
    ).paddingOnly(top: 15, left: 16, right: 16, bottom: 20);
  }

  Widget _buildListView(PropertyModel propertyModel) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: propertyModel.data.length,
      itemBuilder: (context, index) {
        final property = propertyModel.data[index];
        return _buildListItem(property);
      },
    ).paddingOnly(top: 15, left: 16, right: 16, bottom: 20);
  }

  Widget _buildGalleryView() {
    return GridView.builder(
      shrinkWrap: true, // Bu muhim!
      physics: const NeverScrollableScrollPhysics(), // Bu ham muhim!
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.2,
        mainAxisSpacing: 16,
      ),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        final property = properties[index];
        return _buildGalleryCard(property);
      },
    ).paddingOnly(top: 15, left: 16, right: 16, bottom: 20);
  }

  Widget _buildPropertyCard(PropertyModell property) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Container(
                  width: double.infinity,
                  height: 123.h,
                  color: Colors.grey[300],
                  child: Image.network(
                    property.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
              if (property.isVip)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'VIP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Details
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppText(
                          text: property.title,
                          fontSize: 16,
                          height: 1.2,
                          fontWeight: 400,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      AppImage(path: AppAssets.hearth)
                    ],
                  ),
                  SizedBox(height: 4.h),
                  AppText(
                    text: property.price,
                    fontWeight: 800,
                    fontSize: 16,
                  ),
                  SizedBox(height: 6.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AppImage(path: AppAssets.map, size: 14,),
                      Expanded(
                        child: AppText(
                           text: property.location,
                          fontSize: 12,
                          fontWeight: 400,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          height: 1.2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      AppImage(path: AppAssets.bedroom),
                      SizedBox(width: 8.w),
                      AppText(
                        text: '${property.bedrooms}',
                        fontWeight: 400,
                        fontSize: 12,
                        color: AppColors.base,
                      ),
                      SizedBox(width: 16.w),
                      AppImage(path: AppAssets.sqft),
                      SizedBox(width: 8.w),
                      AppText(
                        text: '${property.downloads}',
                        fontWeight: 400,
                        fontSize: 12,
                        color: AppColors.base,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(Datum property) {
    return Container(
      height: 157.h,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.bg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
            child: Container(
              width: 118.w,
              height: double.infinity.h,
              color: Colors.grey[300],
              child: Image.network(
                property.photos[1].photo,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          // Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (property.isVip) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'VIP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Expanded(
                        child: Text(
                          property.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    property.price.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    property.location,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.abc, size: 14, color: Colors.purple[300]),
                      const SizedBox(width: 4),
                      Text(
                        '${property.numberOfBathrooms}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.purple,
                        ),//
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.download, size: 14, color: Colors.purple[300]),
                      const SizedBox(width: 4),
                      Text(
                        '${property.area}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryCard(PropertyModell property) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          // Large Image
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: Image.network(
                      property.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (property.isVip)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'VIP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  property.price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  property.location,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.bed, size: 16, color: Colors.purple[300]),
                    const SizedBox(width: 4),
                    Text(
                      '${property.bedrooms}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.download, size: 16, color: Colors.purple[300]),
                    const SizedBox(width: 4),
                    Text(
                      '${property.downloads}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewModeButton(ViewMode mode, IconData icon, String label) {
    final isSelected = selectedViewMode == mode;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedViewMode = mode;
          });
          context.pop();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple[100] : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.purple : Colors.grey,
                size: 20,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.purple : Colors.grey,
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ViewMode { list, box, gallery }

class PropertyModell {
  final int id;
  final String title;
  final String price;
  final String location;
  final int bedrooms;
  final int downloads;
  final String imageUrl;
  final bool isVip;

  PropertyModell({
    required this.id,
    required this.title,
    required this.price,
    required this.location,
    required this.bedrooms,
    required this.downloads,
    required this.imageUrl,
    required this.isVip,
  });
}
