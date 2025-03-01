part of 'login_widgets_imports.dart';

class rich_text_widget extends StatelessWidget {
  const rich_text_widget(
      {super.key,
      required this.CtaText,
      required this.recognizer,
      required this.initialtext,
      required this.color});

  final String initialtext;
  final String CtaText;
  final dynamic recognizer;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "$initialtext ",
          style: GoogleFonts.poppins(color: color),
        ),
        TextSpan(
            text: CtaText,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, color: color),
            recognizer: recognizer) //TapGestureRecognizer()..onTap = () {})
      ]),
    );
  }
  static dynamic demoNavi(BuildContext context){
    final dynamic demoNAV = AutoRouter.of(context).push(SplashScreenRoute());

    return demoNAV;
  }
}


