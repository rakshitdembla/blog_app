part of 'home_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    Assets.assetsImagesNetflix,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 8,),
              AnimatedSmoothIndicator(
                activeIndex: activeindex,
                axisDirection: Axis.horizontal,
                count: 6,
                effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: const Color.fromARGB(150, 158, 158, 158),
                    activeDotColor: MyColors.primarycolor),
              ),
              SizedBox(height: 7.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Latest Posts"), Text("See All")],
              ),
              SizedBox(height: 10,),
              Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          height: 110,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              Assets.assetsImagesNetflix,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 9,top: 10),
                            child: Column(
                              children: [
                                Text(
                                    "Netflix Will Charge Money for Password Sharing"),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(FeatherIcons.clock,
                                        size: 20, color: Colors.grey),
                                        SizedBox(width: 2,),
                                    Text(
                                      "6 Months Ago",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("129 Views",
                                        style: TextStyle(color: Colors.grey)),
                                    Icon(FeatherIcons.save,
                                        size: 20, color: Colors.grey)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
