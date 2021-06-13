part of 'controllers.dart';

class DictionaryController extends GetxController {
  final RxList<Dictionary> dictionaryList = <Dictionary>[].obs;
  final RxList<Dictionary> searchList = <Dictionary>[].obs;

  RxBool isLoading = true.obs;
  var isTyping = false.obs;
  var search = TextEditingController();
  var searchText = "".obs;

  @override
  void onInit() {
    fetchDictionary();
    search.addListener(() {
      searchText = search.text.obs;
      search.text.length != 0 ? isTyping(true) : isTyping(false);
    });
    super.onInit();
  }

  void onSearch(searchText) async {
    searchList.clear();
    if (searchText.isEmpty) {
      return;
    }

    dictionaryList.forEach((element) {
      if (element.istilah!.toLowerCase().contains(searchText.toLowerCase())) {
        searchList.add(element);
      }
    });
  }

  void onTyping() {
    isTyping(false);
    search.clear();
    searchList.clear();
  }

  void fetchDictionary() async {
    try {
      isLoading(true);
      Request request = Request(url: 'get_dictionary.php');
      await request.get().then((res) {
        if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          final value =
              (data as List).map((e) => Dictionary.fromJson(e)).toList();
          if (value is List<Dictionary>) {
            dictionaryList.addAll(value);
          }
        }
      });
    } catch (e) {
      showBotToastText('Something wrong, $e');
    } finally {
      isLoading(false);
    }
  }
}
