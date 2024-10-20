import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_add_photo.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_view_photo.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/data/model/bin_list/bin_list_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/view/bin_details/presentation/bloc/edit_bin_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/compost_bin_types/presentation/view/compost_bin_types_dialog_content.dart';
import 'package:maze_app/feature/tracker/presentation/view/create_bin_types/presentation/widgets/custom_cupertino_picker.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tab_content_view.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/two_compartment_dialog.dart';


class EditBinDetailsDialogContent extends StatefulWidget  implements AutoRouteWrapper{
  const EditBinDetailsDialogContent ({
    super.key, required this.bin,
  });
  final Bin bin;

  @override
  State<EditBinDetailsDialogContent > createState() =>
      _EditBinDetailsDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<EditBinBloc>(), child: this);

  }
}

class _EditBinDetailsDialogContentState extends State<EditBinDetailsDialogContent >
    with SingleTickerProviderStateMixin {
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController pickupDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController typeOfController =TextEditingController();
  final TextEditingController twoCompartmentController =TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();

  final focusNodeNickName = FocusNode();
  final focusNodePickUpDate = FocusNode();
  final focusNodeAmount = FocusNode();
  final focusNodeTypeOf = FocusNode();
  final focusNodeTwoCompartment = FocusNode();
  final widthFocusNode = FocusNode();
  final heightFocusNode = FocusNode();
  final lengthFocusNode = FocusNode();

  String? typeOfCompostBinId;
  TypeOfCompostBin? typeOfCompostBin;

  late final TabController tabController;

  SizeType? sizeType ;
String photoUrl='';
  File? file;
  bool isCouncil=false;
BinType? binType;
  List<String> doesItHaveTwoCompartments=[
    appStrings.yes,
    appStrings.no];

  List<String> periods = [appStrings.everyWeek, appStrings.everySecond];
  List weekDays = [
    appStrings.monday,
    appStrings.tuesday,
    appStrings.wednesday,
    appStrings.thursday,
    appStrings.friday,
    appStrings.saturday,
    appStrings.sunday
  ];

  @override
  void initState() {
    binType=widget.bin.type;
    if(widget.bin.imageUrl !=null) {
      photoUrl = widget.bin.imageUrl!;
    }

    if (binType == BinType.landfill) {
      if (widget.bin.isCouncil!) {
        isCouncil = true;
        pickupDateController.text=widget.bin.pickUpDate!;
      }
    }

    if (binType == BinType.compost) {
      if (widget.bin.typeOfCompostBin!.name != null) {
        typeOfController.text = widget.bin.typeOfCompostBin!.name!;
        typeOfCompostBin=widget.bin.typeOfCompostBin;
      }
      if (widget.bin.is2Compostement != null) {
        if (widget.bin.is2Compostement!) {
          twoCompartmentController.text = doesItHaveTwoCompartments[0];
        }
        else {
          twoCompartmentController.text = doesItHaveTwoCompartments[1];
        }
      }
    }

    sizeType=widget.bin.sizeType;
    nickNameController.text=widget.bin.nickName;
    amountController.text=widget.bin.amountOfLiters.toString();
    widthController.text=widget.bin.width.toString();
    heightController.text=widget.bin.height.toString();
    lengthController.text=widget.bin.length.toString();

    tabController = TabController(length: 2, vsync: this);
    setState(() {
      if (sizeType == SizeType.litres) {
        tabController.index = 0;
      }
      else {
        tabController.index = 1;
      }
    });


    tabController.addListener(
          () {
        setState(() {
          if (tabController.index == 0) {
            sizeType = SizeType.litres;
            return;
          }
          sizeType = SizeType.dimensions;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditBinBloc, EditBinState>(
      listener: (context, state) async {
        if (state.status.isSuccess) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (state.status.isFailure) {
          Fluttertoast.showToast(
              msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context, state),
                CustomText(
                  appStrings.editBin,
                  style: context.titleTitle1,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  appStrings.details,
                  style: context.titleHeadline,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Visibility(
                  visible: binType==BinType.compost,
                  child: Column(
                    children: [
                      CustomTextField.outline(
                        textEditingController: typeOfController,
                        label: appStrings.typeOfCompostBin,
                        focusNode: focusNodeTypeOf,
                        readOnly: true,
                        suffixIcon: Padding(
                            padding: const EdgeInsets.all(7),
                            child: appAssets.dropDown.svg(width: 10, height: 10)),
                        labelTextColor: context.scheme().secondaryText,
                        onTap: () {
                          _showTypeOfCompostBinDialog(context);
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextField.outline(
                        textEditingController: twoCompartmentController,
                        label: appStrings.compartment,
                        focusNode: focusNodeTwoCompartment,
                        readOnly: true,
                        suffixIcon: Padding(
                            padding: const EdgeInsets.all(7),
                            child: appAssets.dropDown.svg(width: 10, height: 10)),
                        labelTextColor: context.scheme().secondaryText,
                        onTap: () {
                          _showTwoCompartmentsDialog(context, (result) {
                            twoCompartmentController.text = result;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),

                CustomTextField.outline(
                  textEditingController: nickNameController,
                  label: appStrings.nickname,
                  focusNode: focusNodeNickName,
                  labelTextColor: context
                      .scheme()
                      .secondaryText,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Visibility(
                  visible:  binType==BinType.landfill && isCouncil,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: CustomTextField.outline(
                      textEditingController: pickupDateController,
                      label: appStrings.councilPickupDates,
                      focusNode: focusNodePickUpDate,
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                      readOnly: true,
                      suffixIcon: Padding(padding: const EdgeInsets.all(7),
                          child: appAssets.dropDown.svg(width: 10, height: 10)),
                      onTap: () {
                        _showPickupDateDialog(context);
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      appStrings.size,
                      style: context.titleHeadline,
                    ),
                    IconButton(onPressed: () {
                      ShowDialog.sizeInfo(context);
                    },
                        icon: appAssets.infoSize.svg())
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                TrackerTabBar(
                  tabController: tabController,
                  title1: appStrings.litres,
                  title2: appStrings.dimensions,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TabContentView(
                  controller: tabController,
                  children: [
                    CustomTextField.outline(
                      textEditingController: amountController,
                      label: appStrings.amountLitres,
                      focusNode: focusNodeAmount,
                      keyboardType: TextInputType.number,
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                    ),
                    SizedBox(
                      height: 210.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField.outline(
                            textEditingController: widthController,
                            label: appStrings.width,
                            focusNode: widthFocusNode,
                            keyboardType: TextInputType.number,
                            labelTextColor: context
                                .scheme()
                                .secondaryText,
                          ),
                          CustomTextField.outline(
                            textEditingController: heightController,
                            label: appStrings.height,
                            focusNode: heightFocusNode,
                            keyboardType: TextInputType.number,
                            labelTextColor: context
                                .scheme()
                                .secondaryText,
                          ),
                          CustomTextField.outline(
                            textEditingController: lengthController,
                            label: appStrings.length,
                            focusNode: lengthFocusNode,
                            keyboardType: TextInputType.number,
                            labelTextColor: context
                                .scheme()
                                .secondaryText,
                          ),
                        ],),
                    )
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  appStrings.photo,
                  style: context.titleHeadline,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  SizedBox(
                                    height: 150.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 70.h,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: IconButton(
                                              onPressed: () async {
                                                XFile? result = await ImagePicker()
                                                    .pickImage(
                                                    source: ImageSource.camera);
                                                if (result != null) {
                                                  setState(() {
                                                    file = File(result.path);
                                                    Navigator.pop(context);
                                                  });
                                                }
                                              },
                                              icon: const Icon(Icons.camera_alt),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            XFile? result = await ImagePicker()
                                                .pickImage(
                                                source: ImageSource.gallery);
                                            if (result != null) {
                                              setState(() {
                                                file = File(result.path);
                                                Navigator.pop(context);
                                              });
                                            }
                                          },
                                          icon: const Icon(Icons.photo),
                                        ),
                                      ],
                                    ),
                                  ));
                        },
                        icon: const CustomAddPhoto()
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    if (file != null) ...[
                      CustomViewPhoto(
                          child: Image.file(file!),
                          onPressed: () {
                            setState(() {
                              file = null;
                            });
                          })
                    ],

                    if (photoUrl.isNotEmpty) ...[  CustomViewPhoto(
                        child: Image.network(photoUrl),
                        onPressed: () {
                          setState(() {
                            photoUrl = '';
                          });
                        })
                    ]
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Row buildHeader(BuildContext context,EditBinState state) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: ExitButton(),
          ),
          TextButton(child: state.status.isLoading
    ?Center(
            child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>( context.scheme().primary),
                    backgroundColor: context.scheme().primariesShade03,
                    strokeWidth: 2
                )),
          )
    :CustomText(appStrings.save,
              style: context.titleHeadline.copyWith(color: context
                  .scheme()
                  .primary)),
              onPressed: () {
                context.read<EditBinBloc>().add(
                  EditBinEvent.editBin(
                    bin: Bin(
                        type: binType!,
                        id: widget.bin.id,
                        nickName: nickNameController.text,
                        sizeType: sizeType!,
                        amountOfLiters: sizeType == SizeType.litres
                            ? amountController.text.isNotEmpty
                            ? int.parse(
                            amountController.text)
                            : null
                            : null,
                        isShare: false,
                      imageUrl: (file != null) ? file!.path :null,
                        width: sizeType == SizeType.dimensions ? widthController
                            .text.trim() : null,
                        length: sizeType == SizeType.dimensions
                            ? lengthController.text.trim()
                            : null,
                        height: sizeType == SizeType.dimensions
                            ? heightController.text.trim()
                            : null,
                        pickUpDate: (binType == BinType.landfill && isCouncil)
                            ? pickupDateController.text
                            : null,
                        typeOfCompostBin: (binType == BinType.compost)
                            ? typeOfCompostBin
                            : null,
                        is2Compostement: (binType == BinType.compost)
                            ? twoCompartmentController.text == appStrings.yes
                            : null
                    ),

                  ),
                );
              })
        ]);
  }


  void _showTypeOfCompostBinDialog(BuildContext context) {
    Future<dynamic> future = ShowDialog.openModalBottomSheet(context,
        child:const CompostBinTypesDialogContent().wrappedRoute(context),
        height: 300.h);

    future.then((result) {
      typeOfController.text = result.name;
      typeOfCompostBinId=result.id;
      typeOfCompostBin= TypeOfCompostBin(id: result.id,name: result.name);

    });
  }

  Future<void> _showTwoCompartmentsDialog(
      BuildContext context, Function(String strResult) onSelectResult) async {
    FocusScope.of(context).unfocus();
    String? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const TwoCompartmentDialog();
        });
    if (result != null) onSelectResult(result);
  }

  void _showPickupDateDialog(BuildContext context) {

    int weekSelected = 3;
    int periodsSelected = 0;
    ValueNotifier<bool> obscureState = ValueNotifier(false);

    ShowDialog.openModalBottomSheet(context,
      height: 400.h,
      child: ValueListenableBuilder(
          valueListenable: obscureState,
          builder: (BuildContext context, bool obscureValue,
              Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomSheetHeader(
                  title: appStrings.councilPickupDates,
                  closeIcon: appAssets.close.svg(),
                  showDivider: false,
                ),
                SizedBox(
                  height: 300,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 170,
                              child: CustomCupertinoPicker(children: List<
                                  Widget>.generate(
                                  periods.length, (int index) {
                                return Center(child: CustomText(
                                  periods[index], style: context.bodyBody,));
                              }),
                                onSelectedItemChanged: (int selectedItem) {
                                  setState(() {
                                    periodsSelected = selectedItem;
                                    obscureState.value = !obscureState.value;
                                  });
                                },
                              )),
                          Flexible(
                              child:
                              CustomCupertinoPicker(
                                onSelectedItemChanged: (int selectedItem) {
                                  setState(() {
                                    weekSelected = selectedItem;
                                    obscureState.value = !obscureState.value;
                                  });
                                },
                                initialItem: 3, children: List<Widget>.generate(
                                  weekDays.length, (int index) {
                                return Center(
                                  child: CustomText(
                                      weekDays[index], style: context.bodyBody),
                                );
                              }),
                              ))
                        ]
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    ).then((value) {
      pickupDateController.text =
      '${periods[periodsSelected]}, ${weekDays[weekSelected]}';
    });
  }
}
