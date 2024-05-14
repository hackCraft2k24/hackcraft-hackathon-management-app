import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistration.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_text.dart';

import 'package:provider/provider.dart';

class Aboutus extends StatelessWidget {
  const Aboutus(
      {super.key, required this.defaultTemplateModel, required this.isEdit});
  final DefaultTemplateApiResponse? defaultTemplateModel;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      key: aboutUs,
      padding: EdgeInsets.only(top: scaleHeight(context, 96)),
      child: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            //This container will show the complete description of the hackathon, including rounds, rules, and many other things.
            //The height of the container will automatically increase based on the size of the text being entered.
           
            Column(
              children: [
                SizedBox(height : scaleWidth(context, 29)),
                Container(
                    width: double.infinity,
                    margin:
                        EdgeInsets.symmetric(horizontal: scaleWidth(context, 37)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: black3, width: scaleWidth(context, 1))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: scaleWidth(context, 44),
                          right: scaleWidth(context, 44),
                          top: scaleHeight(context, 59),
                          bottom: scaleHeight(context, 165)),
                      child:
                      DefaultTemplateText(
                          name:  defaultTemplateModel!.hackathons.about,
                        // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis velit nec justo fermentum dignissim. Sed lacinia ex eu mi malesuada, sed interdum metus posuere. Vivamus auctor sapien in eleifend. Fusce nec est eget lorem ultrices facilisis a eget dolor. Integer eget velit sit amet lorem gravida vestibulum. Proin eget vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur eget tellus ut odio facilisis bibendum nec nec tortor. Vivamus iaculis, turpis et tincidunt mattis, est arcu laoreet urna, nec dignissim nisl odio a nunc. Phasellus fermentum tristique orci, vel convallis tortor vehicula nec.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis velit nec justo fermentum dignissim. Sed lacinia ex eu mi malesuada, sed interdum metus posuere. Vivamus auctor sapien in eleifend. Fusce nec est eget lorem ultrices facilisis a eget dolor. Integer eget velit sit amet lorem gravida vestibulum. Proin eget vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur eget tellus ut odio facilisis bibendum nec nec tortor. Vivamus iaculis, turpis et tincidunt mattis, est arcu laoreet urna, nec dignissim nisl odio a nunc. Phasellus fermentum tristique orci, vel convallis tortor vehicula nec.Suspendisse potenti. Donec ullamcorper consectetur nunc, ut aliquam nulla blandit eget. Nunc pharetra diam ac turpis viverra varius. Sed ut erat justo. Fusce in tellus ut sapien venenatis volutpat. Nam eu sapien nec enim rhoncus volutpat vel eu libero. Nam vel augue sit amet odio malesuada mattis eget eu sapien. Integer ut nisi vitae libero gravida pharetra. Nunc varius tincidunt justo, a vehicula justo rhoncus ut. Sed bibendum, risus at euismod venenatis, purus metus tincidunt libero, a facilisis justo justo id libero. Maecenas ultricies augue a hendrerit iaculis.',
                          textProperties:
                              defaultTemplateModel!.fields[8].textProperties,
                          height: 22.4,
                        ),
                      
                      
                      
                       
                    )),
              ],
            ),
            //The register button is positioned accordingly so that it starts before the container and goes until the container starts.
            //When you run the code, you'll understand what's written here.
            Positioned(
                //top: -scaleWidth(context, 29),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: scaleWidth(context, 512)),
                  height: scaleHeight(context, 58),
                  width: scaleWidth(context, 256),
                  decoration: BoxDecoration(
                    color: black4,
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        if (!isEdit) {
                          final getRegistrationFormProvider =
                              Provider.of<GetRegistrationFormProvider>(context,
                                  listen: false);

                          getRegistrationFormProvider
                              .getRegForm(defaultTemplateModel!.hackathons.id);
                          Navigator.pushNamed(context, '/getRegistration');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55)),
                        backgroundColor: Colors.white,
                      ),
                      child: Text("Get Registered",
                          style: GoogleFonts.getFont(fontFamily2,
                              fontWeight: FontWeight.w600,
                              fontSize: scaleWidth(context, 21),
                              height: lineHeight(22.4, 21),
                              color: black1))),
                )),
            //This container is used to show the prize section. It's also positioned like the above container,
            //but the difference is that the above one was positioned from the top and this one was positioned from the bottom.
            //Run the code once, and you'll understand.
            Positioned(
              bottom: -scaleWidth(context, 200), //120
              child: Container(
                  // color: lavender,
                  height: scaleHeight(context, 400), //240
                  width: scaleWidth(context, 1118),
                  margin:
                      EdgeInsets.symmetric(horizontal: scaleWidth(context, 81)),
                  child: SvgPicture.asset(
                      'assets/icons/defaultEditPortal/about.svg',
                      fit: BoxFit.fill)),
            ),
          ]),
          SizedBox(
            height: scaleHeight(context, 233), //153
          )
        ],
      ),
    );
  }
}
