part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final Galery galery;
  DetailPage(this.galery);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(galery.name ?? '-'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            child: Image.network(galery.foto ?? '-'),
          ),
          Text(galery.description ?? '-')
        ],
      ),
    );
  }
}
