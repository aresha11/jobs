import 'package:amitproject/0_model/recent_jobs_model.dart';
import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/1_view/widgets/message_row.dart';
import 'package:amitproject/2_controller/chat_cubit/chat_cubit.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_back_outlined)),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Messages",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                      fontSize: 18.sp),
                ),
              )),
              Text("               "),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              Expanded(
                child: InputField(
                  onFieldSubmitted: (){},
                  radius: 40,
                  onchange: () {},
                  onEditingComplete: () {},
                  validated: () {},
                  hint: "Search Messages...",
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(AppImages.searchIcon),
                        color: AppColors.blackColor,
                        size: 10.w,
                      )),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              CircleAvatar(
                radius: 21.sp,
                backgroundColor: Color(0xffD1D5DB),
                child: CircleAvatar(
                    radius: 20.sp,
                    backgroundColor: Colors.white,
                    child: ImageIcon(
                      AssetImage(
                        AppImages.filter,
                      ),
                      color: AppColors.blackColor,
                    )),
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            height: 64.h,
            child: ListView.builder(
              itemCount: context.read<ChatCubit>().chats.length,
                itemBuilder: (context, index) => MessageRow(index: index,),),
          )
        ],
      ),
    ));
  }
}
