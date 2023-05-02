import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/primary_text.dart';


class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_outlined)),
                PrimaryText(
                  title: AppStrings.helpCenter,
                  size: 20,
                ),
                const Text("             "),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            InputField(
              onFieldSubmitted: (v){},
              onEditingComplete: (v){},
              onchange: (v){},
              validated: (v){},
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: AppColors.neutral500,
                size: 25,
              ),
             radius: 80,
              hint: AppStrings.whatCanWeHelp,
              controller: searchController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                        Border.all(color: AppColors.neutral200,)),
                    child: const ExpansionTile(
                      textColor: Colors.black,
                      title: Text('Lorem ipsum dolor sit amet'),
                      children: <Widget>[
                        ListTile(
                            title: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.')),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}
