import "dart:math";

class RandomOrderIdGenerator {
  static String generateId() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();

    final transactionID = List.generate(
      6,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
    return transactionID;
  }
}
