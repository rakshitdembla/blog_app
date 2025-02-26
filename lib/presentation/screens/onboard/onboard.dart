part of 'onboardimports.dart';

@RoutePage()
class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: MyColors.whitecolor,
          child: Center(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(
                        Assets.assetsImagesLogo,
                        color: MyColors.primarycolor,
                      )),
                  SingleChildScrollView(
                    child: Container(
                      height: 500.w,
                      child: PageView(
                        
                        controller:pagecontrol.pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          onboard1(),
                          onboard2(),
                          onboard3(),
                        ],
                      ),
                    ),
                  ),SizedBox(
                    height: 40.h,
                  ),
                  commonelevatedbutton(
                    name: "Get Started!",
                    onPressed: () {
                      AutoRouter.of(context).push(UserpageRoute());
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  onboardrow()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

