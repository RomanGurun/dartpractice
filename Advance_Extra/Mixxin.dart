void main(){
  User().postComment();
  Moderator().postComment();
  Moderator().deleteComment();
Publisher().postComment();
Publisher().publishArticle();

Admin().postComment();
Admin().publishArticle();
Admin().deleteComment();




}

class User{
  void postComment(){
    print("Posted Comment");
  }
}
class Moderator extends User{
  void deleteComment(){
    print("Comment is deleted");
  }
}
class Publisher extends User with CanPublishArticle{

}
class Admin extends Moderator with CanPublishArticle{

}
mixin CanPublishArticle{
void publishArticle(){
  print('Article Published');



}
}
  