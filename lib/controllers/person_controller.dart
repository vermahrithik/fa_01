import 'package:get/get.dart';

enum Status {success, loading, failed, networkError}

class PersonController extends GetxController {
  static PersonController get instance => Get.find();

  final imgUrls ="".obs;
  final isLoading = false.obs;
  final isUploading = false.obs;
  final dataList = [].obs;
}
