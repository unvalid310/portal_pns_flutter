import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_pns_flutter/cubit/surat/surat_cubit.dart';
import 'package:portal_pns_flutter/data/model/msurat.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/widget/custom_toast_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TandaTanganPage extends StatefulWidget {
  final SuratModel surat;
  const TandaTanganPage({Key? key, required this.surat}) : super(key: key);

  @override
  State<TandaTanganPage> createState() => _TandaTanganPageState();
}

class _TandaTanganPageState extends State<TandaTanganPage> {
  bool _obscureText = true;
  TextEditingController _passpharseController = TextEditingController();
  final toast = FToast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
            Adaptive.w(5), Adaptive.h(5), Adaptive.w(5), Adaptive.h(1)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Icon(
                      Icons.close_rounded,
                      size: 20.sp,
                      color: ColorsResource.textColor,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: Adaptive.h(5)),
              Image.asset(
                Images.esign,
                height: Adaptive.h(30),
                fit: BoxFit.fitHeight,
              ),
              SizedBox(height: Adaptive.h(3)),
              Text(
                'Masukan Passphrase',
                style: poppinsBold.copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: Adaptive.h(1)),
              TextFormField(
                controller: _passpharseController,
                textAlign: TextAlign.center,
                cursorColor: ColorsResource.primary,
                obscureText: _obscureText,
                style: poppinsBold.copyWith(
                  fontSize: 18.sp,
                  wordSpacing: Adaptive.w(2),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      right: -Adaptive.w(5),
                      top: Adaptive.h(1),
                      bottom: Adaptive.h(1)),
                  hintText: '- - - -',
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorsResource.textColor,
                  ),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(height: Adaptive.h(1)),
              RichText(
                text: TextSpan(
                  style: poppinsRegular.copyWith(
                    fontSize: 14.sp,
                    color: ColorsResource.textColor,
                  ),
                  text: 'Tampilkan passpharse ',
                  children: [
                    TextSpan(
                      text: 'Klik disini!',
                      style: poppinsMedium.copyWith(
                        color: ColorsResource.tabIndicator,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('object _obscureText : $_obscureText');
                          if (_obscureText) {
                            setState(() {
                              _obscureText = false;
                            });
                          } else {
                            setState(() {
                              _obscureText = true;
                            });
                          }
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: Adaptive.h(4)),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Adaptive.h(1), horizontal: Adaptive.w(15)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorsResource.tabIndicator,
                  ),
                  child: Text(
                    'Lanjutkan',
                    style: poppinsMedium.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () async {
                  if (_passpharseController.text.isEmpty) {
                    toast.showToast(
                      child: const CustomToastWidget(
                        message: 'Passpharse wajib diisi!',
                        isError: true,
                      ),
                      positionedToastBuilder: (context, child) => Positioned(
                        bottom: Adaptive.h(8),
                        left: 0,
                        right: 0,
                        child: child,
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                    await BlocProvider.of<SuratCubit>(context).tandatangan(
                      surat: widget.surat,
                      passphrase: _passpharseController.text,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
