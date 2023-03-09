String getLimitedString(String str, int len) {
  if (str.length > len) {
    return '${str.substring(0, len)}...';
  } else {
    return str;
  }
}
