part of "pages.dart";

class TrailerPage extends StatefulWidget {
  const TrailerPage({super.key});

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

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
          Container(
            child: Stack(
              children: [
                _controller.value.isInitialized
                    ? GestureDetector(
                        onTap: () {
                          {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          }
                        },
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : Container(),
                Positioned.fill(
                  child: Center(
                    child: _controller.value.isPlaying
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              }
                            },
                            child: const Icon(
                              color: ColorThemes.white,
                              size: 75.0,
                              Icons.play_circle_outline,
                            ),
                          ),
                  ),
                ),
              ],
            ),
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
}
