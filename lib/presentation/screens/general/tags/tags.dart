part of 'tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              FeatherIcons.plus,
              color: MyColors.whitecolor,
            ),
          )
        ],
        title: Text(
          "Tags",
          style: TextStyle(color: MyColors.whitetextcolor),
        ),
        centerTitle: true,
        backgroundColor: MyColors.primarycolor,
      ),
      body: BlocBuilder<TagsViewmodel,TagsStates>(
        buildWhen: (previous, current) => previous != current, 
        builder: (context, state) {
          if (state is TagsInitialState || state is TagsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TagsLoadedState) {
            return Column(
              children: [
                Flexible(
                    child: ListView.separated(
                        itemBuilder: (context, index) {

                          Tag tagdata = state.tags[index];
                          
                           return Card(
                              color: MyColors.whitecolor,
                              child: Container(
                                height: 60,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Row(
                                    children: [
                                      Text(
                                       tagdata.id.toString(),
                                        style: TextStyle(
                                            color: MyColors.blacktextcolor),
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Text(
                                        tagdata.title.toString(),
                                        style: TextStyle(
                                            color: MyColors.blacktextcolor),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Spacer(
                                        flex: 2,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.grey,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );},
                        separatorBuilder: (context, index) => SizedBox(
                              height: 6,
                            ),
                        itemCount: state.tags.length ))
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
    );
  }
}
