let
  templateConfig = import ./template-config.nix;

  defaultConfig = fromDir: toDir: file:
    {
      "${toDir}/${file}".text = builtins.readFile "${fromDir}/${file}";
    };
  sourcedConfig = fromDir: toDir: file:
    {
      "${toDir}/${file}".source = "${fromDir}/${file}";
    };
  templatedConfig = vocabulary: fromDir: toDir: file:
    {
      "${toDir}/${file}".text = templateConfig "${fromDir}/${file}" vocabulary;
    };

  importEntry = mkConfigFunction: fromEntry: toDir:
    if (builtins.readFileType fromEntry) == "directory"
    then
      let
        entries = builtins.attrNames (builtins.readDir fromEntry);
        childEntries = builtins.map (entry: "${fromEntry}/${entry}") entries;
        nextToDir = builtins.unsafeDiscardStringContext "${toDir}/${builtins.baseNameOf fromEntry}";
      in
      importListOfEntries mkConfigFunction childEntries nextToDir
    else
      let
        parentDir = builtins.dirOf fromEntry;
        childEntry = builtins.unsafeDiscardStringContext (builtins.baseNameOf fromEntry);
      in
      mkConfigFunction parentDir toDir childEntry;

  importListOfEntries = mkConfigFunction: listOfEntries: toDir:
    builtins.foldl'
      (acc: file: file // acc)
      { }
      (builtins.map (fromEntry: importEntry mkConfigFunction fromEntry toDir) listOfEntries);

  importConfig = mkConfigFunction: genericFrom: toDir:
    if (builtins.typeOf genericFrom) == "list"
    then
      importListOfEntries mkConfigFunction genericFrom toDir
    else
      importEntry mkConfigFunction genericFrom toDir;
in
{
  # Imports the config files from specific directory and creates the table
  # in format: { "${toDir}".text = configFileContent }
  # Params:
  #   - from: [path] | path
  #   - toDir: path
  import = (importConfig defaultConfig);

  # Imports the config files from specific directory and creates the table
  # in format: { "${toDir}".source = configFile }
  # Params:
  #   - from: [path] | path
  #   - toDir: path
  importSourced = (importConfig sourcedConfig);

  # Import the config files from specific directory and creates the table
  # with using vocabulary in format: { $"toDir".text = configFileContent }
  #
  # Injection from vocabulary to template of config file requires existence
  # of "{{ ${key} }}" string and it will be replaced by corresponding value.
  # Params:
  #    - vocabulary: table
  #    - from: [path] | path
  #    - toDir: path
  importTemplated = vocabulary: (importConfig (templatedConfig vocabulary));
}

