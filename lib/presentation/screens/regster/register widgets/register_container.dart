part of 'register_widgets_imports.dart';

class RegisterContainer extends StatelessWidget {
  const RegisterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Padding(
      padding: EdgeInsets.fromLTRB(17, 35, 17, 0),
      child: Column(
        children: [
          Text(
            "Register",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
          ),
          SizedBox(
            height: 35,
          ),
          Align(alignment: Alignment.topLeft, child: "Email".text.make()),
          SizedBox(
            height: 5,
          ),
          const VxTextField(
            fillColor: Colors.transparent,
            borderColor: MyColors.primarycolor,
            borderRadius: 10,
            prefixIcon: Icon(Icons.email_outlined),
            borderType: VxTextFieldBorderType.roundLine,
          ),
          SizedBox(
            height: 25,
          ),
          Align(alignment: Alignment.topLeft, child: "Password".text.make()),
          SizedBox(
            height: 5,
          ),
          const VxTextField(
            isPassword: true,
            obscureText: true,
            fillColor: Colors.transparent,
            borderColor: MyColors.primarycolor,
            borderRadius: 10,
            prefixIcon: Icon(Icons.lock_open_outlined),
            borderType: VxTextFieldBorderType.roundLine,
          ),
          SizedBox(
            height: 25,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: "Confirm Password".text.make()),
          SizedBox(
            height: 5,
          ),
          const VxTextField(
            isPassword: true,
            obscureText: true,
            fillColor: Colors.transparent,
            borderColor: MyColors.primarycolor,
            borderRadius: 10,
            prefixIcon: Icon(Icons.password_outlined),
            borderType: VxTextFieldBorderType.roundLine,
          ),
          SizedBox(height: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 22,
                    child: Transform.scale(
                      scale: 0.7,
                      child: Checkbox(
                        value: value,
                        onChanged: (newValue) {},
                        visualDensity: VisualDensity.compact,
                        checkColor: Colors.green,
                      ),
                    ),
                  ),
                  Text(
                    "Remember me",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          commonelevatedbutton(name: "Register", onPressed: () {}),
          SizedBox(
            height: 30,
          ),
          rich_text_widget(
              color: MyColors.blacktextcolor,
              CtaText: "Login",
              recognizer: TapGestureRecognizer()..onTap = () {},
              initialtext: "Already have an account?")
        ],
      ),
    );
  }
}
