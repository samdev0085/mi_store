import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/const.dart';

import '../widgets/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Text('Usama Umar',
              style: kplayFair),
        ),
        Container(
          height: 98,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF1D2929)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                            child: Image.asset('assets/fallback_user.png'))),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Usama Umar',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        const SizedBox(
                          height: 2,
                        ),
                        Text('Usamay146@gmail.com',
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70)),
                        Text('03107890085',
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ProfileTile(
          icon: Icons.settings,
          title: 'Settings',
        ),
        ProfileTile(
          icon: Icons.share,
          title: 'Share',
        ),
        ProfileTile(
          icon: Icons.support,
          title: 'Support',
        ),
      ],
    );
  }
}


