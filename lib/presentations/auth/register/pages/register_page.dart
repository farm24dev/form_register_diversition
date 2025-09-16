import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_register_diversition/constants/colours.dart';
import 'package:form_register_diversition/presentations/auth/register/blocs/bloc/register_bloc.dart';
import 'package:form_register_diversition/presentations/auth/register/widgets/button_custom.dart';
import 'package:form_register_diversition/presentations/auth/register/widgets/dialogs/app_dialogs.dart';
import 'package:form_register_diversition/presentations/auth/register/widgets/dialogs/loading_dialog.dart';
import 'package:form_register_diversition/presentations/auth/register/widgets/text_formfield_custom.dart';
import 'package:form_register_diversition/utils/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late RegisterBloc registerBloc;

  @override
  void initState() {
    super.initState();

    formKey = GlobalKey<FormState>();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();

    registerBloc = RegisterBloc();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: registerBloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) async {
          switch (state) {
            case RegisterInitial():
              break;
            case RegisterLoading():
              LoadingDialog.show(context);
              break;
            case RegisterSuccess():
              await AppDialogs.success(context, message: 'สมัครสมาชิกสำเร็จ');
              LoadingDialog.hide(context);
              break;
            case RegisterFailure():
              await AppDialogs.error(context, message: 'สมัครสมาชิกไม่สำเร็จ');
              LoadingDialog.hide(context);
              break;
          }
        },
        child: _view(),
      ),
    );
  }

  Scaffold _view() {
    return Scaffold(
      backgroundColor: Colours.white,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                const SizedBox(height: 16),
                Center(child: Image.asset('assets/images/img_logo.png', height: 70)),
                const Text(
                  'สมัครสมาชิก',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                        child: TextFormFieldCustom(
                      hintText: 'ชื่อ',
                      controller: firstNameController,
                      textInputAction: TextInputAction.next,
                      validator: Validators.required('กรุณากรอกชื่อ'),
                    )),
                    Expanded(
                      child: TextFormFieldCustom(
                        hintText: 'นามสกุล',
                        controller: lastNameController,
                        textInputAction: TextInputAction.next,
                        validator: Validators.required('กรุณากรอกนามสกุล'),
                      ),
                    ),
                  ],
                ),
                TextFormFieldCustom(
                  hintText: 'ที่อยู่',
                  lines: 5,
                  controller: addressController,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  validator: Validators.required('กรุณากรอกที่อยู่'),
                ),
                TextFormFieldCustom(
                  hintText: 'เบอร์โทรศัพท์',
                  controller: phoneController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  validator: Validators.required('กรุณากรอกเบอร์โทรศัพท์'),
                ),
                TextFormFieldCustom(
                  hintText: 'อีเมล',
                  controller: emailController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.compose([
                    Validators.required('กรุณากรอกอีเมล'),
                    Validators.email('รูปแบบอีเมลไม่ถูกต้อง'),
                  ]),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ButtonCustom(
                    text: 'สมัครสมาชิก',
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;
                      bool? isConfirm = await AppDialogs.confirm(context, message: 'ต้องการสมัครสมาชิกใช่หรือไม่?');
                      if (isConfirm == null || !isConfirm) return;
                      registerBloc.add(const RegisterRequestEvent());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
