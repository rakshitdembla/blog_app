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
      body: Column(
        children: [
          Flexible(
              child: ListView.separated(
                  itemBuilder: (context, index) => Card(
                        color: MyColors.whitecolor,
                        child: Container(
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Row(
                              children: [
                                Text(
                                  index.toString(),
                                  style: TextStyle(color: MyColors.blacktextcolor),
                                ),
                                Spacer(flex: 1,),
                                
                                Text(
                                  "Tags here",
                                  style: TextStyle(color: MyColors.blacktextcolor),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                 Spacer(flex: 2,),
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
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 6,
                      ),
                  itemCount: 15))
        ],
      ),
    );
  }
}
