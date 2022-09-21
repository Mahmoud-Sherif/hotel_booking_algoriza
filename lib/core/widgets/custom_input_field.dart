import 'package:flutter/material.dart';
import '../utils/color_manager.dart';
import '../utils/values_manager.dart';

class CustomInputField extends StatelessWidget {
  // final TextEditingController inputController;
  const CustomInputField({
    Key? key,
    this.hintText,
  }) : super(key: key);
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: ColorManager.grey.withOpacity(.1)),
            ]),
            child: TextField(
              // controller: inputController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                // label: const Text("Email"),
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: ColorManager.secondry,
                hintText: hintText,
                hintStyle:
                    TextStyle(color: ColorManager.lightGrey.withOpacity(0.75)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorManager.secondry, width: 1.0),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorManager.secondry, width: 1.0),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s30)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.error, width: 1.0),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s30)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorManager.secondry, width: 1.0),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s30)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
