abstract class DeletePostEvents {}

class DeletePost extends DeletePostEvents{
  int id;
  DeletePost({required this.id});
}