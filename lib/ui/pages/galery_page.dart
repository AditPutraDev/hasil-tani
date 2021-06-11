part of 'pages.dart';

class GaleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GaleryController galeryController = Get.find<GaleryController>();
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
                      leading: Icon(Icons.list, color: Colors.black),
                      title: Text('Hasil Tani', style: blackBoldStyle),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.black26,
                            child:
                                Icon(Icons.person_rounded, color: whiteColor),
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
                          Tab(text: 'Perkebunan'),
                          Tab(text: 'Perikanan'),
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
                    titleComingSoon(),
                    titleComingSoon(),
                    titleComingSoon(),
                  ],
                ),
              ),
            );
        },
      ),
    );
  }

  Widget titleComingSoon() {
    return Center(
      child: Text('Coming soon'),
    );
  }
}
