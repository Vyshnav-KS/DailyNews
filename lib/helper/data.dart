import 'package:news_app/models/categoryModel.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl = 'https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

  category.add(categoryModel);

  categoryModel = new CategoryModel();

    categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=966&q=80';

  category.add(categoryModel);

  categoryModel = new CategoryModel();

    categoryModel.categoryName = 'General';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

  category.add(categoryModel);

  categoryModel = new CategoryModel();

    categoryModel.categoryName = 'Health';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80';

  category.add(categoryModel);

  categoryModel = new CategoryModel();

    categoryModel.categoryName = 'Science';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1530973428-5bf2db2e4d71?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

  category.add(categoryModel);

  categoryModel = new CategoryModel();

      categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1587280501635-68a0e82cd5ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

  category.add(categoryModel);

  categoryModel = new CategoryModel();

      categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60';

  category.add(categoryModel);

  categoryModel = new CategoryModel();

  return category;
}