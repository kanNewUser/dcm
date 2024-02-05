import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchNews() async {
    try {
      final snapshot = await _firestore.collection('news').get();
      final newsList = snapshot.docs.map((doc) => doc.data()).toList();
      return newsList.cast<Map<String, dynamic>>();
    } catch (e) {
      log('Error fetching news: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchFacultyMember() async {
    try {
      final snapshot = await _firestore.collection('teachers').get();
      final memberList = snapshot.docs.map((doc) => doc.data()).toList();
      return memberList.cast<Map<String, dynamic>>();
    } catch (e) {
      log('Error fetching teachers: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchCourses() async {
    try {
      final snapshot = await _firestore.collection('courses').get();
      final coursesList = snapshot.docs.map((doc) => doc.data()).toList();
      return coursesList.cast<Map<String, dynamic>>();
    } catch (e) {
      log('Error fetching teachers: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchContact() async {
    try {
      final snapshot = await _firestore.collection('contact').get();
      final contactList = snapshot.docs.map((doc) => doc.data()).toList();
      return contactList.cast<Map<String, dynamic>>();
    } catch (e) {
      log('Error fetching contact: $e');
      return [];
    }
  }
}
