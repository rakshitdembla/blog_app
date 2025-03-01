part of 'general_imports.dart';

@RoutePage()
class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  List<TabItem<dynamic>> iconslist = [
    TabItem(icon: FeatherIcons.home),
    TabItem(icon: FeatherIcons.tag),
    TabItem(icon: FeatherIcons.plus),
    TabItem(icon: FeatherIcons.hash),
    TabItem(icon: FeatherIcons.user),
  ];
  int visit = 0;
  final List<Widget> pages = [
    HomePage(),
    Tags(),
    Addpost(),
    Category(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: visit,
        children: pages,
      ),
      bottomNavigationBar: BottomBarCreative(
        items: iconslist,
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.21),
        color: MyColors.primarycolor.withOpacity(0.3),
        colorSelected: MyColors.primarycolor,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}
