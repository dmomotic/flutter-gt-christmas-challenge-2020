import 'package:get/get.dart';

class GiftPageController extends GetxController {
  var showGiftPage = false.obs;

  change() {
    showGiftPage.value = !showGiftPage.value;
  }
}
