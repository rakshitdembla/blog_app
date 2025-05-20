import 'import_exports.dart';

class AppBlocProviders {
  static List<BlocProvider> getProviders(BuildContext context) {
    Repository repository = context.read<Repository>();

    return [
      BlocProvider<TagsViewmodel>(
          create: (context) =>
              TagsViewmodel(repository: context.read<Repository>())),
      BlocProvider<CategoryViewmodel>(
          create: (context) =>
              CategoryViewmodel(repository: context.read<Repository>())),
      BlocProvider<LoginViewmodel>(
        create: (context) =>
            LoginViewmodel(repository: context.read<Repository>()),
      ),
      BlocProvider<LogoutViewmodel>(
          create: (context) =>
              LogoutViewmodel(repository: context.read<Repository>())),
      BlocProvider<HomeViewmodel>(
          create: (context) =>
              HomeViewmodel(repository: context.read<Repository>())),
      BlocProvider<ProfileViewmodel>(
          create: (context) =>
              ProfileViewmodel(repository: context.read<Repository>())),
      BlocProvider<AddtagViewmodel>(
          create: (context) =>
              AddtagViewmodel(repository: context.read<Repository>())),
      BlocProvider<AddcategoryViewmodel>(
          create: (context) =>
              AddcategoryViewmodel(repository: context.read<Repository>())),
      BlocProvider<UpdatetagViewmodel>(
          create: (context) =>
              UpdatetagViewmodel(repository: context.read<Repository>())),
      BlocProvider<UpdatecategoryViewmodel>(
          create: (context) =>
              UpdatecategoryViewmodel(repository: context.read<Repository>())),
      BlocProvider<DeleteTagViewModel>(
          create: (context) =>
              DeleteTagViewModel(repository: context.read<Repository>())),
      BlocProvider<DeleteCategoryViewModel>(
          create: (context) =>
              DeleteCategoryViewModel(repository: context.read<Repository>())),
      BlocProvider<RegisterViewmodel>(
          create: (context) =>
              RegisterViewmodel(repository: context.read<Repository>())),
      BlocProvider<AddpostViewmodel>(
          create: (context) =>
              AddpostViewmodel(repository: context.read<Repository>())),
      BlocProvider<DeletePostViewModel>(
          create: (context) =>
              DeletePostViewModel(repository: context.read<Repository>())),
    ];
  }
}
