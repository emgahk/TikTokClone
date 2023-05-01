import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            body: TabBarView(children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width > 800 ? 5 : 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14),
                itemBuilder: (context, index) => Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 14,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/banana.jpg',
                          image:
                              'https://cdn.pixabay.com/photo/2023/03/25/16/02/hummingbird-7876355_1280.jpg'),
                    ),
                    const Positioned(
                        bottom: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow_outlined,
                              size: Sizes.size28,
                              color: Colors.white,
                            ),
                            Gaps.h3,
                            Text(
                              '4.1M',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              const Center(
                child: Text('Page two'),
              ),
            ]),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text('니꼬'),
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                    child: width < 900
                        ? Column(
                            children: [
                              Gaps.v20,
                              const CircleAvatar(
                                radius: 50,
                                foregroundImage: NetworkImage(
                                    'https://avatars.githubusercontent.com/u/3612017'),
                                child: Text('니꼬'),
                              ),
                              Gaps.v20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '@니꼬',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Sizes.size18),
                                  ),
                                  Gaps.h5,
                                  FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    size: Sizes.size16,
                                    color: Colors.blue.shade500,
                                  ),
                                ],
                              ),
                              Gaps.v24,
                              SizedBox(
                                height: Sizes.size52,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const UserAccount(
                                      userCount: '97',
                                      userText: 'Following',
                                    ),
                                    VerticalDivider(
                                      width: Sizes.size32,
                                      thickness: Sizes.size1,
                                      color: Colors.grey.shade400,
                                      indent: Sizes.size14,
                                      endIndent: Sizes.size14,
                                    ),
                                    const UserAccount(
                                      userCount: '10.5M',
                                      userText: 'Followers',
                                    ),
                                    VerticalDivider(
                                      width: Sizes.size32,
                                      thickness: Sizes.size1,
                                      color: Colors.grey.shade400,
                                      indent: Sizes.size14,
                                      endIndent: Sizes.size14,
                                    ),
                                    const UserAccount(
                                      userCount: '194.3M',
                                      userText: 'Likes',
                                    ),
                                  ],
                                ),
                              ),
                              Gaps.v14,
                              FractionallySizedBox(
                                widthFactor: 0.7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: Sizes.size14,
                                          horizontal: Sizes.size60),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(Sizes.size4),
                                        ),
                                      ),
                                      child: const Text(
                                        'Follow',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Gaps.h5,
                                    Container(
                                      padding:
                                          const EdgeInsets.all(Sizes.size12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1),
                                      ),
                                      child: const FaIcon(
                                        FontAwesomeIcons.youtube,
                                        size: Sizes.size20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Gaps.h5,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Sizes.size16,
                                          vertical: Sizes.size12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1),
                                      ),
                                      child: const FaIcon(
                                        FontAwesomeIcons.caretDown,
                                        size: Sizes.size20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gaps.h5,
                              Gaps.v14,
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizes.size32),
                                child: Text(
                                  'All highlights and where to watch live matches on FIFA + I wonder how it would look',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Gaps.v14,
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.link,
                                    size: Sizes.size12,
                                  ),
                                  Gaps.h4,
                                  Text(
                                    'https://nomadcoders.co',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Gaps.v20,
                            ],
                          )
                        : Column(
                            children: [
                              Gaps.v10,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const CircleAvatar(
                                        radius: 50,
                                        foregroundImage: NetworkImage(
                                            'https://avatars.githubusercontent.com/u/3612017'),
                                        child: Text('니꼬'),
                                      ),
                                      Gaps.v10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            '@니꼬',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: Sizes.size18),
                                          ),
                                          Gaps.h5,
                                          FaIcon(
                                            FontAwesomeIcons.solidCircleCheck,
                                            size: Sizes.size16,
                                            color: Colors.blue.shade500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Gaps.h96,
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: Sizes.size48,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const UserAccount(
                                              userCount: '97',
                                              userText: 'Following',
                                            ),
                                            VerticalDivider(
                                              width: Sizes.size32,
                                              thickness: Sizes.size1,
                                              color: Colors.grey.shade400,
                                              indent: Sizes.size14,
                                              endIndent: Sizes.size14,
                                            ),
                                            const UserAccount(
                                              userCount: '10.5M',
                                              userText: 'Followers',
                                            ),
                                            VerticalDivider(
                                              width: Sizes.size32,
                                              thickness: Sizes.size1,
                                              color: Colors.grey.shade400,
                                              indent: Sizes.size14,
                                              endIndent: Sizes.size14,
                                            ),
                                            const UserAccount(
                                              userCount: '194.3M',
                                              userText: 'Likes',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gaps.v20,
                                      SizedBox(
                                        width: 300,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: Sizes.size14,
                                                      horizontal: Sizes.size60),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(Sizes.size4),
                                                ),
                                              ),
                                              child: const Text(
                                                'Follow',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Gaps.h5,
                                            Container(
                                              padding: const EdgeInsets.all(
                                                  Sizes.size12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1),
                                              ),
                                              child: const FaIcon(
                                                FontAwesomeIcons.youtube,
                                                size: Sizes.size20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Gaps.h5,
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Sizes.size16,
                                                      vertical: Sizes.size12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1),
                                              ),
                                              child: const FaIcon(
                                                FontAwesomeIcons.caretDown,
                                                size: Sizes.size20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Gaps.v20,
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizes.size32),
                                child: Text(
                                  'All highlights and where to watch live matches on FIFA + I wonder how it would look',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Gaps.v14,
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.link,
                                    size: Sizes.size12,
                                  ),
                                  Gaps.h4,
                                  Text(
                                    'https://nomadcoders.co',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          )),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                )
              ];
            },
          ),
        ),
      ),
    );
  }
}

class UserAccount extends StatelessWidget {
  final String userText, userCount;
  const UserAccount({
    super.key,
    required this.userText,
    required this.userCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userCount,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: Sizes.size18),
        ),
        Gaps.v3,
        Text(
          userText,
          style: TextStyle(color: Colors.grey.shade500),
        ),
      ],
    );
  }
}
