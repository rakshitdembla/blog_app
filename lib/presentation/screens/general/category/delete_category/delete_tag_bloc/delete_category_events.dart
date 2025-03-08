abstract class DeleteCategoryEvents {}

class DeleteCategory extends DeleteCategoryEvents{
  int id;
  DeleteCategory({required this.id});
}