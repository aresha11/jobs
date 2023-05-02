import 'package:amitproject/0_model/saved_jobs_model.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/1_view/widgets/saved_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_images.dart';

class SavedItem extends StatelessWidget {
   SavedItem({Key? key,required this.index}) : super(key: key);
   int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          barrierColor: Colors.black45,
            context: context,
            builder: (context) {
              return  SavedBottomSheet(id: SavedJobs.data[index].id.toString(),index: index,);
            },);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Row(
              children: [
                ImageIcon(AssetImage(AppImages.profile)),
                SizedBox(width: 1.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(
                          title: SavedJobs.data[index].name.toString(), size: 18,fontWeight: FontWeight.w500,
                      ),
                      PrimaryText(title: "${SavedJobs.data[index].location.toString()} ", size: 12,fontWeight: FontWeight.w400,)
                    ],
                  ),
                ),
                ImageIcon(AssetImage(AppImages.more)),
              ],
            ),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Expanded(child: PrimaryText(title: "Posted 2 days ago", size: 12,fontWeight: FontWeight.w400,)),
                ImageIcon(AssetImage(AppImages.greenClock)),
                PrimaryText(title: "Be an early applicant", size: 12,fontWeight: FontWeight.w400,),

              ],
            ),
            SizedBox(height: 1.h,),
            const Divider(height: 1,thickness: 1,),
            SizedBox(height: 1.h,),
          ],
        ),
      ),
    );
  }
}
