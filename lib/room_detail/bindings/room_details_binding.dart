
import 'package:get/get.dart';
import 'package:hotels_app/room_detail/controllers/room_details_controller.dart';


class RoomDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomDetailController>(
      () => RoomDetailController(),
    );
  }
}
