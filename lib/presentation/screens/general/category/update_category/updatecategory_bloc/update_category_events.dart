abstract class UpdatecategoryEvents {}

class UpdatecategoryEvent extends UpdatecategoryEvents{
  String title;
  String slug;
  int id;
  UpdatecategoryEvent({required this.slug,required this.title,required this.id});
}