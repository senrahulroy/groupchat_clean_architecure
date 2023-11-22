import 'package:flutter/material.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/home/chat_screen/single_chat_screen.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/home/tabBarScreen/groupCreation/create_new_group_screen.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/single_item_group_widget.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return  SingleItemGroupWidget(
                    onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                         return const SingleChatScreen();
                       },));
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          /// go to Create Group screen
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CreateNewGroupScreen();
          },));
      },
        child: const Icon(Icons.group_add),
      ),
    );
  }
}
