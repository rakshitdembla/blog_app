part of 'login_widgets_imports.dart';

class container_content extends StatefulWidget {
  const container_content({
    super.key,
  });

  @override
  State<container_content> createState() => _container_contentState();
}

class _container_contentState extends State<container_content> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  bool value = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(17, 35, 17, 0),
      child: Column(
        children: [
          Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
          ),
          SizedBox(
            height: 35,
          ),
          Align(alignment: Alignment.topLeft, child: "Email".text.make()),
          SizedBox(
            height: 5,
          ),
          VxTextField(
            fillColor: Colors.transparent,
            borderColor: MyColors.primarycolor,
            borderRadius: 10,
            prefixIcon: const Icon(Icons.email_outlined),
            borderType: VxTextFieldBorderType.roundLine,
            controller: emailcontroller,
          ),
          SizedBox(
            height: 30,
          ),
          Align(alignment: Alignment.topLeft, child: "Password".text.make()),
          VxTextField(
            isPassword: true,
            obscureText: true,
            fillColor: Colors.transparent,
            borderColor: MyColors.primarycolor,
            borderRadius: 10,
            prefixIcon: Icon(Icons.lock_open_outlined),
            borderType: VxTextFieldBorderType.roundLine,
            controller: passcontroller,
          ),
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
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                        color: MyColors.blacktextcolor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ))
            ],
          ),
          SizedBox(
            height: 40,
          ),
          BlocConsumer<LoginViewmodel, LoginStates>(
            listener: (context, state) {
              if (state is LoginAuthorisedState) {
                AutoRouter.of(context).push(GeneralScreenRoute());
              } else if (state is LoginUnauthorisedState) {
                Utils.errorsnackbar(
                    message: state.errormessage, context: context);
              } else if (state is LoginInvalidState) {
                Utils.errorsnackbar(message: state.error, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return commonelevatedbutton(
                  name: "Login",
                  onPressed: () {
                    context.read<LoginViewmodel>().add(LoginEvent(
                        email: emailcontroller.text,
                        password: passcontroller.text));

                  },
                );
              }
            },
          ),
          SizedBox(
            height: 30,
          ),
          rich_text_widget(
              color: MyColors.blacktextcolor,
              CtaText: "Sign up",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AutoRouter.of(context).push(RegisterScreenRoute());
                },
              initialtext: "Don't have an account?")
        ],
      ),
    );
  }
}
