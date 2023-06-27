

import 'package:get/get.dart';
import 'package:hotels_app/hotel_rooms/bindings/hotel_rooms_page_binding.dart';
import 'package:hotels_app/hotel_rooms/views/hotel_rooms_page_view.dart';
import 'package:hotels_app/login/bindings/login_binding.dart';
import 'package:hotels_app/login/views/login_view.dart';
import 'package:hotels_app/register/bindings/register_binding.dart';
import 'package:hotels_app/register/views/register_view.dart';
import 'package:hotels_app/room_detail/bindings/room_details_binding.dart';
import 'package:hotels_app/room_detail/views/room_detail_view.dart';
import 'package:hotels_app/rooms_homepage/bindings/rooms_binding.dart';
import 'package:hotels_app/rooms_homepage/views/rooms_view.dart';
import 'package:hotels_app/search_filter_hotel/bindings/search_filter_hotel_page_binding.dart';
import 'package:hotels_app/search_filter_hotel/views/search_filter_hotel_page_view.dart';
import 'package:hotels_app/splash/bindings/splash_binding.dart';
import 'package:hotels_app/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),GetPage(
      name: _Paths.ROOMS,
      page: () => const RoomsView(),
      binding: RoomsBinding(),
    ),GetPage(
      name: _Paths.HOTEl_ROOM_SEARCH_FILTER,
      page: () => const RoomSearchFilterHotelPageView(),
      binding: RoomSearchFilterHotelPageBinding(),
    ),GetPage(
      name: _Paths.HOTEl_ROOMS,
      page: () => const HotelRoomsPageView(),
      binding: HotelRoomsPageBinding(),
    ),GetPage(
      name: _Paths.ROOM_DETAIL,
      page: () => const RoomDetailView(),
      binding: RoomDetailBinding(),
    ),

  ];
}
