import 'package:amitproject/0_model/searchFilteringModel.dart';
import 'package:amitproject/1_view/widgets/bottom_sheet.dart';
import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/1_view/widgets/main_search_filter_item.dart';
import 'package:amitproject/1_view/widgets/main_search_item.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/1_view/widgets/search_row.dart';
import 'package:amitproject/1_view/widgets/secondary_text.dart';
import 'package:amitproject/2_controller/database/local/recent_searched/recent_searched_cubit.dart';
import 'package:amitproject/2_controller/search_cubit/search_cubit.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:amitproject/utility/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../0_model/search_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context
    //     .read<SearchCubit>()
    //     .searchFilterJobs("", "", "", searchController: searchController);
  }

  @override
  Widget build(BuildContext context) {
    List recent = [
      "Junior UI Designer",
      "Junior UX Designer",
      "Product Designer",
      "Project Manager",
      "UI/UX Designer",
      "Front-End Developer"
    ];
    List popular = [
      "UI/UX Designer",
      "Project Manager",
      "Product Designer",
      "UX Designer",
      "Front-End Developer"
    ];

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_outlined),
                  ),
                  SizedBox(
                    width: 85.w,
                    child: InputField(
                      onFieldSubmitted: (value) {
                        context.read<RecentSearchedCubit>().insertData(title: value);
                        if (context.read<SearchCubit>().isFiltered == true) {
                          context.read<SearchCubit>().changeFilter();
                        }
                        context.read<SearchCubit>().changeSearchItems(value);
                        context.read<SearchCubit>().searchJobs(value);
                      },
                      controller: searchController,
                      maxLines: 1,
                      validated: () {},
                      onchange: (value) {
                        if (context.read<SearchCubit>().isFiltered == true) {
                          context.read<SearchCubit>().changeFilter();
                        }
                        context.read<SearchCubit>().changeSearchItems(value);
                        context.read<SearchCubit>().searchJobs(value);
                      },
                      onEditingComplete: () {
                       // context.read<SearchCubit>().searchJobs(value);
                      },
                      prefixIcon: ImageIcon(AssetImage(AppImages.searchIcon)),
                      hint: AppStrings.typeSomething,
                      radius: 40,
                      autoFocus: true,
                    ),
                  )
                ],
              ),

              ////////////////  search check   true       ///////////////////////////

              context.read<SearchCubit>().isSearched
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        // BottomSheet(onClosing: () => Navigator.pop(context),builder:(context) =>  const BottomSheetSetFilter(),);
                                        showMaterialModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              const BottomSheetSetFilter(),
                                        );
                                      },
                                      icon: ImageIcon(
                                          AssetImage(AppImages.filter)))),
                              const Expanded(child: Text("Remote")),
                              const Expanded(child: Text("Remote")),
                              const Expanded(child: Text("Remote"))
                            ],
                          ),
                          SearchModel.data.isEmpty
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 70),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 17.h,
                                        ),
                                        Image.asset(
                                          AppImages.searchNotFound,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        PrimaryText(
                                          title: AppStrings.searchNotFound,
                                          size: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        PrimaryText(
                                          title: AppStrings.tryAnotherSearch,
                                          size: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.neutral500,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: 6.h,
                                  color: const Color(0xaaE5E7EB),
                                  child: PrimaryText(
                                    title:
                                        "Featuring ${SearchModel.data.length}+jobs ",
                                    size: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.neutral500,
                                  ),
                                ),
                          SizedBox(
                            height: 100.h,
                            child: ListView.builder(
                              // itemExtent: 100,

                              scrollDirection: Axis.vertical,
                              itemCount:
                                  context.read<SearchCubit>().isFiltered ==
                                          false
                                      ? SearchModel.data.length
                                      : SearchFilteringModel.data.length,
                              itemBuilder: (context, index) {
                                return context.read<SearchCubit>().isFiltered ==
                                        false
                                    ? MainSearchItem(
                                        index: index,
                                      )
                                    : MainSearchFilterItem(index: index);
                              },
                            ),
                          )
                        ],
                      ),
                    )

                  ////////////////  search check   false       ///////////////////////////

                  : SingleChildScrollView(
                      child: BlocConsumer<RecentSearchedCubit, RecentSearchedState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                       return context.read<RecentSearchedCubit>().searchedItems.isNotEmpty?
                           Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerLeft,
                                width: double.infinity,
                                height: 6.h,
                                color: const Color(0xaaE5E7EB),
                                child: SecondaryText(
                                  title: AppStrings.recentSearches,
                                  size: 16,
                                ),
                              ),
                              SizedBox(
                                  height: context.read<RecentSearchedCubit>().searchedItems.length*9.h,
                                  child: ListView.builder(
                                    itemCount: context.read<RecentSearchedCubit>().searchedItems.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          SearchRow(
                                            controller: searchController,
                                            recent: true,
                                            prefixIcon: AppImages.clock,
                                            title: context.read<RecentSearchedCubit>().searchedItems[index]['title'],
                                            suffixIcon: AppImages.closeCircle,
                                            suffixColor: AppColors.redColor,
                                            id: context.read<RecentSearchedCubit>().searchedItems[index]['id'],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          )
                                        ],
                                      );
                                    },
                                  )),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerLeft,
                                width: double.infinity,
                                height: 6.h,
                                color: const Color(0xaaE5E7EB),
                                child: SecondaryText(
                                  title: AppStrings.popularSearches,
                                  size: 16,
                                ),
                              ),
                              SizedBox(
                                  height: 32.h,
                                  child: ListView.builder(
                                    itemCount: popular.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          SearchRow(
                                            controller: searchController,
                                            id: 0,
                                            prefixIcon: AppImages.searchStatus,
                                            title: popular[index],
                                            suffixIcon:
                                                AppImages.roundedArrowRight,
                                            suffixColor: AppColors.primaryColor,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          )
                                        ],
                                      );
                                    },
                                  )),
                            ],
                          ):
                           Column(
                             children: [
                               Container(
                                 padding:
                                 const EdgeInsets.symmetric(horizontal: 20),
                                 alignment: Alignment.centerLeft,
                                 width: double.infinity,
                                 height: 6.h,
                                 color: const Color(0xaaE5E7EB),
                                 child: SecondaryText(
                                   title: AppStrings.popularSearches,
                                   size: 16,
                                 ),
                               ),
                               SizedBox(
                                   height: 32.h,
                                   child: ListView.builder(
                                     itemCount: popular.length,
                                     itemBuilder: (context, index) {
                                       return Column(
                                         children: [
                                           SearchRow(
                                             controller: searchController,
                                             id: 0,
                                             prefixIcon: AppImages.searchStatus,
                                             title: popular[index],
                                             suffixIcon:
                                             AppImages.roundedArrowRight,
                                             suffixColor: AppColors.primaryColor,
                                           ),
                                           SizedBox(
                                             height: 2.h,
                                           )
                                         ],
                                       );
                                     },
                                   )),
                             ],
                           );
                        },
                      ),
                    )
            ],
          ),
        ));
      },
    );
  }
}
