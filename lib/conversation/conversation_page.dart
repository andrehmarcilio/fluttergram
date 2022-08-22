import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/conversation/conversation_states.dart';


import '../home/widgets/chat_item.dart';
import 'conversation_bloc.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationBloc, ConversationsState>(
      builder: (context, state) {
        if (state is ConversationsLoaded) {
        return ListView.separated(
          reverse: true,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(left: 70.0),
              child: Divider(
                thickness: 1,
              ),
            );
          },
          itemCount: state.conversations.length,
          itemBuilder: (context, index) =>  ChatItem(conversation: state.conversations[index], position: index,));
      }
      if(state is ConversationsInitialState || state is ConversationsLoading) {
        return const Center(child: CircularProgressIndicator(),);
      }
      if(state is ConversationsEmpty) {
        return const Center(child: Text('Nenhuma conversa inciada!'),);
      }
       if(state is ConversationsError) {
       return const Center(child: Text('Unknow Error'),);
      }
      return Container();
      

      } 
    );
  } 
}
