
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class MyOrdersController extends GetxController {
  final isLoading = false.obs;
  final user= FirebaseAuth.instance.currentUser;
  final orders=[].obs();

  @override
  void onInit() {
    super.onInit();
    getOrders();

  }

  Future getOrders() async {
    isLoading(true);

    try{
      await FirebaseFirestore.instance.collection('orders').where('email', isEqualTo:user!.email).get().then((querySnapshot){
        final orderList = querySnapshot.docs.map((doc) => doc.data()).toList();
        orders.assignAll(orderList);
        print(orderList);
        print(orderList.length);
        isLoading(false);


      });
    }catch(e){print(e);}

  }

  //
  // getOrders() async {
  //   isLoading(true);
  //   final request = OrdersRequestDto(
  //     id: UserManager().user!.id!,
  //   );
  //   SettingRepository().getOrders(request,
  //       onSuccess: (data) {
  //         orders.assignAll(data.data);
  //       },
  //       onError: (e) => showPopupText(e.toString()),
  //       onComplete: () => isLoading(false));
  // }
  //
  // cancle(int? id, int? appId) async {
  //   isLoading(true);
  //   final request = CancleRequestDto(id: id, appId: appId);
  //   SettingRepository().cancle(request,
  //       onSuccess: (data) {},
  //       onError: (e) => showPopupText(e.toString()),
  //       onComplete: () => isLoading(false));
  // }

// cancle(int id ,int ?deliverId) async {
//   isLoading(true);
//   final request = DeliverRequestDto(
//       id: id,
//       createdBy: deliverId
//   );
//   DeliveryRepository().getdeliver(request,
//       onSuccess: (data) {
//         getActiveOrders();
//         showPopupText( "تم البدء ");
//       },
//       onError: (e) => showPopupText( e.toString()),
//       onComplete: () => isLoading(false)
//   );
// }
}
