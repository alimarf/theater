part of 'components.dart';

class MovieTrailerComponent extends StatelessWidget {
  const MovieTrailerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.lightGrey,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorThemes.grey,
          title: const Text('TH3TR'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('on progress')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('on progress')));
              },
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 80,
                color: ColorThemes.lightGrey,
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    Text(
                      'Movie Trailer',
                      textAlign: TextAlign.left,
                      style: TypographyStyle.titleFont,
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ColorThemes.grey),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {},
                          child: const Text('filter')),
                    )
                  ],
                )),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorThemes.backgroundColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
                      height: 130,
                      width: double.infinity,
                      child: Row(children: [
                        const Padding(padding: EdgeInsets.only(left: 10)),
                        Container(
                          margin: const EdgeInsets.only(
                              bottom: 10, top: 10, right: 10),
                          width: 150,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorThemes.grey,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            iconSize: 50,
                            icon: const Icon(Icons.play_circle_outline),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const TrailerPage(
                                      // type: TypeMovie.discover,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.left,
                              'Title',
                              style: TypographyStyle.titleFont,
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 5)),
                            Text(
                              textAlign: TextAlign.left,
                              'Official Teaser Trailer',
                              style: TypographyStyle.sidebarFont,
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 5)),
                            Text(
                              'Release Date',
                              textAlign: TextAlign.left,
                              style: TypographyStyle.releaseDateFont,
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 5)),
                            Text(
                              'Rating',
                              textAlign: TextAlign.left,
                              style: TypographyStyle.sidebarFont,
                            )
                          ],
                        ),
                      ]),
                    ),
                    const Positioned(
                      right: 15,
                      top: 5,
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
