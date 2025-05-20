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
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController slugcontroller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    titlecontroller.dispose();
    slugcontroller.dispose();
    super.dispose();
  }

  bool ispicked = false;
  File? pickedfile;
  Tag? tagdata;
  EachCategory? categorydata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              child: IconButton(
                  onPressed: () async {
                    final state = context.read<ProfileViewmodel>().state;
                    if (state is ProfileLoadedState) {
                      final userid = state.profileModel.userDetails!.id;
                    
                      final saveuser = await Utils.saveuserid(id: userid!);
                
                    }

                    final user = await Utils.getuserid();
                    // String bodyText =
                    //     jsonEncode(controller.document.toDelta().toJson());

                    context.read<AddpostViewmodel>().add(AddPostSubmit(
                          title: titlecontroller.text.trim(),
                          slug: slugcontroller.text
                              .toLowerCase()
                              .replaceAll(" ", "-"),
                          body: controller.document.toPlainText(),
                          status: 1,
                          featuredimage: pickedfile,
                          tagid: 772,
                          categoryid: 259,
                          userid: user,
                        ));
                  },
                  icon: Icon(
                    Icons.check,
                    color: MyColors.whitecolor,
                  )))
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
            child: BlocConsumer<AddpostViewmodel, AddPostStates>(
              listener: (context, state) {
                if (state is AddPostErrorState) {
                  Utils.showToast(message: state.message);
                } else if (state is AddPostInvalidState) {
                  Utils.showToast(message: state.message);
                } else if (state is AddPostSuccessState) {
                  Utils.showToast(message: state.message.toString());
                  AutoRouter.of(context).canPop();
                  titlecontroller.clear();
                  slugcontroller.clear();
                  controller.clear();
                  setState(() {
                    ispicked = false;
                    pickedfile = null;
                  });
                }
              },
              builder: (context, state) {
                if (state is AddPostLoadingState) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: LoadingAnimationWidget.stretchedDots(
                        color: MyColors.primarycolor,
                        size: 50,
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              ispicked
                                  ? Image.file(
                                      pickedfile!,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      Assets.assetsImagesDefault,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fill,
                                    ),
                              Positioned(
                                  left: 320,
                                  right: 2,
                                  top: 210,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: MyColors.primarycolor,
                                  )),
                            ],
                          ).onTap(() async {
                            File? file = await Utils.pickimage();

                            if (file != null) {
                              setState(() {
                                ispicked = true;
                                pickedfile = file;
                              });
                            } else {
                              Utils.showToast(message: "Image not uploaded!");
                            }
                          })),
                      SizedBox(
                        height: 10,
                      ),
                      VxTextField(
                        fillColor: Colors.transparent,
                        borderColor: MyColors.primarycolor,
                        borderRadius: 10,
                        hint: "Title",
                        borderType: VxTextFieldBorderType.roundLine,
                        controller: titlecontroller,
                      ),
                      SizedBox(
                        height: 12.5,
                      ),
                      VxTextField(
                        fillColor: Colors.transparent,
                        borderColor: MyColors.primarycolor,
                        borderRadius: 10,
                        hint: "Slug",
                        borderType: VxTextFieldBorderType.roundLine,
                        controller: slugcontroller,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          final Tag? tag = await AutoRouter.of(context)
                              .push<Tag>(TagsRoute(navigationType: NavigationType.inner));
                          setState(() {
                            tagdata = tag;
                          });
                        },
                        child: ListTile(
                          title: tagdata == null
                              ? Text("Tags")
                              : Text("${tagdata!.title}"),
                          tileColor: MyColors.whitecolor,
                          trailing: Icon(Icons.arrow_circle_right_outlined),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          final EachCategory? category =
                              await AutoRouter.of(context)
                                  .push<EachCategory>(CategoriesRoute(navigationType: NavigationType.inner));
                          setState(() {
                            categorydata = category;
                          });
                        },
                        child: ListTile(
                          title: categorydata == null
                              ? Text("Categories")
                              : Text("${categorydata!.title}"),
                          tileColor: MyColors.whitecolor,
                          trailing: Icon(Icons.arrow_circle_right_outlined),
                        ),
                      ),
                      FleatherToolbar.basic(controller: controller),
                      IntrinsicHeight(
                          child: KeyboardAvoider(
                            child: FleatherField(
                                                    controller: controller,
                                                    focusNode: FocusNode(canRequestFocus: true),
                                                  ),
                          )),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
