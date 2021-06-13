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
      Request request = Request(url: 'get_galery.php');
      await request.get().then((res) {
        if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          final value = (data as List).map((e) => Galery.fromJson(e)).toList();
          if (value is List<Galery>) {
            galeryList.addAll(value);
          }
        }
      });
    } finally {
      isLoading(false);
    }
  }
}
