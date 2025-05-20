part of 'profile_imports.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileViewmodel>().add(FetchEvent());

    ProfileRepo().getuserposts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        color: MyColors.primarycolor,
        onRefresh: () async {
          await RefreshFunctions.refreshprofile(context, mounted);
        },
        child: BlocListener<DeletePostViewModel, DeletePostStates>(
          listener: (context, state) {
            {
              if (state is DeletePostLoadingState) {
                Utils.showToast(message: "Deleting Post...");
              } else if (state is DeletePostErrorState) {
                Utils.showToast(message: state.error.toString());
              } else if (state is DeletePostSuccessState) {
                Utils.showToast(message: "Post deleted successfully!");
                context.read<ProfileViewmodel>().add(FetchEvent());
              }
            }
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(children: [
              ProfileData(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Posts",
                    style: TextStyle(
                        color: MyColors.blacktextcolor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<ProfileViewmodel, ProfileStates>(
                builder: (context, state) {
                  if (state is ProfileLoadingState ||
                      state is ProfileInitialState) {
                    return Center(child: Text("Fetching Posts..."));
                  } else if (state is ProfileErrorState) {
                    return Center(child: Text(state.error.toString()));
                  } else if (state is ProfileLoadedState) {
                    return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: state.profileModel.posts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                            childAspectRatio: 1.12),
                        itemBuilder: (context, index) {
                          Post userpost = state.profileModel.posts[index];

                          String? featureimage = userpost.featuredimage
                              .toString()
                              .replaceAll("public", "");
                          String? finalimage =
                              "https://techblog.codersangam.com/storage$featureimage";

                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 150,
                              width: 160,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(7.5),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: finalimage,
                                          errorWidget: (context, url, error) {
                                            return Center(
                                              child: Icon(Icons.error),
                                            );
                                          },
                                        )),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        userpost.title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      )),
                                      IconButton(
                                          onPressed: () async {
                                            context
                                                .read<DeletePostViewModel>()
                                                .add(DeletePost(
                                                    id: userpost.id!));
                                          },
                                          icon: Icon(Icons.delete_outline)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }

                  return Center(
                    child: Text("Fetching user posts!")
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
