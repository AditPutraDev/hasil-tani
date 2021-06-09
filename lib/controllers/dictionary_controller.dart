part of 'controllers.dart';

class DictionaryController extends GetxController {
  final RxList<Dictionary> dictionaryList = <Dictionary>[].obs;

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    fetchDictionary();
    super.onInit();
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
