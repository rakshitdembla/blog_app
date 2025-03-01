part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
                color: MyColors.primarycolor,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Icon(
                    Icons.logout,
                    color: MyColors.whitecolor,
                  ),
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 55,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rakshit Dembla",
                  style: TextStyle(
                      color: MyColors.whitetextcolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "rakshitdembla@gmail.com",
                  style: TextStyle(color: MyColors.whitetextcolor),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Rakshit Dembla has currently showed interest in Flutter despite of having BBA as an degree he still decides to follow his passion of technical field",
                  style: TextStyle(color: MyColors.whitetextcolor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "6",
                          style: TextStyle(
                              color: MyColors.whitetextcolor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Posts",
                          style: TextStyle(color: MyColors.whitetextcolor),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                              color: MyColors.whitetextcolor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Following",
                          style: TextStyle(color: MyColors.whitetextcolor),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "899",
                          style: TextStyle(
                              color: MyColors.whitetextcolor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(color: MyColors.whitetextcolor),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
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
        Flexible(
          child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.12),
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(7.5),
                          child: Image.asset(
                            Assets.assetsImagesNetflix,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Netflix will charge a fees for sharing account passwords....",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert_outlined))
                          ],
                        )
                      ],
                    ),
                  )),
        )
      ]),
    );
  }
}
