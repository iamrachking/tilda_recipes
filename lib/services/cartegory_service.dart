import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tilda_recipes/models/category_model.dart';

class CartegoryService {
  final CollectionReference _categoryRef = FirebaseFirestore.instance
      .collection("categories");
  Future<void> addCategory(Category category) async {
    await _categoryRef.add(category.toMap());
  }

  Stream<List<Category>> getCategories() {
    return _categoryRef.snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (doc) =>
                Category.fromMap(doc.data() as Map<String, dynamic>, doc.id),
          )
          .toList();
    });
  }

  Future<List<Category>> getOnceCategories() async {
    final snapshot = await _categoryRef.get();
    return snapshot.docs
        .map(
          (doc) => Category.fromMap(doc.data() as Map<String, dynamic>, doc.id),
        )
        .toList();
  }

  Future<void> updateCategory(Category category) async {
    await _categoryRef.doc(category.categoryId).update(category.toMap());
  }

  Future<void> deleteCategory(String categoryId) async {
    await _categoryRef.doc(categoryId).delete();
  }
}
