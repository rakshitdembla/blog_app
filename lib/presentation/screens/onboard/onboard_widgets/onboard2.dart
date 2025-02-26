part of 'onboard_widgets_imports.dart';

class onboard2 extends StatelessWidget {
  const onboard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.assetsImagesOnboard2,
          height: 350.h,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: 41.h,
        ),
        Text(
          "Explore, connect, and dive into fresh articles\nor share your own insights and ideas\nwith the community",
          style: TextStyle(color: MyColors.blacktextcolor, fontSize: 15.sp),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}