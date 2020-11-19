import 'package:flutter_test/flutter_test.dart';

import '../lib/Models/job.dart';
import '../lib/utilities/common_functions.dart';

void main() {
  group("Filter job by Date", () {
    List<Job> jobs = [
      new Job(
          name: "Job 1",
          department: "Tech",
          details: [],
          creationDate: DateTime.now(),
          shortDescription: "",
          longDescription: "",
          rol: ""),
      new Job(
          name: "Job 1",
          department: "Tech",
          details: [],
          creationDate: DateTime.now(),
          shortDescription: "",
          longDescription: "",
          rol: "")
    ];
    test('can manage empty jobs', () {
      // Build our app and trigger a frame.

      // Verify that our counter starts at 0.
      expect(filterJobsByDate([]), []);
    });
    test('input and output must be same length', () {
      // Verify that our counter starts at 0.
      expect(filterJobsByDate(jobs).length, jobs.length);
    });
  });
  group("Mail validator", () {
    test('Valid mail must have . and @', () {
      // Build our app and trigger a frame.

      // Verify that our counter starts at 0.
      expect(validateEmail("julioortizgmail.com"), false);
      expect(validateEmail("julioortiz@gmail.com"), true);
    });
  });
}
