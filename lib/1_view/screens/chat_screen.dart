import 'package:amitproject/0_model/chat_model.dart';
import 'package:amitproject/0_model/recent_jobs_model.dart';
import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/2_controller/chat_cubit/chat_cubit.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_images.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key, this.index = 0,}) : super(key: key);
  int index;


  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChatCubit>().getAllMessages(RecentJobsModel.data![widget.index].id.toString());
  }

  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController();
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffD1D1D1),
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: AppColors.blackColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Row(
              children: [
                Image.asset(AppImages.home),
                Text(
                  RecentJobsModel.data[widget.index].name.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            actions: [ImageIcon(AssetImage(AppImages.more),color: Colors.black,),SizedBox(width: 3.w,)],
          ),
          body: ListView.builder(
            itemCount: ChatModel.data!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                child:
                    ChatModel.data!.isEmpty?
                    const Center(
                      child: Text("THere Is no Chat ",style: TextStyle(color: Colors.black,fontSize: 50),),
                    )
                        :
                  ChatModel.data![index].senderUser.toString() == "user"
                      ?  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 2.h),
                                padding: EdgeInsets.all(2.8.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius:BorderRadius.only(topLeft: Radius.circular(5.sp),bottomRight: Radius.circular(5.sp),bottomLeft: Radius.circular(5.sp),),
                                ),
                                child: Text(
                                  ChatModel.data![index].massage.toString(),
                                  style:
                                      TextStyle(fontSize: 12.sp, color: Colors.black),
                                ),
                              ),
                            ],
                          )

                      :

                  Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 2.h),
                                padding: EdgeInsets.all(2.8.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xffE5E7EB),
                                  borderRadius:BorderRadius.only(topRight: Radius.circular(5.sp),bottomRight: Radius.circular(5.sp),bottomLeft: Radius.circular(5.sp),),
                                ),
                                child: Text(
                                  ChatModel.data![index].massage.toString(),
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                ),
                              ),
                               SizedBox(width: 4.w,)
                            ],
                          )


                
              );
            },
          ),
          bottomSheet: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffD1D5DB),
                  radius: 6.5.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 6.w,
                    child: ImageIcon(
                      AssetImage(AppImages.sendPhoto),
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.5.w,
                ),
                Expanded(
                    child: InputField(
                  controller: messageController,
                  maxLines: 1,
                  onFieldSubmitted: (String value) {},
                  radius: 50,
                  validated: () {},
                  onchange: (value) {
                    context.read<ChatCubit>().changIcon(value);
                  },
                  onEditingComplete: () {},
                  hint: "Write Message...",
                )),
                SizedBox(
                  width: 1.5.w,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xffD1D5DB),
                  radius: 6.5.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 6.w,
                    child: InkWell(
                        onTap: () {
                          context.read<ChatCubit>().userSentMessage(
                              message: messageController.text,
                              comp_id: "8",
                              context: context);
                        },
                        child: ImageIcon(
                          context.read<ChatCubit>().sendIcon,
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
