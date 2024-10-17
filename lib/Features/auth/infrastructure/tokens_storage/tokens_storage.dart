abstract class TokensStorage {
  Future<String?> read();
  Future<void> save(String tokens);
  Future<void> clear();
}
