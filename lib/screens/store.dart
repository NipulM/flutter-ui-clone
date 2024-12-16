import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/store_description_box.dart';
import 'package:flutter_application_1/widgets/store_image.dart';
import 'package:flutter_application_1/widgets/store_item_header.dart';
import 'package:flutter_application_1/widgets/store_item_person_review.dart';
import 'package:flutter_application_1/widgets/store_item_price_and_rating.dart';
import 'package:flutter_application_1/widgets/store_review_all.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nike Store',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat Bold')),
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding:
                    const EdgeInsets.all(16.0), // Add padding inside the box
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const StoreImage(
                      storeImageUrl: 'assets/images/store.png',
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    const StoreItemHeader(
                      itemName: "Nike Air Max ( Pink )",
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    const StoreItemPriceAndRating(itemPrice: 1200),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    const StoreItemDescriptionBox(
                        itemDescription:
                            "Nike Air Max is a sneakers from the Nike Collection, it has various colors from various sizes that is affordable in all form. Check out for the Original Nike because there are lot of Fake product out there and they seem to pose like Nike but they absolutly not Nike. Always wash with designated washing materials and wash with clean water."),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    const StoreItemReviewAllHeader(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    const StoreItemPersonReview(
                        reviewDateAgo: "2 weeks ago",
                        reviewPersonName: "Sabinus",
                        reviewDescription:
                            "The sneakers is really very good and i love the color, i will be buying another one very soon for my brother and also my sister, i recomend this sneaker to anybody. it’s great"),
                  ],
                ),
              ))),
    );
  }
}
