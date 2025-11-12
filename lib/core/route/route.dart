import 'package:get/get.dart';
import 'package:xilancer_app/feature/home/home_screen.dart';

class AppRoutes{
  static const String home_screen = "/home_screen";







  final List <GetPage> pages = [
    GetPage(name: home_screen, page: ()=> HomeScreen()),
  ];
}