import 'package:get/get.dart';

import '../controllers/hotel_rooms_page_controller.dart';

class HotelRoomsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelRoomsPageController>(
          () => HotelRoomsPageController(),
    );
  }
}
