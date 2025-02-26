part of 'onboard_widgets_imports.dart';

class onboardrow extends StatefulWidget {
  const onboardrow({
    super.key,
  });

  @override
  State<onboardrow> createState() => _onboardrowState();
}

class _onboardrowState extends State<onboardrow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 44.h,
      width: 360.w,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: MyColors.blacktextcolor),
                )),
            SmoothPageIndicator(
              axisDirection: Axis.horizontal,
              controller: pagecontrol.pageController,
              count: 3,
              effect: WormEffect(
                  dotColor: MyColors.GreyColor,
                  dotWidth: 9,
                  dotHeight: 9,
                  activeDotColor: MyColors.primarycolor),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: MyColors.blacktextcolor),
                ))
          ],
        ),
      ),
    );
  }
}
