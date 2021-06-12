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
      ),
      body: ListView(
        children: [
          (type == DetailInfoType.galery)
              ? Container(
                  height: height,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 240,
                        child: Hero(
                          tag: '${galery?.idGalery}',
                          child: Image.network('${galery?.foto}',
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text('${galery?.description}'),
                    ],
                  ),
                )
              : Card(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100,
                        child: Image.network('${news?.image}'),
                      ),
                      Text('${news?.description}'),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
