// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/src/overlay_controller_widget_extension.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/cubit/auth/auth_cubit.dart';
import 'package:portal_pns_flutter/data/model/base/response_model.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/Animations/fade_animation.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/routes.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/custom_text_field.dart';
import 'package:portal_pns_flutter/view/base/widget/alert_dialog_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin, SingleTickerProviderStateMixin {
  AnimationController? _controller;

  bool hideText = false;
  late ResponseModel _responseModel;

  TabController? _tabController;
  String _nip = 'Nomor induk pegawaian';
  TextInputType _inputType = TextInputType.phone;

  final _formKey = GlobalKey<FormState>();
  FocusNode _nipFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  TextEditingController _nipController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is AuthProgress) {
            context.loaderOverlay.show();
          }
          if (state is AuthProeses) {
            _responseModel = state.responseModel;
            if (_responseModel.isSuccess) {
              context.loaderOverlay.hide();
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.HOME_SCREEN,
                (route) => false,
              );
              print(_responseModel.message);
            } else {
              context.loaderOverlay.hide();
              showDialog<void>(
                context: context,
                builder: (_) {
                  return AlertDialogWidget(
                    title: _responseModel.title,
                    message: _responseModel.message,
                    isError: true,
                  );
                },
              );
              print('message ${_responseModel.message}');
            }
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  Images.login_bg,
                  width: Adaptive.w(100),
                  height: Adaptive.h(45), //MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                    Adaptive.w(5),
                    Adaptive.h(8),
                    Adaptive.w(5),
                    Adaptive.h(8),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Lottie.asset(
                        Images.login_animated,
                        controller: _controller,
                        height: Adaptive.h(5),
                        animate: true,
                        repeat: false,
                      ),
                      SizedBox(height: Adaptive.h(9)),
                      FadeAnimation(
                        delay: 1.5,
                        direction: 'Horizontal',
                        directStart: -Adaptive.w(13),
                        child: Text(
                          'Login',
                          style: poppinsBold.copyWith(
                            fontSize: 24.sp,
                            color: Colors.white,
                            letterSpacing: -2,
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(1)),
                      FadeAnimation(
                        delay: 2.0,
                        child: RichText(
                          text: TextSpan(
                            style: poppinsRegular.copyWith(color: Colors.white),
                            children: [
                              TextSpan(
                                text: 'Selamat datang di ',
                              ),
                              TextSpan(
                                  text: 'Portal PNS\n', style: poppinsBold),
                              TextSpan(
                                text:
                                    'Silahkan masukan akun anda untuk melanjutkan.',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(3)),
                      FadeAnimation(
                        delay: 2.5,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: Adaptive.w(5),
                              horizontal: Adaptive.h(3)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.px),
                            ),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeAnimation(
                                  delay: 3,
                                  child: TabBar(
                                    controller: _tabController,
                                    indicator: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        width: 4,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.8),
                                      ),
                                      insets: EdgeInsets.only(
                                          right: Adaptive.w(4),
                                          bottom: Adaptive.h(0.8)),
                                    ),
                                    isScrollable: true,
                                    unselectedLabelColor: Colors.grey,
                                    unselectedLabelStyle:
                                        poppinsMedium.copyWith(
                                      fontSize: 16.sp,
                                      // letterSpacing: Adaptive.w(0.5),
                                    ),
                                    labelPadding:
                                        EdgeInsets.only(left: 0, right: 0),
                                    labelStyle: poppinsBold.copyWith(
                                      fontSize: 16.sp,
                                      letterSpacing: Adaptive.w(0.3),
                                    ),
                                    tabs: [
                                      FadeAnimation(
                                        delay: 3,
                                        direction: 'Horizontal',
                                        directStart: -Adaptive.w(13),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Tab(text: 'PNS'),
                                            Container(
                                              // margin: EdgeInsets.only(left: Adaptive.w(5)),
                                              height: Adaptive.h(2),
                                              child: VerticalDivider(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                thickness: 1.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FadeAnimation(
                                        delay: 3.5,
                                        direction: 'Horizontal',
                                        directStart: -Adaptive.w(13),
                                        child: Tab(text: 'Non-PNS'),
                                      )
                                    ],
                                    onTap: (value) {
                                      FocusManager.instance.primaryFocus!
                                          .unfocus();
                                      if (value > 0) {
                                        setState(() {
                                          _nip = 'Username';
                                          _inputType = TextInputType.text;
                                          _nipController.clear();
                                        });
                                      } else {
                                        setState(() {
                                          _nip = 'Nomor induk pegawaian';
                                          _inputType = TextInputType.phone;
                                          _nipController.clear();
                                        });
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: Adaptive.h(5)),
                                FadeAnimation(
                                  delay: 3.8,
                                  child: CustomTextField(
                                    controller: _nipController,
                                    focusNode: _nipFocus,
                                    hintText: _nip.toString(),
                                    isShowPrefixIcon: true,
                                    perfixIconData: Icons.account_box_rounded,
                                    inputType: _inputType,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Harap masukan ${_nip.toLowerCase()}!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: Adaptive.h(2)),
                                FadeAnimation(
                                  delay: 3.9,
                                  child: CustomTextField(
                                    controller: _passwordController,
                                    hintText: 'Password',
                                    isPassword: true,
                                    isShowSuffixIcon: true,
                                    isShowPrefixIcon: true,
                                    perfixIconData: Icons.lock_rounded,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Harap masukan password!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: Adaptive.h(2)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FadeAnimation(
                                      delay: 4,
                                      direction: 'Horizontal',
                                      directStart: -Adaptive.w(103),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        child: Text(
                                          'Lupa password?',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        onTap: () async => await launchURL(
                                          context: context,
                                          url:
                                              'https://pns.metrokota.go.id/lupapassword/',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Adaptive.h(5)),
                                FadeAnimation(
                                  delay: 4.3,
                                  direction: 'Horizontal',
                                  directStart: Adaptive.h(130),
                                  child: Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.px,
                                                horizontal: 20.px),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(100),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Masuk',
                                                  style: poppinsMedium.copyWith(
                                                    fontSize: 15.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 15.sp,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                          onTap: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              await BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .login(
                                                nip: _nipController.text,
                                                password:
                                                    _passwordController.text,
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: Adaptive.h(1.5)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
