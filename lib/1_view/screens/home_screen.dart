import 'package:amitproject/0_model/recent_jobs_model.dart';
import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/2_controller/home_cubit/home_cubit.dart';
import 'package:amitproject/2_controller/saved_cubit/saved_cubit.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../0_model/suggested_jobs_model.dart';
import '../../utility/app_colors.dart';
import '../../utility/app_strings.dart';
import '../widgets/recent_job_item.dart';
import '../widgets/suggested_jop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void setState(VoidCallback fn) {
    context.read<HomeCubit>().getAllJobs();
    context.read<HomeCubit>().getSuggestedJobs();
    // TODO: implement setState
    super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            title: 'Hi, ${SharedPreference.get(key: 'name')}👋',
                            size: 24,
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          PrimaryText(
                            title: AppStrings.createABetterFuture,
                            size: 14,
                            // fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey.shade300)),
                        child: ImageIcon(
                          AssetImage(AppImages.notification),
                          color: AppColors.neutralBlack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  InputField(
                    onFieldSubmitted: () {},
                    validated: () {},
                    onEditingComplete: () {},
                    onchange: () {},
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.searchScreenRoute);
                    },
                    prefixIcon: ImageIcon(AssetImage(AppImages.searchIcon)),
                    hint: AppStrings.search,
                  ),


                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryText(
                        title: AppStrings.suggestedJob,
                        size: 18,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: PrimaryText(
                            title: AppStrings.viewAll,
                            color: AppColors.primaryColor,
                            size: 14,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 27.h,
                      child:state is LoadingSuggestedDataState?
                          Center(child: SizedBox(
                            width: 10.w,
                              height: 10.h,
                              child: const CircularProgressIndicator()))
                      :
                          state is GetSuggestedDataErrorState?
                    const Center(child: Text("Check Your Inter Net",style: TextStyle(fontSize: 22,color: AppColors.blackColor),))
              :
                      ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: SuggestedJobsModel.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SuggestedItem(index: index));
                    },)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryText(
                        title: AppStrings.recentJob,
                        size: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: PrimaryText(
                            title: AppStrings.viewAll,
                            color: AppColors.primaryColor,
                            size: 14,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 27.h,
                    child: state is LoadingSuggestedDataState?
                    Center(child: SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator()))
                        :
                    ListView.builder(
                      itemCount: RecentJobsModel.data.length,
                      itemBuilder: (context, index) =>
                          RecentJobItem(
                            savedImage: context.read<SavedCubit>().images[index],
                            index: index,
                            name: RecentJobsModel.data[index].name.toString(),
                            compName: RecentJobsModel.data[index].compName.toString(),
                            jobSkill: RecentJobsModel.data[index].jobSkill.toString(),
                            jobTimeType: RecentJobsModel.data[index].jobTimeType
                                .toString(),
                            jobType: RecentJobsModel.data[index].jobType.toString(),
                            location: RecentJobsModel.data[index].location.toString(),
                            salary: RecentJobsModel.data[index].salary.toString(),
                            id: RecentJobsModel.data[index].id.toString(),
                          ),


                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
