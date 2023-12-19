import 'baca_berita_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../theme.dart';

class BacaBerita extends StatelessWidget {
  const BacaBerita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        // toolbarHeight: 10,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Iconsax.arrow_left,
            color: cBlack,
          ),
        ),

        actions: [
          SizedBox(
            width: 40,
            child: TextButton(
              onPressed: () {
                // Navigator.of(context).push(notifikasi());
              },
              style: TextButton.styleFrom(
                backgroundColor: cWhite,
                shape: const CircleBorder(),
              ),
              child: Icon(
                Iconsax.share,
                color: cBlack,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: BacaBeritaItems(
        logo: 'assets/logos/logo_dermain4.png',
        admin: 'Lazismu Banguntapan Selatan',
        date: DateTime(2023, 4, 1),
        title:
            'LAZISMU Banguntapan Selatan Bagi-Bagi Takjil Gratis LAZISMU Banguntapan Selatan Bagi-Bagi Takjil Gratis',
        imageUrl: 'assets/images/image_berita1.jpg',
        sumber: 'Sumber: LAZISMU',
        isi:
            'Lorem ipsum dolor sit amet consectetur. Proin nec in vulputate risus quis pharetra auctor. Gravida leo placerat scelerisque ac scelerisque ultrices. Sollicitudin massa mi diam sapien mauris odio. Cursus id mattis adipiscing et facilisis orci elit leo. Amet justo non lectus dolor. Sit amet in nunc sociis nisl vitae viverra elit. A mi facilisi mauris viverra est libero. At bibendum maecenas malesuada ut tortor dignissim. In sem neque sit etiam sapien fringilla est. Faucibus feugiat etiam luctus fermentum sem enim viverra.\n\nSed pretium sapien adipiscing commodo quis est faucibus consectetur. Sapien pulvinar placerat nisi etiam vitae massa libero. Urna enim massa ac egestas. Luctus curabitur feugiat convallis tristique nisi tellus amet. Mauris ullamcorper eu at luctus sit. Ultrices risus nisl massa gravida augue in. Pharetra mauris in semper commodo praesent nisl. Etiam posuere est consectetur magna rhoncus. Facilisis faucibus elementum nam consectetur lectus neque velit sed. Tristique nulla duis viverra sit nisi pellentesque. Mi ut mauris elit sodales sem purus.',
      ),
    );
  }
}
