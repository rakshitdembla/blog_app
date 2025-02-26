part of 'onboard_widgets_imports.dart';

class onboard1 extends StatelessWidget {
  const onboard1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.assetsImagesOnboard1,
          height: 350.h,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: 41.h,
        ),
        Text(
          "Discover, engage and read the latest articles\nor as well as share your own thoughts and\nideas with the community",
          style: TextStyle(color: MyColors.blacktextcolor, fontSize: 15.sp),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}