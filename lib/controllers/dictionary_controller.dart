part of 'controllers.dart';

class DictionaryController extends GetxController {
  final RxList<Dictionary> dictionaryList = <Dictionary>[].obs;
  final RxList<Dictionary> searchList = <Dictionary>[].obs;

  RxBool isLoading = true.obs;
  var search = TextEditingController();
  var searchText = "".obs;
  @override
  void onInit() {
    fetchDictionary();
    search.addListener(() {
      searchText = search.text.obs;
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

  void fetchDictionary() async {
    try {
      await DictionaryService.getDictionary().then((value) {
        if (value is List<Dictionary>) {
          dictionaryList.addAll(value);
        } else {
          showBotToastText(value);
        }
      });
    } catch (e) {
      showBotToastText('Something wrong, $e');
    }
  }
}
