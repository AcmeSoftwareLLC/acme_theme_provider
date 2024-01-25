import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_request.dart';
import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_success_response.dart';
import 'package:clean_framework/clean_framework.dart';

abstract class TweetDbGateway<O extends DomainModel, R extends TweetDbRequest,
        S extends SuccessDomainInput>
    extends Gateway<O, R, TweetDbSuccessResponse, S> {}
