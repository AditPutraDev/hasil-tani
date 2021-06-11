part of 'pages.dart';

class TabGalery extends StatelessWidget {
  final String type;
  TabGalery(this.type);
  @override
  Widget build(BuildContext context) {
    final galeryController = Get.find<GaleryController>();
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 0, 18),
          child: Text('Disarankan untuk Anda', style: blackBoldStyle),
        ),
        SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 12),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...galeryController.galeryList.map((item) {
                    return item.type == type
                        ? Container(
                            width: 100,
                            child: Hero(
                              tag: '${item.idGalery}',
                              child: Material(
                                child: InkWell(
                                  onTap: () => Get.to(
                                    () => DetailPage(DetailInfoType.galery,
                                        galery: item),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 120,
                                        margin: EdgeInsets.only(right: 12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage('${item.foto}'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text('${item.name}')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox();
                  }),
                ],
              ),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 0, 18),
          child: Text('Terbaru', style: blackBoldStyle),
        ),
        ...galeryController.galeryList.map((item) {
          return GestureDetector(
            onTap: () =>
                Get.to(() => DetailPage(DetailInfoType.galery, galery: item)),
            child: item.type == type
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              color: Colors.grey.shade300)
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            image: DecorationImage(
                                image: NetworkImage('${item.foto}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${item.name}', style: blackBoldStyle),
                                Text('${item.type}'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          );
        }),
        SizedBox(height: 90)
      ],
    );
  }
}
