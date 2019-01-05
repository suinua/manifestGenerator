class Capabilities {
  Capabilities(): _valueList = <String>[];
  
  List<String> _valueList;
  List<String> get valueList => _valueList;

  void add(String value) => _valueList.add(value);
  void remove(String value) => _valueList.remove(value);
  String toHtml(String value){
    return """
<span id="Capability-$value" style="background:#4ACAA8;display:inline;border-radius: 5px;">
    <font size="5%">$value</font> <span id="removeCapability-$value"><font size="5%">×</font></span>
</span>
    """;
  }
}