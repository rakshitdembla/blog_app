part of 'addtag_imports.dart';

@RoutePage()
class Addtag extends StatefulWidget {
  const Addtag({super.key});

  @override
  State<Addtag> createState() => _AddtagState();
}

class _AddtagState extends State<Addtag> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController  slugcontroller= TextEditingController();

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
        automaticallyImplyLeading: true,
        title: Text(
          "Add Post",
          style: TextStyle(color: MyColors.whitetextcolor, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<AddtagViewmodel, AddtagStates>(
            listener: (context, state) {
          if (state is AddtagErrorState) {
            Utils.showToast(message: state.error.toString());
          } else if (state is AddtagSuccessState) {
            Utils.showToast(message: "Tag added successfully!");
            Navigator.of(context).pop(true);
          }
        }, builder: (context, state) {
          if (state is AddtagLoadingState) {
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
                      name: "Submit",
                      onPressed: () {
                        if (titlecontroller.text.trim().isEmpty || slugcontroller.text.trim().isEmpty ) {
                          Utils.showToast(message: "Fields can not be empty!");
                        } else {
                          context.read<AddtagViewmodel>().add(AddtagEvent(
                              slug: slugcontroller.text
                                  .toLowerCase()
                                  .toString()
                                  .replaceAll(" ", "-"),
                              title: titlecontroller.text.toString()));
                        }
                      })
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
