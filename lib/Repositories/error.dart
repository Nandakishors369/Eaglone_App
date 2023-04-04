import 'dart:developer';

errorHandler({required int statusCode}) {
  if (statusCode == 401) {
    log("Token , Password error ...etc");
    return "Something went wrong Please try again";
  } else if (statusCode == 403) {
    log("invalid api key please verify");
    return "Forbidden 404";
  } else if (statusCode == 422) {
    log("some field is empty please verify");
    return "Something went wrong";
  } else if (statusCode == 409) {
    log("Conflict already exists");
    return "Already Exists";
  } else if (statusCode == 404) {
    log("Not Found");
    return "Not Found Error";
  } else if (statusCode == 400) {
    log("Bad Request");
    return "Something went wrong bad request";
  } else if (statusCode == 500) {
    log("Server error");
    return "Forbidden 404";
  }
}
