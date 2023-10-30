import 'package:flutter/material.dart';

import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_app/common/widgets/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/container/search_container.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/cart_menu_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/brand_card.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CardCounterIcon(
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                expandedHeight: 440,
                pinned: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(
                    TSizes.defaultSpace,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //* Search Bar
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const SearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      //* Featured Brands
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),

                      //* Custom Border
                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const BrandCard(
                            showBorder: false,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                //* Tabs
                bottom: const TTabBar(tabs: [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Furniture')),
                  Tab(child: Text('Casuals')),
                  Tab(child: Text('Electronics')),
                  Tab(child: Text('Clothes')),
                  Tab(child: Text('Cosmetics')),
                ]),
              )
            ];
          },
          body: const TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  //* Brands
                  children: [
                    RoundedContainer(
                      showBorder: true,
                      borderColor: TColors.darkGrey,
                      backgroundColor: Colors.transparent,
                      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                      child: Column(
                        children: [
                          //* Brand with Product Count 
                          BrandCard(showBorder: false),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
