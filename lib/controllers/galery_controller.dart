part of 'controllers.dart';

class GaleryController extends GetxController {
  final RxList<Galery> galeryList = <Galery>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchGalery();
    super.onInit();
  }

  void fetchGalery() async {
    try {
      isLoading(true);
      await GaleryService.getGalery().then((value) {
        if (value is List<Galery>) {
          galeryList.addAll(value);
        }
      });
    } finally {
      isLoading(false);
    }
  }
}
