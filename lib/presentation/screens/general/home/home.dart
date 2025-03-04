part of 'home_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeindex = 0;

 
  @override
  void initState() {
    super.initState();
    //log("Fetching blogs...");
    context.read<HomeViewmodel>().add(fetchblogs());
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: BlocBuilder<HomeViewmodel, HomeStates>(
            builder: (context, state) {
              if (state is HomeLoadingState || state is HomeInitialState) {
                //log("⏳ UI Showing: Loading Indicator...");
                return Center(child: CircularProgressIndicator());
              } else if (state is HomeLoadedState) {
                //log("✅ UI Showing: Blog List (${state.bloglist.length} posts)");

                return Column(
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
                    SizedBox(
                      height: 8,
                    ),
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
                    SizedBox(
                      height: 7.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Latest Posts"), Text("See All")],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.bloglist.length,
                          itemBuilder: (context, index) {
                            BlogPost blogpost = state.bloglist[index];
                             //log("✅ here is state.bloglist ${state.bloglist.length}");
                             //log("✅ here is each blog post index $blogpost");

                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              child: Row(
                                children: [
                                  Container(
                                    height: 110,
                                    width: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            blogpost.featuredimage.toString(),
                                        // placeholder: (context, url) =>
                                        //     Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 9, top: 10),
                                      child: Column(
                                        children: [
                                          Text(blogpost.title ?? "No Title",overflow: TextOverflow.ellipsis,maxLines: 2,),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Icon(FeatherIcons.clock,
                                                  size: 20, color: Colors.grey),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                Utils.timeAgo(blogpost
                                                    .created_at
                                                    .toString()),
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  blogpost.views == null
                                                      ? "0 Views"
                                                      : "${blogpost.views
                                                          .toString()} Views",
                                                  style: TextStyle(
                                                      color: Colors.grey)),
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
                            );
                          }),
                    )
                  ],
                );
              } else if (state is HomeErrorState) {
                //log("❌ UI Showing: Error - ${state.error}");
                return Center(child: Text(state.error.toString()));
              } else {}
              //log("⚠️ UI Showing: EMPTY STATE - No data found.");
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
