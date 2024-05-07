import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemrograman_mobile/features/destination/presentation/bloc/index/index_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pemrograman_mobile/features/destination/presentation/widgets/explore_cities_image.dart';
import 'package:extended_image/extended_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        header(),
        const SizedBox(height: 30),
        search(),
        const SizedBox(height: 40),
        explore(),
      ],
    );
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Hi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Rifky,',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                padding: const EdgeInsets.all(2),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Where do you want to go?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }

  search() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // color of the shadow
            blurRadius: 10, // blur radius
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Discover a city',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                contentPadding: EdgeInsets.all(0),
              ),
              style: TextStyle(fontSize: 20),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_alt,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  explore() {
    List list = [
      'All',
      'Popular',
      'Recommended',
      'Most Viewed',
      'Recent',
    ];

    List listData = [
      ['assets/images/profile.png', 'Nusa Penida, Bali', 'Indonesia', '4.7'],
      ['assets/images/profile.png', 'Nusa Penida, Bali', 'Indonesia', '4.7'],
      ['assets/images/profile.png', 'Nusa Penida, Bali', 'Indonesia', '4.7'],
      ['assets/images/profile.png', 'Nusa Penida, Bali', 'Indonesia', '4.7'],
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore Cities',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(list.length, (index) {
                return GestureDetector(
                  onTap: () {
                    context.read<IndexBloc>().add(OnIndex(index));
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 0 : 10,
                      right: index == list.length - 1 ? 30 : 10,
                      bottom: 10,
                      top: 4,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                          ),
                          child: BlocBuilder<IndexBloc, IndexState>(
                            builder: (context, state) {
                              if (state is IndexLoaded) {
                                return Text(
                                  list[index],
                                  style: TextStyle(
                                    color: index == state.data
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: index == state.data
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: index == state.data ? 17 : 16,
                                  ),
                                );
                              }
                              return Text(
                                list[index],
                                style: TextStyle(
                                  color:
                                      index == 0 ? Colors.black : Colors.grey,
                                  fontWeight: index == 0
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 16,
                                ),
                              );
                            },
                          )),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(listData.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 10,
                    right: index == list.length - 1 ? 30 : 10,
                    bottom: 10,
                    top: 4,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 6,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            listData[index][0],
                            fit: BoxFit.cover,
                            width: 200,
                            // width: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[100]!.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listData[index][1],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.centerLeft,
                                    child: const Icon(
                                      Icons.location_on_outlined,
                                      size: 16,
                                    ),
                                  ),
                                  Text(
                                    listData[index][2],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.centerLeft,
                                    child: const Icon(
                                      Icons.star_border_purple500_outlined,
                                      size: 16,
                                    ),
                                  ),
                                  Text(
                                    listData[index][3],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
