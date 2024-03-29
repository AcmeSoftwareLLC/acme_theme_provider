import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/core/database/acme_database.dart';
import 'package:acme_theme_example/core/database/db_request.dart';
import 'package:acme_theme_example/core/database/db_success_response.dart';
import 'package:flutter/widgets.dart';

abstract class DbExternalInterface<R extends DbRequest,
    S extends DbSuccessResponse> extends ExternalInterface<R, S> {
  DbExternalInterface({
    required List<GatewayConnection<Gateway>> gatewayConnections,
  })  : db = AcmeDatabase(),
        super(gatewayConnections) {
    db.init();
  }

  @protected
  final AcmeDatabase db;
}
