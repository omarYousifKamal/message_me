import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messagegame_app/screens/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User signedInUser;
  String? messageText; //ڤاریه‌بلی مه‌سیجه‌كه‌
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  //فه‌حسی ده‌كات ئایه‌ به‌كارهێنه‌ر هاتیته‌ ناو ئه‌پ یان نا
  //لێره‌ش ته‌نها ئه‌و یوسه‌ه‌ وه‌ده‌گری كه ناوی تۆمار كردیه
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //   //ئه‌وه‌ لێره ئه‌و كۆلێكشنه‌یه‌ كه كۆنیكته به‌ فاریه‌به‌یسه‌كه‌ت
  //   final messages = await _firestore.collection('messages').get();
  //   // لۆ پیشاندانی هه‌موو شته‌كانی ناو كۆلیكشنه‌كه‌
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }
  void messagesStreams() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(
          children: [
            Image.asset('images/logo.png', height: 25),
            SizedBox(width: 10),
            Text('MessageMe'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              messagesStreams();
              // _auth.signOut();
              // Navigator.pop(context);
            },
            icon: const Icon(Icons.download),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //لێره ئه‌و فه‌نكشنه‌ی دروستمان كردیه لۆ پیشاندانی زانیاریه‌كان له ئه‌په‌كه‌
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  List<Text> messageWidgets = [];
                  if (!snapshot.hasData) {
                    // لێره سپینه‌ر زیاد بكه‌ ئه‌گه‌ داتا زۆربوو
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      ),
                    );
                  }
                  final messages = snapshot.data!.docs;
                  for (var message in messages) {
                    final messageText = message.get('text');
                    final messageSender = message.get('sender');
                    final messageWidget = Text('$messageText - $messageSender');
                    messageWidgets.add(messageWidget);
                  }
                  return Column(
                    children: messageWidgets,
                  );
                }),
            Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                // ignore: prefer_const_constructors
                border: Border(
                  // ignore: prefer_const_constructors
                  top: BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': signedInUser.email,
                      });
                    },
                    child: Text(
                      'send',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
