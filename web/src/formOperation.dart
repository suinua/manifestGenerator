import 'dart:html';

void changeSectionColor(DivElement form) {
  String formText = form.text;
  //formTextが「""」か「§」か§を含んでいなければ
  if (formText != "" && formText != "§" && formText.contains("§")) {
    //フォーカス先のIDがdescription,nameでなければ
    if (document.activeElement.id != "description" &&
        document.activeElement.id != "name") {
      form.text = "";

      var textSectionSplit = formText.split("§");
      textSectionSplit.removeAt(0);
      for (var text in textSectionSplit) {
        Map colorList = {
          "0": "#000000",
          "1": "#0000AA",
          "2": "#00AA00",
          "3": "#00AAAA",
          "4": "#AA0000",
          "5": "#AA00AA",
          "6": "#FFAA00",
          "7": "#AAAAAA",
          "8": "#555555",
          "9": "#5555FF",
          "a": "#55FF55",
          "b": "#55FFFF",
          "c": "#FF5555",
          "d": "#FF55FF",
          "e": "#FFFF55",
          "f": "#FFFFFF"
        };
        SpanElement textElement = SpanElement()
          ..style.color = colorList[text[0]]
          ..text = "§" + text;
        form.append(textElement);
      }
    }
  }
}
