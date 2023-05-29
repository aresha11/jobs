import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/text_button.dart';
import 'package:amitproject/2_controller/profile_cubit/profile_cubit.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../0_model/edit_profile_bio_address_mobile_model.dart';
import '../../../2_controller/database/local/shared_preference.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/primary_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>();
    nameController.text = SharedPreference.get(key: "name");
    bioController.text = SharedPreference.get(key: "bio").toString()=="null"?"Add a bio": SharedPreference.get(key: "bio");
    addressController.text = SharedPreference.get(key: "address").toString()=="null"?"Add a address": SharedPreference.get(key: "address");
    phoneController.text = SharedPreference.get(key: "mobile").toString()=="null"?"Add a mobile": SharedPreference.get(key: "mobile");
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_outlined)),
                      PrimaryText(
                        title: AppStrings.editProfile,
                        size: 20,
                      ),
                      const Text("             "),
                    ],
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: CircleAvatar(
                      backgroundImage:AssetImage(AppImages.home),
                      radius: 40,
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  ButtonText(onPress: (){}, title: AppStrings.changePhoto),

                  SizedBox(
                    height: 3.h,
                  ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   PrimaryText(
                       title: AppStrings.name,
                       size: 16,
                       color: AppColors.neutralEditProfile,
                       fontWeight: FontWeight.w500),
                   InputField(
                     onFieldSubmitted: (){},
                     validated: () {},
                     onchange: (p) {},
                     onEditingComplete: () {},
                     controller: nameController,
                     maxLines: 1,
                   ),
                   SizedBox(
                     height: 2.h,
                   ),
                   PrimaryText(
                       title: AppStrings.bio,
                       size: 16,
                       color: AppColors.neutralEditProfile,
                       fontWeight: FontWeight.w500),
                   InputField(
                     onFieldSubmitted: (){},
                     validated: () {},
                     onchange: (p) {},
                     onEditingComplete: () {},
                     controller: bioController,
                     maxLines: 1,
                   ),
                   SizedBox(
                     height: 2.h,
                   ),
                   PrimaryText(
                       title: AppStrings.address,
                       size: 16,
                       color: AppColors.neutralEditProfile,
                       fontWeight: FontWeight.w500),
                   InputField(
                     onFieldSubmitted: (){},
                     validated: () {},
                     onchange: (p) {},
                     onEditingComplete: () {},
                     controller: addressController,
                     maxLines: 1,
                   ),
                   SizedBox(
                     height: 2.h,
                   ),
                   PrimaryText(
                       title: AppStrings.noHandPhone,
                       size: 16,
                       color: AppColors.neutralEditProfile,
                       fontWeight: FontWeight.w500),
                   InputField(
                     maxLines: 1,
                     controller: phoneController,
                     validated: (v){},
                     onchange: (v){},
                     onEditingComplete: (){},
                     onFieldSubmitted: (){},
                     prefixIcon: CountryListPick(
                         theme: CountryTheme(
                           isShowFlag: true,
                           isShowTitle: false,
                           isShowCode: false,
                           isDownIcon: true,
                           showEnglishName: false,
                         ),
                         initialSelection: 'US',
                         onChanged: (code) {

                           print(code?.dialCode);
                           // print(code.flagUri);
                         },
                         useUiOverlay: false,
                         useSafeArea: false),
                   ),
                   SizedBox(height: 4.h,),
                   MainButton(
                     color: AppColors.primaryColor,
                     onPressed: () {
                       cubit.editProfileBioAddressMobile(
                         bio: bioController.text,
                         address:addressController.text,
                         mobile: phoneController.text,
                       );
                       Navigator.pop(context);
                     },
                     title: "Save",
                     fontWeight: FontWeight.w500,
                     textColor:Colors.white ,
                     textSize: 20,
                   )
                 ],
               )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
