import 'dart:html';

void changeSectionColor(DivElement form) {
  String formText = form.text;
  //formTextが空、§でなければ
  if (formText != "" && formText != "§") {
    //フォーカス先のIDがdescription,nameでなければ
    if (document.activeElement.id != "description" &&
        document.activeElement.id != "name") {
      form.text = "";

      var textSectionSplit = formText.split("§");
      textSectionSplit.removeAt(0);
      for (var text in textSectionSplit) {
        Map colorList = {
          "0": "#000000",
          "1": "#00002A",
          "2": "#002A00",
          "3": "#002A2A",
          "4": "#2A0000",
          "5": "#2A002A",
          "6": "#2A2A00",
          "7": "#2A2A2A",
          "8": "#151515",
          "9": "#15153F",
          "a": "#153F15",
          "b": "#153F3F",
          "c": "#3F1515",
          "d": "#3F153F",
          "e": "#3F3F15",
          "f": "#3F3F3F"
        };
        SpanElement space = SpanElement()..text = " ";
        SpanElement textElement = SpanElement()
          ..style.color = colorList[text[0]]
          ..text = "§" + text;
        form.append(textElement);
        form.append(space);
      }
    }
  }
}
