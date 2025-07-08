import 'package:brainza/JobPage/model/job_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  RxInt isSelected = 0.obs;
  RxList<JobModel> jobList = <JobModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJob();
  }

  void tabChange(int index) {
    isSelected.value = index;
    print('Tab changed to index: $index');
  }

  Future<void> fetchJob() async {
    try {
      isLoading.value = true;

      final allJobs = await FirebaseFirestore.instance.collection('jobs').get();
      print("Fetched ${allJobs.docs.length} job(s)");

      final jobs = allJobs.docs
          .map((doc) => JobModel.fromMap(doc.data()))
          .toList();

      jobList.assignAll(jobs);
    } catch (e) {
      print('Error fetching jobs: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
