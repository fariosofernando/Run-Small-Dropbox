Map<String, String> commonParameter(String token) {
  return {'Authorization': token, 'Content-Type': 'application/json'};
}

Map<String, String> bodyParameterToAcquireTheTemporaryLink(String path) {
  return {"path": path};
}

Map<String, dynamic> bodyParameterToCopyFile(String onTheWay, String toTheWay) {
  return {"allow_ownership_transfer": false, "allow_shared_folder": false, "autorename": false, "from_path": onTheWay, "to_path": toTheWay};
}

Map<String, dynamic> bodyParameterToMoveFile(String onTheWay, String toTheWay) {
  return {"allow_ownership_transfer": false, "allow_shared_folder": false, "autorename": false, "from_path": onTheWay, "to_path": toTheWay};
}

Map<String, dynamic> bodyParameterForFolderCreation(String path) {
  return {"autorename": false, "path": path};
}

Map<String, dynamic> bodyParameterToDeleteFile(String path) {
  return {"path": path};
}
