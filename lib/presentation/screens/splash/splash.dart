part of 'splash_imports.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Utils.manipulatelogin(context);
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width ,
        color: MyColors.primarycolor,
        child: Center(
          child: FadedScaleAnimation(
            child: Image.asset(Assets.assetsImagesLogo,height: 220.h,width: 220.w,)),
        ),
      ),
    );
  }
}
