part of "pages.dart";

class TrailerPage extends StatefulWidget {
  const TrailerPage({super.key});

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: ColorThemes.lightGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorThemes.grey,
        title: const Text('TH3TR'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              buildAssets(),
              Container(
                
              ),
            ],
          ),
          Text(
            'Movie Trailer',
            textAlign: TextAlign.left,
            style: TypographyStyle.descriptionFont,
          ),
          Text(
            'Deskripsi',
            textAlign: TextAlign.left,
            style: TypographyStyle.descriptionFont,
          ),
          Text(
            'Genre',
            textAlign: TextAlign.left,
            style: TypographyStyle.descriptionFont,
          )
        ]),
      ),
    );

    
  }

  

  Widget buildAssets() => const PlayerWidget();


}



