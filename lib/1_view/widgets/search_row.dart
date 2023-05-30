import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/database/local/recent_searched/recent_searched_cubit.dart';
import 'package:amitproject/2_controller/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
class SearchRow extends StatefulWidget {
   SearchRow
       ({
     Key? key,
     required this.prefixIcon,
     required this.title,
     required this.suffixIcon,
     required this.suffixColor,
     required this.id,
     this.recent=false,
     required this.controller,
   }) : super(key: key);

   String prefixIcon;
   String title;
   String suffixIcon;
   Color  suffixColor;
   int id;
   bool recent;
   TextEditingController controller;

  @override
  State<SearchRow> createState() => _SearchRowState();
}

class _SearchRowState extends State<SearchRow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(widget.recent==true){
         widget.controller.text=widget.title;
         if (context.read<SearchCubit>().isFiltered == true) {
           context.read<SearchCubit>().changeFilter();
         }
         context.read<SearchCubit>().changeSearchItems(widget.title);
         context.read<SearchCubit>().searchJobs(widget.title);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ImageIcon(AssetImage(widget.suffixIcon),),
            SizedBox(width: 2.w,),
            Expanded(child: PrimaryText(title: widget.title, size: 14)),
            InkWell(
              onTap: (){
                if(widget.recent==true){
                  context.read<RecentSearchedCubit>().deleteDB(id:widget.id);
                }
              },
                child: ImageIcon(AssetImage(widget.suffixIcon),color:widget.suffixColor ,))
          ],
        ),
      ),
    );
  }
}
