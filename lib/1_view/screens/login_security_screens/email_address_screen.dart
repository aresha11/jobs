import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/2_controller/change_password_cubit/change_password_cubit.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_images.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/main_button.dart';
import '../../widgets/primary_text.dart';

class EmailAddressScreen extends StatelessWidget {
  const EmailAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
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
                      title: AppStrings.emailAddress,
                      size: 20,
                    ),
                    const Text("             "),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      PrimaryText(
                        title: "Main e-mail address",
                        size: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 1.h,),
                      InputField(
                          validated: (){},
                          onchange: (){},
                          onEditingComplete: (){},
                          onFieldSubmitted: (){},
                        prefixIcon: ImageIcon(AssetImage(AppImages.email)),
                        hint: SharedPreference.get(key: "email"),

                      ),
                      SizedBox(height: 62.h,),
                      MainButton(
                        textColor: Colors.white,
                        textSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: AppStrings.save,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
