part of 'onboard_widgets_imports.dart';

class onboard3 extends StatelessWidget {
  const onboard3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.assetsImagesOnboard3,
          height: 350.h,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: 41.h,
        ),
        Text(
          "Stay informed with fresh and engaging \ncontent or contribute your unique thoughts\nand ideas with ease".i18n,
          style: TextStyle(color: MyColors.blacktextcolor, fontSize: 15.sp),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}