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
      appBar: AppBar(
        title: Text((type == DetailInfoType.galery)
            ? '${galery?.name}'
            : '${news?.title}'),
        centerTitle: true,
      ),
      body: ListView(
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
      ),
    );
  }

  Widget buildDetail(String id, String image, String title, String description,
      IconData icon) {
    return Container(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 240,
            child: Hero(
              tag: id,
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 24, 0, 12),
            child: Row(
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
