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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
            padding: EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 40.h,
              width: 150.w,
              child: Image.asset(
                Assets.assetsImagesLogo,
                fit: BoxFit.contain,
                color: MyColors.primarycolor,
              ),
            )),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: EdgeInsets.only(top: 18, right: 20),
              child: IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(SettingsRoute());
                },
                icon: Icon(
                  Icons.settings,
                  color: MyColors.primarycolor,
                  size: 27,
                ),
              ))
        ],
      ),
      backgroundColor: MyColors.whitecolor,
      body: SingleChildScrollView(
        child: Container(
          color: MyColors.whitecolor,
          child: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 500.h,
                        child: PageView(
                          controller: pagecontrol.pageController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            onboard1(),
                            onboard2(),
                            onboard3(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    commonelevatedbutton(
                      name: "Get Started!".i18n,
                      onPressed: () {
                        AutoRouter.of(context).push(UserpageRoute());
                      },
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    onboardrow()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
