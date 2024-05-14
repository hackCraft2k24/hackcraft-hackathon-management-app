import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_textFormField.dart';
import 'package:provider/provider.dart';

// This file was created in order to create the card for the rounds section.
class DefaultRoundCard extends StatefulWidget {
  final double containerHeight;
  final double containerWidth;
  final String title;
  final int index;
  final void Function()? onTap;
  final String enddate;
  final String startDate;
  const DefaultRoundCard(
      {super.key,
      required this.title,
      required this.enddate,
      required this.startDate,
      this.onTap,
      required this.index,
      required this.containerHeight,
      required this.containerWidth});

  @override
  State<DefaultRoundCard> createState() => _DefaultRoundCardState();
}

class _DefaultRoundCardState extends State<DefaultRoundCard> {
  late TextEditingController roundNameController;
  late TextEditingController roundStartDateController;
  late TextEditingController roundEndDateController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    roundNameController = TextEditingController();
    roundStartDateController = TextEditingController();
    roundEndDateController = TextEditingController();

    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);

    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context, listen: false);

    hackathonTextPropertiesProvider.textFieldPropertiesMap[
        roundGlobalKeysMap[widget.index]!['roundName']!] = TextFieldProperties(
      size: 20,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'left',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1A202C);',
      underline: false,
      upperCase: false,
    );

    hackathonTextPropertiesProvider.textFieldPropertiesMap[
            roundGlobalKeysMap[widget.index]!['roundStartDate']!] =
        TextFieldProperties(
      size: 20,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'left',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1A202C);',
      underline: false,
      upperCase: false,
    );

    hackathonTextPropertiesProvider.textFieldPropertiesMap[
            roundGlobalKeysMap[widget.index]!['roundEndDate']!] =
        TextFieldProperties(
      size: 20,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'left',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1A202C);',
      underline: false,
      upperCase: false,
    );

    final rulesProvider = Provider.of<RulesProvider>(context, listen: false);

    hackathonTextPropertiesProvider.textFieldPropertiesMap[
            roundGlobalKeysMap[widget.index]!['roundDescription']!] =
        TextFieldProperties(
      size: 16, //size is +1 in comparison to normal text whose fontsize was 15
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'center',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF564A4A);',
      underline: false,
      upperCase: false,
    );

    if (hackathonDetailsProvider.roundsList[widget.index].name.isNotEmpty) {
      roundNameController.text =
          hackathonDetailsProvider.roundsList[widget.index].name;
    }

    if (hackathonDetailsProvider
        .roundsList[widget.index].startTimeline.isNotEmpty) {
      roundStartDateController.text =
          hackathonDetailsProvider.roundsList[widget.index].startTimeline;
    }

    if (hackathonDetailsProvider
        .roundsList[widget.index].endTimeline.isNotEmpty) {
      roundEndDateController.text =
          hackathonDetailsProvider.roundsList[widget.index].endTimeline;
    }
  }

  @override
  void dispose() {
    roundNameController.dispose();
    roundStartDateController.dispose();
    roundEndDateController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rulesProvider = Provider.of<RulesProvider>(context);
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);

    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          roundNameController, roundGlobalKeysMap[widget.index]!['roundName']!);

      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          roundStartDateController,
          roundGlobalKeysMap[widget.index]!['roundStartDate']!);

      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          roundEndDateController,
          roundGlobalKeysMap[widget.index]!['roundEndDate']!);
    });

    return InkWell(
      hoverColor: Colors.white,
      onTap: widget.onTap,
      child: Container(
          height: defaultEditScaleHeight(widget.containerHeight, 85), //67
          width: double.infinity,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(
              bottom: defaultEditScaleHeight(widget.containerHeight, 23),
              left: defaultEditScaleWidth(widget.containerWidth, 47),
              right: defaultEditScaleWidth(widget.containerWidth, 26),
              top: defaultEditScaleHeight(widget.containerHeight, 23)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(rad5_3),
              border: Border.all(
                  color: rulesProvider.editSelectedIndex == widget.index
                      ? black1
                      : Colors.transparent),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        left: defaultEditScaleWidth(widget.containerWidth, 25),
                      ),
                      //Title of the round
                      child: Container(
                        height: defaultEditScaleHeight(widget.containerHeight, 20),
                        width:
                            defaultEditScaleWidth(widget.containerWidth, 150),
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            top: defaultEditScaleHeight(
                                widget.containerHeight, 20)),

                        // color: Colors.amberAccent[100],
                        child: DefaultTemplateTextFormField(
                          hintText: 'Round Name',
                          fieldKey:
                              roundGlobalKeysMap[widget.index]!['roundName']!,
                          // textAlignVertical: TextAlignVertical.top,
                          controller: roundNameController,
                          containerHeight: widget.containerHeight,
                          maxLength: 10,
                          height:
                              22.4, //Line Height is changed because of cursor size, initial line height was 22.4
                          onSaved: (value) {
                            hackathonDetailsProvider.updateRoundTitle(
                                widget.index, value.toString());
                          },
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      if (hackathonDetailsProvider.roundsList.length != 1) {
                        hackathonDetailsProvider.deleteRound(
                            widget.index, context);
                        deleteGlobalKeys(widget.index);
                        hackathonDetailsProvider
                            .deleteTextPropertiesOfRoundsFromFields(
                                widget.index);
                        rulesProvider.deleteDescriptionControllers(widget.index);
                        // hackathonDetailsProvider.deleteTemproraryRound(index, context);
                      }
                    },
                    child: Container(
                      width: defaultEditScaleWidth(widget.containerWidth, 133),
                      height:
                          defaultEditScaleHeight(widget.containerHeight, 30),
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            defaultEditScaleWidth(widget.containerWidth, 10),
                      ),
                      decoration: const BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.delete_rounded,
                              color: Colors.white,
                              size: defaultEditScaleHeight(
                                  widget.containerHeight, 18)),
                          SizedBox(
                              width: defaultEditScaleWidth(
                                  widget.containerWidth, 5)),
                          Text("Remove Round",
                              style: GoogleFonts.getFont(fontFamily2,
                                  fontSize: defaultEditScaleHeight(
                                      widget.containerHeight, 16),
                                  color: Colors.white,
                                  height: lineHeight(12.4, 12),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              //Timeline i.e Start date and End date of the round
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left:
                              defaultEditScaleWidth(widget.containerWidth, 25),
                          right:
                              defaultEditScaleWidth(widget.containerWidth, 15)
                          // bottom: defaultEditScaleHeight(containerHeight, 6)
                          ),
                      child:
                          // Text('$startDate - $enddate',
                          //     style: GoogleFonts.getFont(fontFamily2,
                          //         fontSize: defaultEditScaleHeight(containerHeight, 18),
                          //         color: black1,
                          //         height: lineHeight(2.4, 20),
                          //         fontWeight: FontWeight.w400)),
                          Container(
                        height:
                            defaultEditScaleHeight(widget.containerHeight, 30),
                        width:
                            defaultEditScaleWidth(widget.containerWidth, 110),
                        // color: Colors.deepPurple[100],
                        alignment: Alignment.center,
                        child: DefaultTemplateTextFormField(
                          hintText: 'YYYY-MM-DD',
                          fieldKey: roundGlobalKeysMap[widget.index]![
                              'roundStartDate']!,
                          controller: roundStartDateController,
                          containerHeight: widget.containerHeight,
                          maxLength: 10,
                          height:
                              22.4, //Line Height is changed because of cursor size, initial line height was 22.4
                          onSaved: (value) {
                            hackathonDetailsProvider.updateRoundStartDate(
                                widget.index, value.toString());
                          },
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                        ),
                      )),
                  // Container(
                  // height: defaultEditScaleHeight(containerHeight, 30),
                  // width: defaultEditScaleWidth(containerWidth, 10),
                  // alignment: Alignment.topLeft,
                  // // color: Colors.amberAccent[100],
                  // child: TextFormField(
                  //   enabled:false,
                  //   textAlign: TextAlign.center,
                  //   //textAlignVertical: TextAlignVertical.top,
                  //   // controller: roundNameController,
                  //   cursorColor: Colors.black,
                  //   decoration: InputDecoration(
                  //     contentPadding: EdgeInsets.all(0),
                  //     hintText: '-',
                  //     hintStyle: GoogleFonts.getFont(fontFamily2,
                  //         fontSize:
                  //             defaultEditScaleHeight(containerHeight, 20),
                  //         color: black1,
                  //         fontWeight: FontWeight.w400,
                  //         height: lineHeight(22.4, 20)),
                  //     enabledBorder: InputBorder.none,
                  //     focusedBorder: InputBorder.none,
                  //     errorBorder: InputBorder.none,
                  //     disabledBorder: InputBorder.none,
                  //     focusedErrorBorder: InputBorder.none,
                  //     counterText: "",
                  //   ),
                  //   maxLength: 1,
                  //   keyboardType: TextInputType.text,
                  //   style: GoogleFonts.getFont(fontFamily2,
                  //       fontSize: defaultEditScaleHeight(containerHeight, 20),
                  //       color: black1,
                  //       fontWeight: FontWeight.w400,
                  //       height: lineHeight(22.4, 20)),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return '';
                  //     }
                  //     return null;
                  //   },
                  //   // onSaved: (value) {
                  //   //   hackathonDetailsProvider.hackathonName = value.toString();
                  //   // },
                  // ),
                  // ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: defaultEditScaleWidth(widget.containerWidth, 15),
                        // bottom: defaultEditScaleHeight(containerHeight, 6)
                      ),
                      child:
                          // Text('$startDate - $enddate',
                          //     style: GoogleFonts.getFont(fontFamily2,
                          //         fontSize: defaultEditScaleHeight(containerHeight, 18),
                          //         color: black1,
                          //         height: lineHeight(2.4, 20),
                          //         fontWeight: FontWeight.w400)),
                          Container(
                        height:
                            defaultEditScaleHeight(widget.containerHeight, 30),
                        width:
                            defaultEditScaleWidth(widget.containerWidth, 110),
                        // color: Colors.deepPurple[100],
                        alignment: Alignment.center,
                        child: DefaultTemplateTextFormField(
                          hintText: 'YYYY-MM-DD',
                          fieldKey: roundGlobalKeysMap[widget.index]!['roundEndDate']!,
                          controller: roundEndDateController,
                          containerHeight: widget.containerHeight,
                          maxLength: 10,
                          height: 22.4, //Line Height is changed because of cursor size, initial line height was 22.4
                          onSaved: (value) {
                            hackathonDetailsProvider.updateRoundEndDate(
                                widget.index, value.toString());
                          },
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                        ),
                      )),
                ],
              )
            ],
          )),
    );
  }
}
