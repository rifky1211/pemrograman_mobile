import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final topDestinationController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 50),
        header(),
        const SizedBox(height: 30),
        personalInformation(),
        const SizedBox(height: 30),
        skills(),
        const SizedBox(height: 30),
        experienceWork(),
      ],
    );
  }

  header() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
        padding: const EdgeInsets.all(2),
        child: const CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
      ),
    );
  }

  personalInformation() {
    List list = [
      ["Name", "Rifky Ardiansyah"],
      ["Address", "Bekasi"],
      ["Phone", "+6282124632268"],
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Information',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          ...list.map(
            (e) {
              return Row(
                children: [
                  Text(
                    e[0],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    ': ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    e[1],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }

  skills() {
    List list = [
      'Golang',
      'Javascript',
      'Java',
      'Dart',
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Language',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(list.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 30 : 10,
                    right: index == list.length - 1 ? 30 : 10,
                    bottom: 10,
                    top: 4,
                  ),
                  child: Material(
                    color: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 16,
                      ),
                      child: Text(
                        list[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  experienceWork() {
    List list = [
      [
        "PT. Astra Honda Motor",
        "Operator Machine",
        "Jakarta",
        "2019 - 2021",
      ],
      [
        "PT. Majapahit Teknologi Nusantara",
        "Frontend Developer",
        "Jakarta",
        "2021 - 2021",
      ],
      [
        "PT. eDOT",
        "Backend Developer",
        "Bandung",
        "2022 - Present",
      ],
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Experience Work',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          ...list.map(
            (e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.work,
                          color: Theme.of(context).primaryColor,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        e[0],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.people,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        e[1],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        e[2],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.date_range,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        e[3],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30)
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
