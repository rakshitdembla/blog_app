abstract class AddcategoryEvents {}

class AddcategoryEvent extends AddcategoryEvents{
  String title;
  String slug;
  AddcategoryEvent({required this.slug,required this.title});
}