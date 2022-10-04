class Message{
  late String? userId;
  late String massage,time;

  Message({this.userId, required this.massage, required this.time});

  Message.fromJson(Map<String,dynamic> json){
    userId=json['user_id'].toString();
    massage=json['message'];
    time=json['time'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'massage ${massage}\n';
  }
}