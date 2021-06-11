part of 'pages.dart';

enum DetailInfoType { news, galery, dictionary }

class DetailPage extends StatelessWidget {
  final DetailInfoType type;
  final Galery? galery;
  final News? news;
  final Dictionary? dictionary;
  DetailPage(this.type, {this.galery, this.news, this.dictionary});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((type == DetailInfoType.galery)
            ? galery?.name ?? '-'
            : (type == DetailInfoType.news)
                ? news?.title ?? '-'
                : dictionary?.istilah ?? '-'),
      ),
      body: ListView(
        children: [
          (type == DetailInfoType.galery)
              ? Container(
                  height: height,
                  child: Hero(
                    tag: '${galery?.idGalery}',
                    child: Material(
                      child: InkWell(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 240,
                              child: Image.network('${galery?.foto}',
                                  fit: BoxFit.cover),
                            ),
                            Text(galery?.description ?? '-')
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : (type == DetailInfoType.news)
                  ? Card(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100,
                            child: Image.network(news?.image ?? '-'),
                          ),
                          Text(news?.description ?? '-')
                        ],
                      ),
                    )
                  : Card(
                      child: Column(
                        children: [
                          Text(dictionary?.istilah ?? '-'),
                          Text(dictionary?.detail ?? '-'),
                        ],
                      ),
                    ),
        ],
      ),
    );
  }
}
