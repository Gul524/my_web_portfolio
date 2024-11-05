import 'package:flutter/material.dart';
import 'package:my_web_portfolio/configs/colors.dart';
import 'package:my_web_portfolio/configs/sizes.dart';
import 'package:my_web_portfolio/pages/homepage/desktop/desktop_sections/about.dart';
import 'package:my_web_portfolio/pages/homepage/desktop/desktop_sections/contact.dart';
import 'package:my_web_portfolio/pages/homepage/desktop/desktop_sections/home.dart';
import 'package:my_web_portfolio/pages/homepage/desktop/desktop_sections/projects.dart';
import 'package:flutter/material.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  bool _updateTab = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 50) {
        setState(() {
          _isScrolled = true;
        });
      } else {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 50,
        backgroundColor: _isScrolled ? MyColors.themecolor : Colors.transparent,
        title: Text(
          "Portfolio",
          style: TextStyle(
            color: MyColors.primarycolor,
            fontSize: Myfontsize.k30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _scrollToSection(0),
            child: Text(
              "Home",
              style: TextStyle(
                color: _isScrolled ? MyColors.primarycolor :MyColors.themecolor,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _scrollToSection(600),
            child: Text(
              "About",
              style: TextStyle(
                color: _isScrolled ? MyColors.primarycolor :MyColors.themecolor,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _scrollToSection(1200),
            child: Text(
              "Projects",
              style: TextStyle(
                color: _isScrolled ? MyColors.primarycolor :MyColors.themecolor,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _scrollToSection(1800),
            child: Text(
              "Contact",
              style: TextStyle(
                color: _isScrolled ? MyColors.primarycolor :MyColors.themecolor,
              ),
            ),
          ),
          IconButton.outlined(
              onPressed: () {
                if (MyColors.themecolor == Colors.white) {
                  MyColors.themecolor = Colors.black;
                  MyColors.inversethemecolor = Colors.white;
                  _updateTab = !_updateTab;

                } else {
                  MyColors.themecolor = Colors.white;
                  MyColors.inversethemecolor = Colors.black;
                  _updateTab = !_updateTab;
                }
                setState(() {});
                
              },
              icon: Icon(Icons.dark_mode, color: MyColors.inversethemecolor))
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            D_HomeSection(update: _updateTab),
            D_AboutSection(),
            D_ProjectSection(),
            D_ContactSection(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the controller
    super.dispose();
  }
}
