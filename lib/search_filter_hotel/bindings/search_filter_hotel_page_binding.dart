import 'package:get/get.dart';

import '../controllers/search_filter_hotel_page_controller.dart';

class RoomSearchFilterHotelPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomSearchFilterHotelPageController>(
          () => RoomSearchFilterHotelPageController(),
    );
  }
}
