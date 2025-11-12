import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xilancer_app/core/global_widget/categoriesitem.dart';
import 'package:xilancer_app/core/global_widget/custom_texfield.dart';
import 'package:xilancer_app/core/global_widget/custom_text.dart';
import 'package:xilancer_app/core/utils/assetpaths.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentIndex = 0;


  final List<String> imageList = [
    "assets/images/carousel.png",
    "assets/images/carousel.png",
    "assets/images/carousel.png",
  ];


  final List<Widget> _pages = [
    const Center(child: Text("Home Page")),
    const Center(child: Text("Inbox Page")),
    const Center(child: Text("Search Page")),
    const Center(child: Text("More Page")),
    const Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
          ? SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextPoppins(
                          text: "Welcome Back!",
                          size: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomTextPoppins(
                          text: "Leslie Alexander",
                          size: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      Assetpaths.profile,
                      width: 40.w,
                      height: 40.h,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomTextfield(
                  hintText: "Search here",
                  prefix: const Icon(Icons.search),
                  suffix: Image.asset(
                    Assetpaths.preffix,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                SizedBox(height: 24.sp,),
                CustomTextPoppins(
                  text: "Popular Categories",
                  size: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 16.sp,),
                CategoriesList,
                SizedBox(height: 24.sp,),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 124,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imageList.map((item) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: 408,
                          height: 164,
                        ),
                      ),
                    );
                  }).toList(),
                ),

              ],
            ),
          ),
        ),
      )
          : _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: "More",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}


SizedBox get CategoriesList {
  return SizedBox(
    height: 130,
    child: ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const CategoriesItem(imagePath: "assets/images/Component 373.png" ,title: "Digital Marketing",);
      },
      separatorBuilder: (_, __) {
        return const SizedBox(
          width: 8,
        );
      },
    ),
  );
}
