import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class DropDown extends StatelessWidget {
  final List<String> itemList;
  final String? validatorText;
  final String? dropDownValue;
  final FocusNode? focusNode;
  final Color? textColor, iconColor, borderColor;
  final Map<String, Color>? containerColor;

  DropDown(this.itemList,
      {this.validatorText,
      this.dropDownValue,
      this.borderColor,
      this.focusNode,
      this.textColor,
      this.iconColor,
      this.containerColor});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        onModelReady: (model) {},
        disposeViewModel: false,
        viewModelBuilder: () => BaseModel(),
        builder: (context, model, child) => FormField(
            key: UniqueKey(),
            builder: (FormFieldState<dynamic> field) {
              return Container(
                padding: const EdgeInsets.only(left: 16, right: 16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                      sS(context).cH(height: 5),
                    )),
                    color: white,
                    border: Border.all(
                      color: borderColor!,
                    )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: Padding(
                      padding:
                          EdgeInsets.only(right: sS(context).cW(width: 16.08)),
                      child: GeneralIconDisplay(LineIcons.angleDown,
                          iconColor ?? black, UniqueKey(), 15),
                    ),
                    focusNode: focusNode,
                    dropdownColor: white,
                    focusColor: blue,
                    isExpanded: true,
                    style: TextStyle(
                        color: blue,
                        fontSize: sS(context).cH(height: 12),
                        fontWeight: FontWeight.w400),
                    value: "model.dropDown",
                    items:
                        itemList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                              width: sS(context).cW(width: 343),
                              height: sS(context).cH(height: 40),
                              alignment: Alignment.centerLeft,
                              color: containerColor == null
                                  ? white
                                  : containerColor![value],
                              child: GeneralTextDisplay(
                                  value,
                                  textColor ?? black,
                                  1,
                                  12,
                                  FontWeight.w500,
                                  '')));
                    }).toList(),
                    onChanged: (value) {
                      //model.updateDropDownValue(value, dropDownValue);
                    },
                  ),
                ),
              );
            },
            validator: (val) {
              return val != '' ? null : validatorText;
            }));
  }
}
