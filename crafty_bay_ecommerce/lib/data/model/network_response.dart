class NetworkResponse{
  final bool isSuccess;
  final int statusCode;
  final Map<String,dynamic>? responseBody;

  NetworkResponse(this.isSuccess, this.statusCode, this.responseBody,);
}