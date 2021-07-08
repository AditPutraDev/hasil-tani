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
      body: Column(
        children: [
          (type == DetailInfoType.galery)
              ? buildDetail(
                  '${galery?.name}',
                  '${galery?.description}',
                  Icons.loyalty_rounded,
                  Container(
                    width: double.infinity,
                    height: 240,
                    child: Hero(
                      tag: '${galery?.idGalery}',
                      child:
                          Image.network('${galery?.foto}', fit: BoxFit.cover),
                    ),
                  ),
                )
              : buildDetail(
                  '${news?.title}',
                  '${news?.description}',
                  Icons.star,
                  Container(
                    width: double.infinity,
                    height: 240,
                    child: Hero(
                      tag: '${news?.idNews}',
                      child: Image.network('${news?.image}', fit: BoxFit.cover),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Widget buildDetail(
      String title, String description, IconData icon, Widget child) {
    return Container(
      height: height,
      child: ListView(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  child,
                  Container(
                    height: 241,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, 1),
                        end: Alignment(0, 0.06),
                        colors: [Colors.white, Colors.white.withOpacity(0)],
                      ),
                    ),
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
                Expanded(child: Text(title, style: blackBoldStyle)),
                SizedBox(width: 12),
                Expanded(child: Icon(icon, color: greenColor)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(description, textAlign: TextAlign.justify),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
