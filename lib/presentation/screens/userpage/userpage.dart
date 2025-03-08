part of 'userpage_imports.dart';

@RoutePage()
class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                Assets.assetsImagesAuthBg,
                fit: BoxFit.fill,
              )),
          Center(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                          height: 80.h, width: 140.w,
                        child: Image.asset(Assets.assetsImagesLogo,
                        fit: BoxFit.contain,
                          ),
                      ),
                  Spacer(),
                  Text(
                    "Explore the world,\nBillions of thoughts.",
                    style: TextStyle(
                      color: MyColors.whitetextcolor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).push(LoginPageRoute());
                    },
                    child: Text("Login",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize : 16.5.sp,
                            color: MyColors.whitetextcolor)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).push(RegisterScreenRoute());
                    },
                    child: Text("Register",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                              fontSize : 16.5.sp,
                            color: MyColors.whitetextcolor)),
                  ),
                  SizedBox(
                    height: 43.h,
                  ),
                  rich_text_widget(
                      color: MyColors.whitetextcolor,
                      CtaText: "Browse Casually",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Utils.showToast(
                              message: "This feature isn't available yet!");
                        },
                      initialtext: "Don't want to create"),
                  SizedBox(
                    height: 17.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
