// String concatenateNames(String? firstName, String? lastName) {
//   // Provide empty string as default if firstName or lastName is null
//   String fName = firstName ?? '';
//   String lName = lastName ?? '';

//   // Combine the names, trimming extra spaces if either is null or empty
//   String fullName = '$fName $lName'.trim();

//   return fullName;
// }

// String replaceArabicNumber({String? input = ''}) {
//   if (input!.isNotEmpty) {
//     const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
//     const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

//     // Loop through each character in the input string
//     for (int i = 0; i < arabic.length; i++) {
//       // Replace each Arabic digit with its English counterpart
//       input = input!.replaceAll(arabic[i], english[i]);
//     }

//     // Print the updated input string
//     print(input);

//     // Return the updated input string
//   }
//   return input!;
// }
