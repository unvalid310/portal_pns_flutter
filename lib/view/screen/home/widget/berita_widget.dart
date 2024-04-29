import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_pns_flutter/cubit/berita/berita_cubit.dart';
import 'package:portal_pns_flutter/data/model/mberita.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/home/widget/list_berita_horizontal_widget.dart';
import 'package:portal_pns_flutter/view/screen/home/widget/shimmer/shimmer_berita.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BeritaWidget extends StatelessWidget {
  const BeritaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isLoading = true;
    String _message = '';
    String _title = '';
    List<Mberita> _berita = [];

    return BlocConsumer<BeritaCubit, BeritaState>(
      listener: (context, state) {
        if (state is BeritaProgress) {
          _isLoading = state.isLoading;
        }

        if (state is BeritaSuccess) {
          _berita = state.berita;
        }

        if (state is BeritaError) {
          Map<String, dynamic> _error = (state.message) as Map<String, dynamic>;
          _isLoading = false;
          _message = _error['message'].toString();
          _title = _error['title'].toString();
        }
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(
              vertical: Adaptive.h(3), horizontal: Adaptive.w(5)),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lates Post',
                style: poppinsBold.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: Adaptive.h(2)),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: (_isLoading == true)
                      ? ShimmerBerita()
                      : ListBeritaHorizontalWidget(
                          listBerita: _berita,
                          title: _title,
                          message: _message,
                        ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
