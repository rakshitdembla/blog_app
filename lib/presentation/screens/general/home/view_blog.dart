part of 'home_imports.dart';

class ViewBlog extends StatefulWidget {
  const ViewBlog({super.key});

  @override
  State<ViewBlog> createState() => _ViewBlogState();
}

class _ViewBlogState extends State<ViewBlog> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primarycolor,
        iconTheme: IconThemeData(color: MyColors.whitecolor),
        centerTitle: true,
        title: Text(
          "Netflix will charge money for sharing account passwords",
          style: TextStyle(
              color: MyColors.whitecolor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Assets.assetsImagesNetflix,
                width: MediaQuery.of(context).size.width,
                height: 250,
                fit: BoxFit.fill),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 
              10),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ Text(
                "Netflix will charge money for sharing Account password!",
                style: TextStyle(
                    color: MyColors.blacktextcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    FeatherIcons.eye,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5,),
                  Text(
                    "147 View",
                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),
                    
                  ),
                  Spacer(),
                  Icon(
                    FeatherIcons.thumbsUp,
                    color: Colors.green,
                    size: 20,
                  ),
                  
                  Text("0"),
                  SizedBox(width: 10,),
                  Icon(
                    FeatherIcons.thumbsDown,
                    color: Colors.red,
                    size: 20,
                  ),
                  Text("0"),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  "tgggggggggggggggggg")],),
            )
           
          ],
        ),
      ),
    );
  }
}