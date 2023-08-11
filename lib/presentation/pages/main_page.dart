part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime? currentBackPressTime;
  int _selectedIndex = 0;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      // Fluttertoast.showToast(
      //   msg: "Press back again to exit the app",
      //   backgroundColor: Color(0xCC434343),
      // );
      return Future.value(false);
    }
    return Future.value(true);
  }

  final _layoutPage = [
    const HomePage(),
    const MovieTrailerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Stack(
          children: [
            _layoutPage.elementAt(_selectedIndex),
            bottomNavBar(),
          ],
        ),
      ),
    );
  }

  Align bottomNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 75,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 18),
        decoration: const BoxDecoration(
          color: ColorThemes.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomItem(
              icon: _selectedIndex == 0
                  ? Icon(
                      Icons.home,
                      color: ColorThemes.orange,
                    )
                  : Icon(Icons.home),
              title: 'Home',
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            bottomItem(
              icon: _selectedIndex == 1
                  ? Icon(
                      Icons.play_circle_fill,
                      color: ColorThemes.orange,
                    )
                  : Icon(Icons.play_circle_fill),
              title: 'Trailer',
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            
          ],
        ),
      ),
    );
  }

  bottomItem({
    required Icon icon,
    required String title,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          icon,
          const SizedBox(height: 9),
          Text(title, ),
        ],
      ),
    );
  }
}
