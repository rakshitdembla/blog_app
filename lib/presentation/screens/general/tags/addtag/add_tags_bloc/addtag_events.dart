abstract class AddtagEvents {}

class AddtagEvent extends AddtagEvents{
  String title;
  String slug;
  AddtagEvent({required this.slug,required this.title});
}