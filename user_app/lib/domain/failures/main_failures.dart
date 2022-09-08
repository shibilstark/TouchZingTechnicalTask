// ignore_for_file: public_member_api_docs, sort_constructors_first
enum FailureType { server, client, network }

class MainFailures {
  final FailureType type;
  MainFailures({required this.type});
}
