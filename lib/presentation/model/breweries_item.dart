class BreweriesItem {
  String breweryType;
  int id;
  String latitude;
  String longitude;
  String name;
  String phone;
  String updatedAt;
  String websiteUrl;
  String formatedAddress;

  BreweriesItem(
      {this.breweryType: "",
      this.id,
      this.latitude,
      this.longitude,
      this.name: "",
      this.phone: "",
      this.updatedAt,
      this.websiteUrl: "",
      this.formatedAddress: ""});
}
