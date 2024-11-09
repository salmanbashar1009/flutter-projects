class Urls{
  static const String _baseUrl = "https://ecommerce-api.codesilicon.com/api";
  static  String emailVerify(String email) => "$_baseUrl/UserLogin/$email";
  static  String otpVerify(String email, String otp) => "$_baseUrl/VerifyLogin/$email/$otp";
}