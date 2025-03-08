abstract class DeleteTagEvents {}

class DeleteTag extends DeleteTagEvents{
  int id;
  DeleteTag({required this.id});
}