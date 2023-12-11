import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kmajorColor = Colors.black;

final kplayFair =
    GoogleFonts.playfairDisplay(fontSize: 24); //font playFair display

final kpopins = GoogleFonts.poppins(fontSize: 14); //font poppins

const kstar = Icon(
  Icons.star,
  color: Colors.yellow,
  size: 12,
); // for Rating

final kbarDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(4),
  prefixIcon: Icon(
    Icons.search,
    color: kmajorColor,
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: kmajorColor)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: kmajorColor)),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: kmajorColor)),
);
