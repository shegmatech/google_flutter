import 'package:gsheets/gsheets.dart';
class UserSheetsApi{
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "gsheets-340809",
  "private_key_id": "8c7ecd9e5e6610c785c34a64d2e69dc9d6ca7552",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDbYhEWc5ibWHCh\nnWi3IdCXCKWrVzm0mPgtfCNHzNLmYfpNwDhZmL6fyiURDaA7TF73IQrfTaGdT83W\nmvyJSbt2xz67M/0DBHPjJoHs6Nq5uivYeC91OcOsCSFgZNQVJavCKxF80oIOCw+Y\nfm/C+/HAX/kMLiFEZnuL8lA6786wl64TFwydF8U6ldpeGX7Da6oJXSIF2JsszeXk\nh65iVy6ZrMh0sLjmMF3gmkBi0sBBuZwCSCCYWYROFLbxpLo1/vjBJyv+W9PN6RME\ncX0mzesLZgkypvprDzvDQxsvAoXifHSFgJ22T/IIUcOt1rxp/SRcoI4oM+jQYmGE\ndRztlcKtAgMBAAECggEAE5N0ouQ9wd7qbgF1zqGd01xaLCfkZlEgFC73lviX+SbV\nBwsX/Ca9G9UV6aelnKT79GFmbvambTspyvSZhEaoC7lLx7ij4xkKnkJZZaKBogES\n2IYg9fzpkPhfmhJlOl3aLcFaFiFSqZ4jDiB6KJQCxn/J4WRcY5YhgCNnNVsgvnEg\nLaai16QiRLo7eQNovv35seoOhdrwsEIq9JUqVHz7k3g4JZZ4rcJWxsXjJTXVHnRS\n7f9b/p2mcMsblO3UBlLr9E0fjEunZf7sfI98BPOhDs8G7AD5I83iTUMkdo505F7H\nqu5FXJjg9pTDAcwr3Ns/uOtx7DXcVRMjtX3fLKsuoQKBgQD1UjApnr2bRgWwv8hc\nxpD9aOsWGFWsG508FdZvhqzPLdEP+Y1OuY3G77sPtnWfv9M/o29vUMLYhXdP8U/5\nsBJ73hngV010bLirRr/q0WfMD1BWXigcMaQRcoXgJ7CsilRoqz/xDjG/1Z8qVCXV\n12U5m9PF6irZVU7ZWObcZl4omwKBgQDk7tSniLpjAEXpCeD9dhTHP0ZAdmCtcFIk\nbxTAXJI0rS4181G3vBZPGaRFjM1w3fDOb45cnl4RD6ODt205gysTKLIS23Jem2WH\nG1/yy8idpvsuq4aylvdUjW/Ce89r9OM6tIVNRnzbuJNcekvLNi2auU6Veke5M6hV\ntoSXnjpCVwKBgHJfAOlGgqtTd++xWd43DP233nIMolR9A08x9ylDpmlouOEzvTeI\ntpqaxaFLtYbmzbwLnDZPdqevgbKZlGmaNuPc5j97NDclQOtJLsxxGG1Abnn1p8mN\nMyqXM+cPWgT28Odjf4oIzhTbqTr4xDLwGtdC2Paad6OfbAVUtzzl1NwlAoGAcV1H\nFtMhIQcwl06aCEkhzuypWCCGjTwyoPIUv5DXoZgkavjbfXV5QqA69WndDcgJh+A8\nCecuQ5qP6Ri60KEAgpNDYw0iHHEtHHNU1wFMjazzc0/i+qrBPTBwqEjxFM+GejqM\nTBDcoV1MM54nzDA+8wBSRrjvrWlEMXWZQQ9MYC8CgYBim5CpDZET4/saMjSgGF1e\n36/72uY7lJTbMfjqj8kdNm+cGvy3chqGhSs26JAdGCFTvorpSyOq4x7iy8vo2ag0\nClEueA+XcaAcnGrnm/Rtd4/DjKl2yPZvjpGt91DTTOsk5phVEoCeKeI5/pz5zUmX\nj1gGsFYo3Bs68NDQ8kH//w==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-340809.iam.gserviceaccount.com",
  "client_id": "114247631744565411744",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-340809.iam.gserviceaccount.com"
}
  ''';
  static const _spreadsheetId= '13AlbadSZwZmJBSBbgdLFjPv5e0DIZd8m9dkq9lFANkw';

  //initialize google sheet package
static final _gsheets = GSheets(_credentials);
static Worksheet _userSheet;

static Future init() async{
  final spreadsheet =await _gsheets.spreadsheet(_spreadsheetId);
  _userSheet = await _getWorkSheet(spreadsheet, title: 'Users');
}

static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet,{
      required String title,
}) async {
  try{
    return await spreadsheet.addWorksheet(title);
  } catch (e){
    return spreadsheet.worksheetByTitle(title)!;
  }

}

}