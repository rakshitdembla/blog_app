part of "settings_imports.dart";

@RoutePage()
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

bool demo = false;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings".i18n,
          style: TextStyle(color: MyColors.whitetextcolor),
        ),
        iconTheme: IconThemeData(color: MyColors.whitecolor),
        backgroundColor: MyColors.primarycolor,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text("Language".i18n,
                  style: TextStyle(
                      color: MyColors.blacktextcolor,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: LanguageModel.languagelist.length,
                itemBuilder: (context, index) {
                  LanguageModel language = LanguageModel.languagelist[index];
                  return ListTile(
                    leading: Text(
                      language.title.toString(),
                      style: TextStyle(
                          fontSize: 16, color: MyColors.blacktextcolor),
                    ),
                    trailing: Switch.adaptive(
                        activeTrackColor: MyColors.primarycolor,
                        value: language.locale == I18n.locale,
                        onChanged: (value) async {
                          I18n.of(context).locale = language.locale;
                        }),
                  );
                }),
          )
        ],
      ),
    );
  }
}
