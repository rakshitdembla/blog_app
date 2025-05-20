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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(UserpageRoute());
              },
              child: Text(
                "Skip".i18n,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: MyColors.blacktextcolor),
              )),
          SmoothPageIndicator(
            axisDirection: Axis.horizontal,
            controller: pagecontrol.pageController,
            count: 3,
            effect: WormEffect(
                dotColor: MyColors.GreyColor,
                dotWidth: 9.w,
                dotHeight: 9.h,
                activeDotColor: MyColors.primarycolor),
          ),
          TextButton(
              onPressed: () {
                pagecontrol.pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                "Next".i18n,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: MyColors.blacktextcolor),
              ))
        ],
      ),
    );
  }
}
