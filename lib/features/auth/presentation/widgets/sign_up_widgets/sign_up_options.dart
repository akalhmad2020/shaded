
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shded/core/strings/app_strings.dart';
import 'package:shded/features/auth/presentation/auth_bloc/auth_bloc.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int? _selectedRadioValue = 1;

  void _handleRadioValueChanged(int? value) {
    _selectedRadioValue = value ;
     BlocProvider.of<AuthBloc>(context).add(SelectYourId(yourId:  value!));
  }
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    return Row(
        children: [
          RadioMenuButton(
            value: 1,
            groupValue: _selectedRadioValue,
            onChanged: _handleRadioValueChanged, child:  Text(kUser , style:
          TextStyle(color: _selectedRadioValue == 1 ? const Color(0xff242424) : const Color(0xff808080)  ),),
          ),
          RadioMenuButton(
            value: 2,
            groupValue: _selectedRadioValue,
            onChanged: _handleRadioValueChanged,
            child:  Text(kDriver , style:
            TextStyle(color: _selectedRadioValue == 2 ? const Color(0xff242424) : const Color(0xff808080)  ),),
          ),
        ],
      );
  },
),
    );
  }
}
