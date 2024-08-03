import 'package:flutter/material.dart';
import 'package:testproj/views/settings_view.dart';

Column drawerItems(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          const Icon(Icons.home),
          Expanded(
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    side: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    padding: const EdgeInsets.only(right: 100),
                  ),
                  child: const Text(
                    "Home",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )))
        ],
      ),
      Row(
        children: [
          const Icon(Icons.settings),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsView()));
                  },
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    side: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    padding: const EdgeInsets.only(right: 100),
                  ),
                  child: const Text(
                    "Settings",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )))
        ],
      ),
      Row(
        children: [
          const Icon(Icons.support_agent_rounded),
          Expanded(
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    side: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    padding: const EdgeInsets.only(right: 100),
                  ),
                  child: const Text(
                    "Support",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    ],
  );
}
