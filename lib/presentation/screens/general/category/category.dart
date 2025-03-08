part of 'category_imports.dart';

@RoutePage()
class Categories extends StatefulWidget {
  final NavigationType navigationType;
  const Categories({super.key,required this.navigationType});

  @override
  State<Categories> createState() => _TagsState();
}

class _TagsState extends State<Categories> {
  @override
  void initState() {
    context.read<CategoryViewmodel>().add(fetchcategory());

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
                await NavigationsData.AddCategoryNavigation(context, mounted);
                },
                icon: Icon(
                  FeatherIcons.plus,
                  color: MyColors.whitecolor,
                )),
          )
        ],
        title: Text(
          "Categories",
          style: TextStyle(color: MyColors.whitetextcolor),
        ),
        centerTitle: true,
        backgroundColor: MyColors.primarycolor,
      ),
      body: RefreshIndicator.adaptive(
        color: MyColors.primarycolor,
        onRefresh: () async {
          await RefreshFunctions.refreshcategories(context, mounted);
        },
        child: BlocBuilder<CategoryViewmodel, categoryStates>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is categoryInitialState || state is categoryLoadingState) {
              return Center(
                  child: LoadingAnimationWidget.stretchedDots(
                color: MyColors.primarycolor,
                size: 50,
              ));
            } else if (state is categoryLoadedState) {
              return Column(
                children: [
                  BlocListener<DeleteCategoryViewModel, DeleteCategoryStates>(
                      listener: (context, state) {
                        if (state is DeleteCategoryLoadingState) {
                          Utils.showToast(message: "Deleting Category...");
                        } else if (state is DeleteCategorySuccessState) {
                          Utils.showToast(
                              message: state.messageModel.message.toString());
                          context.read<CategoryViewmodel>().add(fetchcategory());
                        } else if (state is DeleteCategoryErrorState) {
                          Utils.showToast(message: state.error.toString());
                        }
                      },
                      child: Flexible(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                EachCategory categorydata = state.category[index];
                           
                            
        
                                return InkWell(
                                  onTap: () {
                                    
                                    if (widget.navigationType == NavigationType.inner) {
                                    AutoRouter.of(context).popForced(categorydata);} else{}
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
                                                  color: MyColors.blacktextcolor),
                                            ),
                                           
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Text(
                                              categorydata.title.toString(),
                                              style: TextStyle(
                                                  color: MyColors.blacktextcolor),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Spacer(
                                              flex: 2,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  NavigationsData
                                                      .UpdateCategoryNavigation(context,
                                                          mounted, categorydata);
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.grey,
                                                )),
                                            IconButton(
                                                onPressed: () async {
                                                  context
                                                      .read<DeleteCategoryViewModel>()
                                                      .add(DeleteCategory(
                                                          id: categorydata.id ?? 0));
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
                              itemCount: state.category.length))),
                ],
              );
            } else if (state is categoryErrorState) {
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

