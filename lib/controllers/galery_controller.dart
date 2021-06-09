part of 'controllers.dart';

class GaleryController extends GetxController {
  final RxList<Galery> galeryList = <Galery>[].obs;

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    fetchGalery();
    super.onInit();
  }

  void fetchGalery() async {
    try {
      await GaleryService.getGalery().then((value) {
        if (value is List<Galery>) {
          galeryList.addAll(value);
        } else {
          print('else');
        }
      });
    } catch (e) {
      print('catch');
    }
  }
}
