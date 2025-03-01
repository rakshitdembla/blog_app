part of 'addpost_imports.dart';

class Addpost extends StatefulWidget {
  const Addpost({super.key});

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  @override
  FleatherController controller =
      FleatherController(document: ParchmentDocument());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primarycolor,
        automaticallyImplyLeading: false,
        title: Text(
          "Add Post",
          style: TextStyle(color: MyColors.whitetextcolor, fontSize: 19),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.check,
                color: MyColors.whitecolor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
          child: Column(
            children: [
               ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    Assets.assetsImagesNetflix,
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 10,),
              
              const VxTextField(
                fillColor: Colors.transparent,
                borderColor: MyColors.primarycolor,
                borderRadius: 10,
                hint: "Title",
                borderType: VxTextFieldBorderType.roundLine,
              ),
              SizedBox(
                height: 12.5,
              ),
              const VxTextField(
                fillColor: Colors.transparent,
                borderColor: MyColors.primarycolor,
                borderRadius: 10,
                hint: "Slug",
                borderType: VxTextFieldBorderType.roundLine,
              ),
               SizedBox(height: 15,),
              ListTile(
                title: Text("Tags"),
                tileColor: MyColors.whitecolor,
                trailing: Icon(Icons.arrow_circle_right_outlined),
              ),
               SizedBox(height: 10,),
              ListTile(
                title: Text("Categories"),
                tileColor: MyColors.whitecolor,
                trailing: Icon(Icons.arrow_circle_right_outlined),
              ),
              FleatherToolbar.basic(controller: controller!),
              IntrinsicHeight(child:  FleatherField(controller: controller,focusNode:FocusNode(canRequestFocus: true) ,)),
             
            ],
          ),
        ),
      ),
    );
  }
}
