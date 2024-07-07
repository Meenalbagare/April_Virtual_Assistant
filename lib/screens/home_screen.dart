import 'package:april/bloc/chat_bloc.dart';
import 'package:april/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:april/bloc/chat_bloc.dart';
import 'package:lottie/lottie.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController userInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: BlocConsumer<ChatBloc,ChatState> (
        bloc: chatBloc,
        listener: (context,state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<MessageModel> messages =
                  (state as ChatSuccessState).messages;

              return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/april.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/april_perslogo.png',
                                    height: 60,
                                  ),
                                  Text("APRIL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30,
                                      letterSpacing: 2,
                                    ),),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.image_search,
                                        color: Colors.white)),
                              )

                            ],
                          ),
                        ),
                        Expanded(child: ListView.builder(
                          itemCount: messages.length,
                          itemBuilder:  (context,index){
                          return Container(
                              margin: const EdgeInsets.only(bottom:12,left: 10,right: 10),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.grey.shade900,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    messages[index].role == "user"
                                        ? "User"
                                        : "April",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            messages[index].role =="user"
                                              ? Colors.purple.shade200
                                              :  Colors.purple.shade200),
                              ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                                messages[index].parts.first.text,
                                style: TextStyle(height: 1.2),
                            ),
                            ],
                            ));
                        })),
                        if (chatBloc.generating)
                          Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Lottie.asset('assets/generating.json')
                              ),
                              const SizedBox(width: 1,height:1),
                              Text("Loading...")
                            ],
                          ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(child: TextField(
                                controller: userInput,
                                style: TextStyle(color: Colors.black),
                                cursorColor: Theme
                                    .of(context)
                                    .primaryColor,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(

                                          color: Theme
                                              .of(context)
                                              .primaryColor
                                      ),
                                    )),

                              )),
                              const SizedBox(width: 12),
                              InkWell(
                                onTap: (){
                                  if(userInput.text.isNotEmpty) {
                                    String text = userInput.text;
                                    userInput.clear();
                                    chatBloc.add(ChatGenerateNewTextMessageEvent(inputMessage: text));
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 32,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.deepPurpleAccent,
                                    child: Center(
                                      child: Icon(
                                        Icons.send, color: Colors.white,),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ]
                  )
              );
            default:

              return SizedBox();
          }
    },
    ),
    );
  }
}
