import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // App bar with back button and search icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Course cards
                _buildCourseCard(
                  title: 'VR Course',
                  progress: '13/13 Tasks - 100%',
                  color: const Color(0xFF63E07C),
                  avatars: 2,
                  illustration: 'vr_illustration',
                ),
                const SizedBox(height: 20),
                _buildCommunityCard(
                  title: 'Community',
                  progress: '2/8 Tasks - 35%',
                  color: const Color(0xFF1E1E56),
                  avatars: 4,
                ),
                const SizedBox(height: 20),
                _buildCourseCard(
                  title: 'SMM Course',
                  progress: '4/7 Tasks - 57%',
                  color: const Color(0xFFAA3EFF),
                  avatars: 3,
                  illustration: 'smm_illustration',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String progress,
    required Color color,
    required int avatars,
    required String illustration,
  }) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with avatars
          _buildAvatarGroup(avatars),
          const Spacer(),
          // Task progress text
          Text(
            progress,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          // Course title
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  
  // Separate method for the community card to handle the specific layout
  Widget _buildCommunityCard({
  required String title,
  required String progress,
  required Color color,
  required int avatars,
}) {
  return Container(
    width: double.infinity,
    // Increased height from 170 to 200 to prevent overflow
    height: 200,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top row with left and right avatar groups
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAvatarGroup(avatars),
            // Increased height for avatar container
            SizedBox(
              width: 120,
              height: 80, // Increased from 70 to 80
              child: _buildCompactMultipleAvatars(),
            ),
          ],
        ),
        const Spacer(),
        // Task progress text
        Text(
          progress,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        // Course title
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

  Widget _buildAvatarGroup(int count) {
    return SizedBox(
      height: 30,
      width: count * 20.0 + 10, // Width depends on the number of avatars
      child: Stack(
        children: List.generate(
          count,
          (index) => Positioned(
            left: index * 20.0, // Overlapping effect
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                // color: Colors.orange[300],
               
                color: [Colors.red, Colors.green, Colors.blue, Colors.yellow][index % 4], // Dynamically assign colors  
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: const Icon(Icons.person, size: 15, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // Optimized version with more compact layout
 Widget _buildCompactMultipleAvatars() {
  final colors = [
    Colors.orange,
    Colors.teal,
    Colors.blue,
    Colors.purple,
    Colors.green
  ];
  
  return Stack(
    clipBehavior: Clip.none,
    children: [
      // Top right avatar
      Positioned(
        right: 10,
        top: 0,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: colors[0],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: const Icon(Icons.person, size: 15, color: Colors.white),
        ),
      ),
      // Middle right avatar - adjusted position
      Positioned(
        right: 0,
        top: 20,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: colors[1],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: const Icon(Icons.person, size: 15, color: Colors.white),
        ),
      ),
      // Bottom right avatar - adjusted position
      Positioned(
        right: 15,
        top: 35, // Changed from 40 to 35
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: colors[2],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: const Icon(Icons.person, size: 15, color: Colors.white),
        ),
      ),
      // Middle left avatar - adjusted position
      Positioned(
        right: 50,
        top: 25, // Changed from 30 to 25
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: colors[3],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: const Icon(Icons.person, size: 12, color: Colors.white),
        ),
      ),
      // Center avatar
      Positioned(
        right: 45,
        top: 5,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: colors[4],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: const Icon(Icons.person, size: 12, color: Colors.white),
        ),
      ),
    ],
  );
}
}