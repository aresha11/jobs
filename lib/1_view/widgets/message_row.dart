import 'package:amitproject/0_model/chat_model.dart';
import 'package:amitproject/0_model/recent_jobs_model.dart';
import 'package:amitproject/0_model/suggested_jobs_model.dart';
import 'package:amitproject/1_view/screens/chat_screen.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/chat_cubit/chat_cubit.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:amitproject/2_controller/chat_cubit/chat_cubit.dart';

import '../../utility/app_colors.dart';
class MessageRow extends StatelessWidget {
  MessageRow({Key? key,required this.index}) : super(key: key);
int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            context.read<ChatCubit>().getAllMessages(SuggestedJobsModel.data[index].id.toString());
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(index: index,)));
            print(SharedPreference.get(key: 'token'));
          },
          child: Container(
            child:Row(
              children: [
                Image.asset(AppImages.profile),
                SizedBox(width: 4.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(title:SuggestedJobsModel.data[index].compName.toString(),size: 15.sp,fontWeight: FontWeight.w400,),
                     // PrimaryText(title:ChatModel.data[index].massage.toString(),size: 10.sp,fontWeight: FontWeight.w400,color: AppColors.neutral500,),
                    ],
                  ),
                ),
                Text("12")
              ],
            ),
          ),
        ),
        SizedBox(height: 3.h,),
        Divider(
          color: AppColors.blackColor,
          indent: 10.w,
        ),
        SizedBox(height: 1.h,),
      ],
    );
  }
}
