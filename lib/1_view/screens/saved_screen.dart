import 'package:amitproject/0_model/saved_jobs_model.dart';
import 'package:amitproject/1_view/widgets/saved_item.dart';
import 'package:amitproject/2_controller/saved_cubit/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_colors.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<SavedCubit>().getAllSavedJobs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavedCubit, SavedState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_outlined)),
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Saved",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackColor,
                                  fontSize: 18.sp),
                            ),
                          )),
                      const Text("               "),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 5.h,
                    color: const Color(0xffE5E7EB),
                    child: Text(" ${SavedJobs.data.length}Job Saved"),
                  ),

                  SizedBox(
                    height: 73.h,
                    child: state is GetSavedJobsLoadingState?
                     Center(child: Container(
                       height: 15.h,
                        width: 10.w,
                        child: CircularProgressIndicator()))
                    :

                    SavedJobs.data.isEmpty?

                       const Center(child:
                       Text("No DATA")  ,):
                    ListView.builder(
                      itemCount: SavedJobs.data.length,
                      itemBuilder: (context, index) {
                        return SavedItem(index: index);
                      },)
                  )

                ],
              ),
            )
        );
      },
    );
  }
}
