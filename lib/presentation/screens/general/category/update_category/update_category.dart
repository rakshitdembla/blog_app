part of "update_category_imports.dart";

@RoutePage()
class UpdateCategory extends StatefulWidget {
  final EachCategory category;
  const UpdateCategory({super.key, required this.category});

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController slugcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    titlecontroller.text = widget.category.title ?? "can't edit this tag";
    slugcontroller.text = widget.category.slug ?? "can't edit this slug";
  }

  @override
  void dispose() {
    titlecontroller.dispose();
    slugcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primarycolor,
        iconTheme: IconThemeData(color: MyColors.whitecolor),
        automaticallyImplyLeading: true,
        title: Text(
          "Update Category",
          style: TextStyle(color: MyColors.whitetextcolor, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<UpdatecategoryViewmodel, UpdatecategoryStates>(
          listener: (context, state) {
            if (state is UpdatecategorySuccessState) {
              Navigator.of(context).pop(true);
              Utils.showToast(
                  message: state.messageModel.message.toString());
            } else if (state is UpdatecategoryErrorState) {
              Utils.showToast(message: state.error.toString());
            }
          },
          builder: (context, state) {
            if (state is UpdatecategoryLoadingState ) {
              return Center(
                  child: LoadingAnimationWidget.stretchedDots(
                color: MyColors.primarycolor,
                size: 50,
              ));
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  children: [
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
                    Spacer(),
                    commonelevatedbutton(
                        name: "Update",
                        onPressed: () {
                          context.read<UpdatecategoryViewmodel>().add(
                              UpdatecategoryEvent(
                                  slug:
                                      slugcontroller
                                          .text
                                          .toLowerCase()
                                          .toString()
                                          .replaceAll(" ", "-"),
                                  title:
                                      titlecontroller.text.toString().trim(),
                                  id: widget.category.id ?? 0));
                        }),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
