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
  bool? value = false;

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
            "Login".i18n,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18.sp),
          ),
          SizedBox(
            height: 35.h,
          ),
          Align(alignment: Alignment.topLeft, child: "Email".i18n.text.make()),
          SizedBox(
            height: 5.h,
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
            height: 30.h,
          ),
          Align(alignment: Alignment.topLeft, child: "Password".i18n.text.make()),
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
                    height: 24.h,
                    width: 22.w,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                        value: value,
                        splashRadius: 20,
                        onChanged: (newvalue) {
                          setState(() {
                            value = newvalue;
                          });
                        },
                        visualDensity: VisualDensity.compact,
                        checkColor: Colors.green,
                        fillColor: WidgetStateProperty.all(
                            const Color.fromARGB(0, 255, 255, 255)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              4), // Optional: Rounded corners
                          side: BorderSide(
                              color: Colors.black, width: 2), // Border color
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Remember me".i18n,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Utils.showToast(message: "will be available soon, working on api :)".i18n);
                  },
                  child: Text(
                    "Forgot Password?".i18n,
                    style: GoogleFonts.poppins(
                        color: MyColors.blacktextcolor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ))
            ],
          ),
          SizedBox(
            height: 40.h,
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
                  child: LoadingAnimationWidget.horizontalRotatingDots(
                    color: MyColors.primarycolor,
                    size: 35,
                  ),
                );
              } else {
                return commonelevatedbutton(
                  name: "Login".i18n,
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
            height: 30.h,
          ),
          rich_text_widget(
              color: MyColors.blacktextcolor,
              CtaText: "Register".i18n,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                    context.router.removeUntil((route) => route.name == UserpageRoute.name);
                },
              initialtext: "Don't have an account?".i18n)
        ],
      ),
    );
  }
}
