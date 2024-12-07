class Message {
  final String message;
 final String id ;
  Message(this.message,this.id);

factory Message.fromJson(jasonData){
  return Message(jasonData['messages'],jasonData['id']);
}
}