// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ConnectivtyStatusWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isConnected = ref.watch(internetProvider);

//     if (isConnected) return SizedBox.shrink(); // Hide if connected

//     return Positioned(
//       top: 0,
//       left: 0,
//       right: 0,
//       child: Container(
//         color: Colors.red,
//         padding: EdgeInsets.symmetric(vertical: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("No Internet Connection",
//                 style: TextStyle(color: Colors.white)),
//             TextButton(
//               onPressed: () =>
//                   ref.read(internetProvider.notifier)._retryFailedRequests(),
//               child: Text("Retry", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
