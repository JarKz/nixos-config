# Uses the provided file as filepath and vocabulary (which is hash table semantically) 
# to inject values from vocabulary into file by replacing strings in format "{{ ${key} }}"
# where the key is a key from vocabulary.

filepath: vocabulary:
let
  fileContent = builtins.readFile filepath;
  keys = builtins.map (key: "{{ ${key} }}") (builtins.attrNames vocabulary);
  values = builtins.attrValues vocabulary;
in
builtins.replaceStrings keys values fileContent
