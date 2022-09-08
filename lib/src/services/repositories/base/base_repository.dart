abstract class BaseRepository<T> {

  Future<T> findById(int id);
  Future<List<T>> getAll();
}