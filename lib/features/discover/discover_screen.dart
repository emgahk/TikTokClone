import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

final tabs = ['Top', 'Users', 'Videos', 'Sounds', 'LIVE', 'Shopping', 'Brands'];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController =
      TextEditingController(text: 'Initial Text');
  void _onSearchChanged(String value) {
    // print('Searching $value');
  }

  void _onSearchSubmitted(String value) {
    // print('Submitting $value');
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tabs.length,
      child: GestureDetector(
        onTap: _onScaffoldTap,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.sliders)),
              )
            ],
            automaticallyImplyLeading: true,
            leading: IconButton(
                onPressed: () {},
                icon: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.arrow_back_ios),
                )),
            elevation: 1,
            bottom: TabBar(
              onTap: (context) => _onScaffoldTap,
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
              isScrollable: true,
              labelStyle: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
              indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
              tabs: [
                for (var tab in tabs) Tab(text: tab),
              ],
            ),
            title: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: Breakpoints.sm,
              ),
              child: CupertinoSearchTextField(
                style: TextStyle(
                    color: isDarkMode(context) ? Colors.white : Colors.black),
                prefixIcon: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: isDarkMode(context)
                      ? Colors.grey.shade300
                      : Colors.grey.shade900,
                ),
                controller: _textEditingController,
                onChanged: _onSearchChanged,
                onSubmitted: _onSearchSubmitted,
              ),
            ),
          ),
          body: TabBarView(children: [
            GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(Sizes.size6),
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width > Breakpoints.md ? 5 : 2,
                    crossAxisSpacing: Sizes.size10,
                    mainAxisSpacing: Sizes.size10,
                    childAspectRatio: 9 / 21),
                itemBuilder: (context, index) => LayoutBuilder(
                      builder: (context, constraints) => Column(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size4)),
                            child: AspectRatio(
                              aspectRatio: 9 / 16,
                              child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/images/banana.jpg',
                                  image:
                                      'https://cdn.pixabay.com/photo/2023/03/25/16/02/hummingbird-7876355_1280.jpg'),
                            ),
                          ),
                          Gaps.v10,
                          const Text(
                            'This is very long caption for my tiktok that im upload just now currently',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold),
                          ),
                          Gaps.v8,
                          if (constraints.maxWidth < 200 ||
                              constraints.maxWidth > 250)
                            DefaultTextStyle(
                              style: TextStyle(
                                  color: isDarkMode(context)
                                      ? Colors.grey.shade300
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.w600),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                        'https://avatars.githubusercontent.com/u/3612017'),
                                  ),
                                  Gaps.h4,
                                  const Expanded(
                                    child: Text(
                                      'My avatar is going to be very long',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Gaps.h4,
                                  FaIcon(
                                    FontAwesomeIcons.heart,
                                    size: Sizes.size16,
                                    color: Colors.grey.shade600,
                                  ),
                                  Gaps.h2,
                                  const Text(
                                    '2.5M',
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    )),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: Sizes.size28),
                ),
              )
          ]),
        ),
      ),
    );
  }
}
