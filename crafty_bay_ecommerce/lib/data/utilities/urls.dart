class Urls{
  static const String _baseUrl = "https://ecommerce-api.codesilicon.com/api";
  static  String emailVerify(String email) => "$_baseUrl/UserLogin/$email";
  static  String otpVerify(String email, String otp) => "$_baseUrl/VerifyLogin/$email/$otp";
  static  String homeSlider = "$_baseUrl/ListProductSlider";
  static  String categoryList = "$_baseUrl/CategoryList";
  static  String popularProductList = "$_baseUrl/ListProductByRemark/popular";
  static  String specialProductList = "$_baseUrl/ListProductByRemark/special";
  static  String newProductList = "$_baseUrl/ListProductByRemark/new";
  static  String wishListProducts = "$_baseUrl/ProductWishList";
  static  String getProductDetails(int productId) => "$_baseUrl/ProductDetailsById/$productId";
  static String addToCart = "$_baseUrl/CreateCartList";
  static String getCartList = "$_baseUrl/CartList";
  static String getProductByCategory(int categoryId) => "$_baseUrl/CreateCartList/$categoryId";
}