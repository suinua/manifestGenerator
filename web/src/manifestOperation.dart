import 'dart:html';

void copyManifest(Event event) {
  TextAreaElement resultElement = querySelector("#result");
  if (resultElement == null) {
    window.alert("manifestを生成してください");
  } else {
    execCopy(resultElement.value);
    window.alert("クリップボードにコピーしました");
  }
}

void downloadManifest(Event event) {
  TextAreaElement resultElement = querySelector("#result");
  if (resultElement == null) {
    window.alert("manifestを生成してください");
  } else {
    download(resultElement.value);
    window.alert("ダウンロードしました");
  }
}

void execCopy(String copyText) {
  DivElement copyTextElement = DivElement();

  //pre要素追加、textの置き換え
  copyTextElement.append(PreElement()).text = copyText;
  document.body.append(copyTextElement);

  //選択、コピー
  window.getSelection().selectAllChildren(copyTextElement);
  document.execCommand('copy');

  //削除
  copyTextElement.remove();
}

void download(String downloadText) {
  String encodedFileContents = Uri.encodeComponent(downloadText);

  new AnchorElement(href: "data:text/plain;charset=utf-8,$encodedFileContents")
    ..setAttribute("download", "manifest.json")
    ..click();
}
