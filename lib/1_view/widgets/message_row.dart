import 'package:amitproject/0_model/recent_jobs_model.dart';
import 'package:amitproject/1_view/screens/chat_screen.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/chat_cubit/chat_cubit.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
class MessageRow extends StatelessWidget {
  MessageRow({Key? key,required this.index}) : super(key: key);
int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(index: index,)));
      },
      child: Container(
        child:Row(
          children: [
            Image.asset(AppImages.home),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // PrimaryText(title: context.read<ChatCubit>().chats[index]["data"]["name"].toString(),size: 22.sp,fontWeight: FontWeight.w500,),
                  PrimaryText(title: "message",size: 15.sp,fontWeight: FontWeight.w400,),
                ],
              ),
            ),
            Text("12")
          ],
        ),
      ),
    );
  }
}
