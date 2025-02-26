part of 'commonwidgets_imports.dart';

class commonelevatedbutton extends StatelessWidget {
  const commonelevatedbutton(
      {super.key,
      required this.name,
      required this.onPressed,
});

  final String name;
  final dynamic onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 342.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primarycolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
          onPressed: onPressed,
          child: Text(
            name,
            style: TextStyle(
                color: MyColors.whitetextcolor, fontSize: 16.sp, fontWeight: FontWeight.bold),
          )),
    );
  }
}
