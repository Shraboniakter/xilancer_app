import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xilancer_app/core/global_widget/categoriesitem.dart';
import 'package:xilancer_app/core/global_widget/custom_texfield.dart';
import 'package:xilancer_app/core/global_widget/custom_text.dart';
import 'package:xilancer_app/core/global_widget/useable_card.dart';
import 'package:xilancer_app/core/utils/assetpaths.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentIndex = 0;

  final List<Map<String, String>> categoriesData = [
    {
      "image": "assets/images/image 1106.png", // your person image path
      "title1": "Find the Perfect Freelancer for",
      "title2": "Any Project"
    },
    {
      "image": "assets/images/image 1106.png",
      "title1": "Hire Experts Instantly for",
      "title2": "Any Task"
    },
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
                SizedBox(height: 16.sp,),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.95,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: categoriesData.asMap().entries.map((entry) {
                    int index = entry.key;
                    var category = entry.value;

                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: 164,
                          width: 408,

                          decoration: BoxDecoration(
                            color: const Color(0xff007456),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              // Left side text + button
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      category["title1"]!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      category["title2"]!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 12,),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(12,8,12,8),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: const Color(0xff007456),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                        ),
                                        child: Text("Explore Now",style: TextStyle(fontSize: 12),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Right side image
                              Positioned(
                                top: 3,
                                left: 212,
                                right:0,
                                bottom:0,


                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    category["image"]!,
                                    fit: BoxFit.contain,
                                    width: 180,
                                    height: 161,

                                  ),
                                ),
                              ),

                              // ✅ Indicator inside the card
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: categoriesData.asMap().entries.map((dot) {
                                    bool isActive = _currentIndex == dot.key;
                                    return AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      width: isActive ? 20.0 : 8.0,
                                      height: 8.0,
                                      margin:
                                      const EdgeInsets.symmetric(horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        color: isActive
                                            ? const Color(0xff00AD80)
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 16.sp,),
                Row(children: [
                  CustomTextPoppins(text: "Popular Services",size: 20,fontWeight: FontWeight.w500,),
                  SizedBox(width: 100,),
                  TextButton(onPressed: (){},
                      child:CustomTextPoppins(text: "Explore all",
                        size: 16,fontWeight: FontWeight.w400,color: Color(0xff242B36),))
                  
                ],),

                SizedBox(height: 16.sp,),
                SizedBox(
                  height: 380, // fixed height for horizontal scroll area
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal, // 👈 horizontal scroll
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    itemCount: 6, // number of cards
                    separatorBuilder: (context, index) => const SizedBox(width: 20),
                    itemBuilder: (context, index) {
                      final ValueNotifier<bool> isFavorite = ValueNotifier(false);

                      return Container(
                        height: 346,
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top: Image + Favorite Icon + Sponsored Tag
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    'assets/Image.png',
                                    fit: BoxFit.cover,
                                    height: 172,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  left: 12,
                                  child: Container(
                                    width: 91,
                                    height: 26,
                                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Text(
                                      "Sponsored",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff3B4759),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: ValueListenableBuilder<bool>(
                                    valueListenable: isFavorite,
                                    builder: (context, value, _) {
                                      return GestureDetector(
                                        onTap: () {
                                          isFavorite.value = !isFavorite.value;
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            value
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: value
                                                ? Colors.red
                                                : const Color(0xff3B4759),
                                            size: 22,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            // Middle: Product Info
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(Icons.star, color: Colors.amber, size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        "4.5 (23 Reviews)",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff3B4759),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Level  2",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3B4759),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Bottom text
                            Center(
                              child: SizedBox(
                                width: 278,
                                height: 48,
                                child: const Text(
                                  "I will do professional figma design for website template....",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),
                            Center(
                              child: SizedBox(
                                width: 278,
                                child:
                                const Divider(height: 1, color: Color(0xff1B21291A)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(child: Image.asset("assets/Frame.png")),
                          ],
                        ),
                      );
                    },
                  ),
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
      physics: const BouncingScrollPhysics(),
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

