import 'package:get/get_connect.dart';
import 'package:loader_extensions/data/model/giphy_model.dart';

class GiphyRepository extends GetConnect {
  Future<List<GiphyModel>?> findAll() async {
    final response = await get<List<GiphyModel>>(
      'http://api.giphy.com/v1/gifs/trending',
      query: {'api_key': 'ZSZn91ay7hd7ca4t7Ou33t7qbwQ8xE4A'},
      decoder: (response) {
        return response['data']
                ?.map<GiphyModel>(
                  (value) => GiphyModel(
                    id: value['id'],
                    url: value['images']['downsized']['url'],
                  ),
                )
                ?.toList() ??
            [];
      },
    );
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }
}
