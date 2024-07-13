import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class AnimalCardSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Card(
        margin: const EdgeInsets.all(16.0),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SkeletonAnimation(
                  child: Container(
                    width: double.infinity,
                    height: 300.0,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SkeletonAnimation(
                child: Container(
                  width: 100.0,
                  height: 24.0,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SkeletonAnimation(
                      child: Container(
                        width: double.infinity,
                        height: 20.0,
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        color: Colors.grey[300],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              SkeletonAnimation(
                child: Container(
                  width: double.infinity,
                  height: 48.0,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
