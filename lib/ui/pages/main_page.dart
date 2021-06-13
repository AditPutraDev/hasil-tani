part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  final GaleryController galeryController = Get.put(GaleryController());
  final DictionaryController dictionaryController =
      Get.put(DictionaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: mainBlueColor),
          SafeArea(
            child: Container(color: greyPage),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: GaleryPage(),
                ),
                Center(
                  child: DictionaryPage(),
                ),
                Center(
                  child: SplashPage(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottonNavbar(
        selectedIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
          pageController.jumpToPage(selectedPage);
        },
      ),
    );
  }
}
