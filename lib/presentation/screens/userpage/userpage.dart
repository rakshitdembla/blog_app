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
          Container(
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
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Image.asset(Assets.assetsImagesLogo)),
                  Spacer(),
                  Text(
                    "Explore the world,\nBillions of thoughts.",
                    style: TextStyle(
                      color: MyColors.whitetextcolor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).push(LoginPageRoute());
                    },
                    child: Text("Login",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: MyColors.whitetextcolor)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Register",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: MyColors.whitetextcolor)),
                  ),
                  SizedBox(
                    height: 43,
                  ),
                  rich_text_widget(
                    color: MyColors.whitetextcolor,
                      CtaText: "Browse Casually",
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      initialtext: "Don't want to create"),
                  SizedBox(
                    height: 17,
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
