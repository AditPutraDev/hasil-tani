part of 'pages.dart';

class GaleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final galeryController = Get.find<GaleryController>();
    return Scaffold(
      body: Obx(
        () {
          if (galeryController.isLoading.value == true)
            return Center(child: Loading.threeBounce);
          else
            return DefaultTabController(
              length: 5,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: whiteColor,
                      brightness: Brightness.light,
                      expandedHeight: 100,
                      title: Text(
                        'Hasil Tani',
                        style: mainStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: CircleAvatar(
                              backgroundColor: Colors.black26,
                              child:
                                  Icon(Icons.person_rounded, color: whiteColor),
                            ),
                            onTap: () => Get.bottomSheet(
                              BottomSheets.about(),
                            ),
                          ),
                        )
                      ],
                      centerTitle: true,
                      floating: true,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                      ),
                      bottom: TabBar(
                        isScrollable: true,
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black26,
                        indicatorColor: Colors.green,
                        labelStyle: blackBoldStyle,
                        tabs: [
                          Tab(
                            child: CustomListCard.imageItem(
                              galeryController.garden,
                              iHeight: 45,
                              iWidth: 44,
                            ),
                          ),
                          Tab(
                            child: CustomListCard.imageItem(
                              galeryController.fish,
                              iHeight: 45,
                              iWidth: 44,
                            ),
                          ),
                          Tab(text: 'Pertanian'),
                          Tab(text: 'Peternakan'),
                          Tab(text: 'Perhutanan'),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    TabGalery('perkebunan'),
                    TabGalery('perikanan'),
                    titleComingSoon(galeryController.soon),
                    titleComingSoon(galeryController.soon),
                    titleComingSoon(galeryController.soon),
                  ],
                ),
              ),
            );
        },
      ),
    );
  }

  Widget titleComingSoon(String image) {
    return Center(
      child: CustomListCard.imageItem(image, fit: BoxFit.contain),
    );
  }
}
