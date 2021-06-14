part of 'pages.dart';

enum DetailInfoType { news, galery }

class DetailPage extends StatelessWidget {
  final DetailInfoType type;
  final Galery? galery;
  final News? news;
  DetailPage(this.type, {this.galery, this.news});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: greenColor),
        SafeArea(
          child: Container(color: Colors.white),
        ),
        ListView(
          children: [
            (type == DetailInfoType.galery)
                ? buildDetail(
                    '${galery?.idGalery}',
                    '${galery?.foto}',
                    '${galery?.name}',
                    '${galery?.description}',
                    Icons.loyalty_rounded)
                : buildDetail('${news?.idNews}', '${news?.image}',
                    '${news?.title}', '${news?.description}', Icons.star)
          ],
        )
      ],
    ));
  }

  Widget buildDetail(String id, String image, String title, String description,
      IconData icon) {
    return Container(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 240,
                    child: Hero(
                      tag: id,
                      child: Image.network(image, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 241,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(0, 1),
                            end: Alignment(0, 0.06),
                            colors: [
                          Colors.white,
                          Colors.white.withOpacity(0)
                        ])),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 24),
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.04)),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 24, 0, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: blackBoldStyle),
                SizedBox(width: 12),
                Icon(icon, color: greenColor),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(description, textAlign: TextAlign.justify),
          ),
        ],
      ),
    );
  }
}
