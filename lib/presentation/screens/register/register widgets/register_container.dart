part of 'register_widgets_imports.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({super.key});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(17, 35, 17, 0),
      child: BlocListener<RegisterViewmodel, RegisterStates>(
        listener: (context, state) {
            ("BlocListener Received State: $state");
          if (state is RegisterAuthorisedState) {
            AutoRouter.of(context).push(GeneralScreenRoute());
          } else if (state is RegisterInvalidState) {
            Utils.errorsnackbar(message: state.error,context: context);
          } else if (state is RegisterUnauthorisedState) {
            Utils.errorsnackbar(message: state.errormessage, context: context);
          }
        },
        child: Column(
          children: [
            Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18.sp),
            ),
            SizedBox(
              height: 35.h,
            ),
            Align(alignment: Alignment.topLeft, child: "Name".text.make()),
            SizedBox(
              height: 5.h,
            ),
            VxTextField(
              controller: namecontroller,
              fillColor: Colors.transparent,
              borderColor: MyColors.primarycolor,
              borderRadius: 10,
              prefixIcon: Icon(Icons.person_2_outlined),
              borderType: VxTextFieldBorderType.roundLine,
            ),
            SizedBox(
              height: 25.h,
            ),
            Align(alignment: Alignment.topLeft, child: "Email".text.make()),
            SizedBox(
              height: 5.h,
            ),
            VxTextField(
              controller: emailcontroller,
              fillColor: Colors.transparent,
              borderColor: MyColors.primarycolor,
              borderRadius: 10,
              prefixIcon: Icon(Icons.email_outlined),
              borderType: VxTextFieldBorderType.roundLine,
            ),
            SizedBox(
              height: 25.h,
            ),
            Align(alignment: Alignment.topLeft, child: "Password".text.make()),
            SizedBox(
              height: 5.h,
            ),
            VxTextField(
              controller: passwordcontroller,
              isPassword: true,
              obscureText: true,
              fillColor: Colors.transparent,
              borderColor: MyColors.primarycolor,
              borderRadius: 10,
              prefixIcon: Icon(Icons.lock_open_outlined),
              borderType: VxTextFieldBorderType.roundLine,
            ),
            SizedBox(
              height: 6.h,
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
                          onChanged: (newValue) {
                            setState(() {
                              value = newValue;
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
                      "Remember me",
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            BlocBuilder<RegisterViewmodel, RegisterStates>(
              
              builder: (context, state) {
                  ("BlocBuilder Received State: $state");
                if (state is RegisterLoadingState) {
                  return Center(
                    child: LoadingAnimationWidget.horizontalRotatingDots(
                      color: MyColors.primarycolor,
                      size: 35,
                    ),
                  );
                } else {
                  return commonelevatedbutton(
                      name: "Register",
                      onPressed: () {
                     
                        context.read<RegisterViewmodel>().add(RegisterSubmit(
                            email: emailcontroller.text,
                              
                            password: passwordcontroller.text,
                            name: namecontroller.text));
                            
                            
                      });
                }
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            rich_text_widget(
                color: MyColors.blacktextcolor,
                CtaText: "Login",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.router.removeUntil(
                        (route) => route.name == UserpageRoute.name);
                  },
                initialtext: "Already have an account?")
          ],
        ),
      ),
    );
  }
}
