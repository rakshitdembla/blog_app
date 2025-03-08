part of 'tags_imports.dart';

@RoutePage()
class Tags extends StatefulWidget {
  final NavigationType navigationType;
  const Tags({super.key,required this.navigationType});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  void initState() {
    context.read<TagsViewmodel>().add(fetchtags());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () async {
                  final result =
                      await AutoRouter.of(context).push(AddtagRoute());
                  if (result == true) {
                    if (context.mounted) {
                      context.read<TagsViewmodel>().add(fetchtags());
                    }
                  }
                },
                icon: Icon(
                  FeatherIcons.plus,
                  color: MyColors.whitecolor,
                )),
          )
        ],
        title: Text(
          "Tags",
          style: TextStyle(color: MyColors.whitetextcolor),
        ),
        centerTitle: true,
        backgroundColor: MyColors.primarycolor,
      ),
      body: RefreshIndicator.adaptive(
        color: MyColors.primarycolor,
        onRefresh: () async {
          await RefreshFunctions.refreshtags(context, mounted);
        },
        child: BlocBuilder<TagsViewmodel, TagsStates>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is TagsLoadingState) {
              return Center(
                  child: LoadingAnimationWidget.stretchedDots(
                color: MyColors.primarycolor,
                size: 50,
              ));
            } else if (state is TagsLoadedState) {
              return Column(
                children: [
                  BlocListener<DeleteTagViewModel, DeleteTagStates>(
                      listener: (context, state) {
                        if (state is DeleteTagLoadingState) {
                          Utils.showToast(message: "Deleting Tag...");
                        } else if (state is DeleteTagSuccessState) {
                          Utils.showToast(
                              message: state.messageModel.message.toString());
                          context.read<TagsViewmodel>().add(fetchtags());
                        } else if (state is DeleteTagErrorState) {
                          Utils.showToast(message: state.error.toString());
                        }
                      },
                      child: Flexible(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                Tag tagdata = state.tags[index];

                                return InkWell(
                                  onTap: () {

                                    if (widget.navigationType == NavigationType.inner) {
                                    AutoRouter.of(context)
                                        .popForced<Tag>(tagdata);}

                                        else {}
                                  },
                                  child: Card(
                                    color: MyColors.whitecolor,
                                    child: SizedBox(
                                      height: 60.h,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 14),
                                        child: Row(
                                          children: [
                                            Text(
                                              (index + 1).toString(),
                                              style: TextStyle(
                                                  color:
                                                      MyColors.blacktextcolor),
                                            ),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Text(
                                              tagdata.title.toString(),
                                              style: TextStyle(
                                                  color:
                                                      MyColors.blacktextcolor),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Spacer(
                                              flex: 2,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  NavigationsData
                                                      .UpdateTagNavigation(
                                                          context,
                                                          mounted,
                                                          tagdata);
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.grey,
                                                )),
                                            IconButton(
                                                onPressed: () async {
                                                  context
                                                      .read<
                                                          DeleteTagViewModel>()
                                                      .add(DeleteTag(
                                                          id: tagdata.id ?? 0));
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 6.h,
                                  ),
                              itemCount: state.tags.length))),
                ],
              );
            } else if (state is TagsErrorState) {
              return Center(
                child: Text(state.errormsg.toString()),
              );
            } else {
              return Center(
                child: Text("An error occured!"),
              );
            }
          },
        ),
      ),
    );
  }
}
