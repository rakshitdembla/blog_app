part of 'home_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    
    context.read<HomeViewmodel>().add(fetchblogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       RefreshIndicator.adaptive(
         onRefresh: () async {
                    await RefreshFunctions.refreshhome(context, mounted);
                  },color: MyColors.primarycolor,
         child: SafeArea(
          child: BlocBuilder<HomeViewmodel, HomeStates>(
            builder: (context, state) {
              if (state is HomeLoadingState || state is HomeInitialState) {
                
                return Center(
                  child: LoadingAnimationWidget.stretchedDots(
                    color: MyColors.primarycolor,
                    size: 50,
                  )
                );
              } else if (state is HomeLoadedState) {
                
         
                return SingleChildScrollView(
                
                   
                  
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          child: Text(
                            "Featured Blogs",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        VxSwiper.builder(
                            viewportFraction: 0.8,
                            scrollDirection: Axis.horizontal,
                            aspectRatio: 18 / 9,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            itemCount: state.bloglist.length,
                            itemBuilder: (context, index) {
                              BlogPost blogpost = state.bloglist[index];
                              return InkWell(
                                onTap: () {
                                  AutoRouter.of(context).push(ViewBlogRoute(blogpost: blogpost));
                                },
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: blogpost.featuredimage.toString(),
                                  errorWidget: (context, url, error) {
                                    return Icon(Icons.error);
                                  },
                                ),
                              );
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Latest Posts"), Text("See All")],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                             physics: NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                              itemCount: state.bloglist.length,
                              itemBuilder: (context, index) {
                                BlogPost blogpost = state.bloglist[index];
                             
                    
                                return InkWell(
                                  onTap: () {
                                    AutoRouter.of(context)
                                        .push(ViewBlogRoute(blogpost: blogpost));
                                  },
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 120.h,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 110.h,
                                            width: 150.w,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Hero(
                                                tag: blogpost.id.toString(),
                                                child: CachedNetworkImage(
                                                  imageUrl: blogpost.featuredimage
                                                      .toString(),
                                                  // placeholder: (context, url) =>
                                                  //     Center(child: CircularProgressIndicator()),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 9, top: 10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    blogpost.title ?? "No Title",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(FeatherIcons.clock,
                                                          size: 20,
                                                          color: Colors.grey),
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
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          blogpost.views == null
                                                              ? "0 Views"
                                                              : "${blogpost.views.toString()} Views",
                                                          style: TextStyle(
                                                              color: Colors.grey)),
                                                      Icon(FeatherIcons.save,
                                                          size: 20,
                                                          color: Colors.grey)
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
                                );
                              }),
                       
                      ],
                    ),
                  
                );
              } else if (state is HomeErrorState) {
               
                return Center(child: Text(state.error.toString()));
              } else {}
             
              return SizedBox();
            },
          ),
               ),
       ),
    );
  }
}
