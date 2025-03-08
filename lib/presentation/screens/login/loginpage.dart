part of 'loginpage_imports.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<Offset>? animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    animation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeOut,
    ));
    animationController!.forward();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: MyColors.primarycolor,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: 90.h,
                        width: 140.w,
                        child: Image.asset(
                          Assets.assetsImagesLogo,
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                      height: 110.h,
                    ),
                    animation == null
                        ? Container(
                            height: 600.h,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: container_content(),
                          )
                        : SlideTransition(
                            position: animation!,
                            child: Container(
                              height: 600.h,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50))),
                              child: container_content(),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
