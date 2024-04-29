import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBerita extends StatelessWidget {
  const ShimmerBerita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _dummyBerita = [
      {
        'image':
            'https://info.metrokota.go.id/wp-content/uploads/sites/3/2024/01/IMG-20240124-WA0025.jpg',
        'title': 'Pimpin Apel Mingguan Wahdi Ingatkan Kedisiplinan Pegawai',
        'description':
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
        'data': '2023-01-08'
      },
      {
        'image':
            'https://info.metrokota.go.id/wp-content/uploads/sites/3/2024/01/IMG-20240124-WA0025.jpg',
        'title': 'Pimpin Apel Mingguan Wahdi Ingatkan Kedisiplinan Pegawai',
        'description':
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
        'data': '2023-01-09'
      },
      {
        'image':
            'https://info.metrokota.go.id/wp-content/uploads/sites/3/2024/01/IMG-20240124-WA0025.jpg',
        'title': 'Pimpin Apel Mingguan Wahdi Ingatkan Kedisiplinan Pegawai',
        'description':
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
        'data': '2023-01-09'
      },
      {
        'image':
            'https://info.metrokota.go.id/wp-content/uploads/sites/3/2024/01/IMG-20240124-WA0025.jpg',
        'title': 'Pimpin Apel Mingguan Wahdi Ingatkan Kedisiplinan Pegawai',
        'description':
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
        'data': '2023-01-09'
      },
      {
        'image':
            'https://info.metrokota.go.id/wp-content/uploads/sites/3/2024/01/IMG-20240124-WA0025.jpg',
        'title': 'Pimpin Apel Mingguan Wahdi Ingatkan Kedisiplinan Pegawai',
        'description':
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
        'data': '2023-01-09'
      },
      {
        'image':
            'https://info.metrokota.go.id/wp-content/uploads/sites/3/2024/01/IMG-20240124-WA0025.jpg',
        'title': 'Pimpin Apel Mingguan Wahdi Ingatkan Kedisiplinan Pegawai',
        'description':
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
        'data': '2023-01-09'
      },
      {
        'image':
            'https://info.metrokota.go.id/wp-content/uploads/sites/3/2024/01/IMG-20240124-WA0025.jpg',
        'title': 'Pimpin Apel Mingguan Wahdi Ingatkan Kedisiplinan Pegawai',
        'description':
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
        'data': '2023-01-09'
      },
      {
        'image':
            'https://info.metrokota.go.id/wp-content/uploads/sites/3/2024/01/IMG-20240124-WA0025.jpg',
        'title': 'Pimpin Apel Mingguan Wahdi Ingatkan Kedisiplinan Pegawai',
        'description':
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
        'data': '2023-01-09'
      },
    ] as List<Map<String, dynamic>>;
    return Row(
      children: [
        for (var item in _dummyBerita)
          Container(
            margin: EdgeInsets.only(right: Adaptive.w(3)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: Adaptive.w(50),
            child: Column(
              children: [
                Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          width: double.infinity,
                          height: Adaptive.h(15),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Adaptive.h(1.5), horizontal: Adaptive.w(2.5)),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          child: Text(
                            'Judul',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: poppinsMedium.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(0.5)),
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          child: Text(
                            'Hari, DD - MMM - YYYY',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: poppinsLight.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(1)),
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          child: Text(
                            'Judul',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: poppinsMedium.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(0.2)),
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          child: Text(
                            'Judul',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: poppinsMedium.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
