import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/add_post/domain/add_post_entity.dart';
import 'package:example/features/add_post/domain/add_post_ui_output.dart';
import 'package:example/features/add_post/external_interface/add_post_gateway.dart';
import 'package:example/features/add_post/external_interface/add_post_image_picker_gateway.dart';
import 'package:example/features/add_post/external_interface/get_random_user_gateway.dart';
import 'package:example/features/theme/tweet.dart';

class AddPostUseCase extends UseCase<AddPostEntity> {
  AddPostUseCase()
      : super(
          entity: AddPostEntity(),
          outputFilters: {
            AddPostUIOutput: (AddPostEntity entity) {
              final noteListOutput = entity.tweets.values
                  .map(
                    (note) => AddPostOutput(
                      userName: note.userName,
                      imagePath: note.imagePath,
                    ),
                  )
                  .toList();
              return AddPostUIOutput(
                userName: entity.userName,
                imagePath: entity.imagePath,
                tweets: noteListOutput,
              );
            },
          },
        );

  void onUserNameEntered({required String userName}) {
    entity = entity.merge(userName: userName);
  }

  Future<void> pickImage() async {
    await request<AddPostPickerGatewayOutput, AddPostPickerGatewaySuccessInput>(
      AddPostPickerGatewayOutput(),
      onSuccess: (AddPostPickerGatewaySuccessInput input) {
        return entity.merge(
          imagePath: input.imagePath,
        );
      },
      onFailure: (failure) => entity,
    );
  }

  Future<void> getRandomUser() async {
    await request<GetRandomUserGatewayOutput, GetRandomUserSuccessInput>(
      GetRandomUserGatewayOutput(),
      onSuccess: (input) {
        final getRandomUser = <String, RandomUsers>{};
        for (final randomUser in input.randomUsers) {
          getRandomUser[randomUser.userEmail] = RandomUsers(
            firstName: randomUser.firstName,
            lastName: randomUser.lastName,
            userEmail: randomUser.userEmail,
            userImage: randomUser.userImage,
          );
        }

        return entity.merge(
          randomUsers: getRandomUser,
        );
      },
      onFailure: (failure) {
        return entity;
      },
    );
  }

  Future<void> addTweet() async {
    await request<AddPostGatewayOutput, AddPostSuccessInput>(
      AddPostGatewayOutput(
        tweet: Tweet(
          userName: entity.userName,
          imagePath: entity.imagePath,
        ),
      ),
      onSuccess: (input) {
        final notes = <String, Tweet>{};
        for (final note in input.tweets) {
          notes[note.userName] = Tweet(
            userName: note.userName,
            imagePath: note.imagePath,
          );
        }
        return entity.merge(
          tweets: notes,
        );
      },
      onFailure: (e) {
        print('the error is: ${e.message}');
        return entity;
      },
    );
    await refresh();
  }

  Future<void> refresh() async {
    entity = AddPostEntity();
  }
}
