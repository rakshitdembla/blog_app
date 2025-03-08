abstract class UpdatetagEvents {}

class UpdatetagEvent extends UpdatetagEvents{
  String title;
  String slug;
  int id;
  UpdatetagEvent({required this.slug,required this.title,required this.id});
}