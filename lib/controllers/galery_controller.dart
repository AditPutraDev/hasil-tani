part of 'controllers.dart';

class GaleryController extends GetxController {
  final RxList<Galery> galeryList = <Galery>[].obs;
  var isLoading = true.obs;
  String soon = 'https://image.flaticon.com/icons/png/512/4771/4771343.png';
  String garden = 'https://image.flaticon.com/icons/png/512/2917/2917733.png';
  String fish = 'https://image.flaticon.com/icons/png/512/4039/4039770.png';

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
