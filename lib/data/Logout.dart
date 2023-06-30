import 'dart:convert';
import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/src/pages/Login.dart';


main() async {
    var headers = {"Content-Type": "application/json", "Accept" : "application/json"};
     
    var request = http.Request(
      'POST',
      Uri.parse(
        "https://face-recon.onrender.com/api/user"
      ) 
    );
    request.body = json.encode(
      {
        
      }
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200){
      //print(await response.stream.bytesToString());
      Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context) => LoginScreen() ));
    // Navigator.push(context, MaterialPageRoute(builder: ((context) => home())));
    }else{
      print(response.reasonPhrase);
    }
   

}

class Post {
  final String username;
  Post ({required this.username});
  factory Post.fromJson(Map<String, dynamic> json){
    return Post (
      username: json['username']
      );
  }
}
