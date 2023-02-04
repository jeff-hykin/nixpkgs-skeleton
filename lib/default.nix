/* Library of low-level helper functions for nix expressions.
 *
 * Please implement (mostly) exhaustive unit tests
 * for new functions in `./tests.nix`.
 */
let

  inherit (import ./fixed-points.nix { inherit lib; }) makeExtensible;

  lib = makeExtensible (self: {
    # often used, or depending on very little
    trivial = import ./trivial.nix { lib = self; };
    fixedPoints = import ./fixed-points.nix { lib = self; };

    # datatypes
    attrsets = import ./attrsets.nix { lib = self; };
    lists = import ./lists.nix { lib = self; };
    strings = import ./strings.nix { lib = self; };
    stringsWithDeps = import ./strings-with-deps.nix { lib = self; };

    # packaging
    customisation = import ./customisation.nix { lib = self; };
    derivations = import ./derivations.nix { lib = self; };
    maintainers = import ../maintainers/maintainer-list.nix;
    teams = import ../maintainers/team-list.nix { lib = self; };
    meta = import ./meta.nix { lib = self; };
    versions = import ./versions.nix { lib = self; };

    # module system
    modules = import ./modules.nix { lib = self; };
    options = import ./options.nix { lib = self; };
    types = import ./types.nix { lib = self; };

    # constants
    licenses = import ./licenses.nix { lib = self; };
    sourceTypes = import ./source-types.nix { lib = self; };
    systems = import ./systems { lib = self; };

    # serialization
    cli = import ./cli.nix { lib = self; };
    generators = import ./generators.nix { lib = self; };

    # misc
    asserts = import ./asserts.nix { lib = self; };
    debug = import ./debug.nix { lib = self; };
    misc = import ./deprecated.nix { lib = self; };

    # domain-specific
    fetchers = import ./fetchers.nix { lib = self; };

    # Eval-time filesystem handling
    path = import ./path { lib = self; };
    filesystem = import ./filesystem.nix { lib = self; };
    sources = import ./sources.nix { lib = self; };

    # back-compat aliases
    platforms = self.systems.doubles;

    # linux kernel configuration
    kernel = import ./kernel.nix { lib = self; };

    add                            = builtins.add;
    addErrorContext                = builtins.addErrorContext;
    attrNames                      = builtins.attrNames;
    concatLists                    = builtins.concatLists;
    deepSeq                        = builtins.deepSeq;
    elem                           = builtins.elem;
    elemAt                         = builtins.elemAt;
    filter                         = builtins.filter;
    genericClosure                 = builtins.genericClosure;
    genList                        = builtins.genList;
    getAttr                        = builtins.getAttr;
    hasAttr                        = builtins.hasAttr;
    head                           = builtins.head;
    isAttrs                        = builtins.isAttrs;
    isBool                         = builtins.isBool;
    isInt                          = builtins.isInt;
    isList                         = builtins.isList;
    isPath                         = builtins.isPath;
    isString                       = builtins.isString;
    length                         = builtins.length;
    lessThan                       = builtins.lessThan;
    listToAttrs                    = builtins.listToAttrs;
    pathExists                     = builtins.pathExists;
    readFile                       = builtins.readFile;
    replaceStrings                 = builtins.replaceStrings;
    seq                            = builtins.seq;
    stringLength                   = builtins.stringLength;
    sub                            = builtins.sub;
    substring                      = builtins.substring;
    tail                           = builtins.tail;
    trace                          = builtins.trace;
    id                             = self.trivial.id;
    const                          = self.trivial.const;
    pipe                           = self.trivial.pipe;
    concat                         = self.trivial.concat;
    or                             = self.trivial.or;
    and                            = self.trivial.and;
    bitAnd                         = self.trivial.bitAnd;
    bitOr                          = self.trivial.bitOr;
    bitXor                         = self.trivial.bitXor;
    bitNot                         = self.trivial.bitNot;
    boolToString                   = self.trivial.boolToString;
    mergeAttrs                     = self.trivial.mergeAttrs;
    flip                           = self.trivial.flip;
    mapNullable                    = self.trivial.mapNullable;
    inNixShell                     = self.trivial.inNixShell;
    isFloat                        = self.trivial.isFloat;
    min                            = self.trivial.min;
    max                            = self.trivial.max;
    importJSON                     = self.trivial.importJSON;
    importTOML                     = self.trivial.importTOML;
    warn                           = self.trivial.warn;
    warnIf                         = self.trivial.warnIf;
    warnIfNot                      = self.trivial.warnIfNot;
    throwIf                        = self.trivial.throwIf;
    throwIfNot                     = self.trivial.throwIfNot;
    checkListOfEnum                = self.trivial.checkListOfEnum;
    info                           = self.trivial.info;
    showWarnings                   = self.trivial.showWarnings;
    nixpkgsVersion                 = self.trivial.nixpkgsVersion;
    version                        = self.trivial.version;
    isInOldestRelease              = self.trivial.isInOldestRelease;
    mod                            = self.trivial.mod;
    compare                        = self.trivial.compare;
    splitByAndCompare              = self.trivial.splitByAndCompare;
    functionArgs                   = self.trivial.functionArgs;
    setFunctionArgs                = self.trivial.setFunctionArgs;
    isFunction                     = self.trivial.isFunction;
    toFunction                     = self.trivial.toFunction;
    toHexString                    = self.trivial.toHexString;
    toBaseDigits                   = self.trivial.toBaseDigits;
    inPureEvalMode                 = self.trivial.inPureEvalMode;
    fix                            = self.fixedPoints.fix;
    fix'                           = self.fixedPoints.fix';
    converge                       = self.fixedPoints.converge;
    extends                        = self.fixedPoints.extends;
    composeExtensions              = self.fixedPoints.composeExtensions;
    composeManyExtensions          = self.fixedPoints.composeManyExtensions;
    makeExtensible                 = self.fixedPoints.makeExtensible;
    makeExtensibleWithCustomName   = self.fixedPoints.makeExtensibleWithCustomName;
    attrByPath                     = self.attrsets.attrByPath;
    hasAttrByPath                  = self.attrsets.hasAttrByPath;
    setAttrByPath                  = self.attrsets.setAttrByPath;
    getAttrFromPath                = self.attrsets.getAttrFromPath;
    attrVals                       = self.attrsets.attrVals;
    attrValues                     = self.attrsets.attrValues;
    getAttrs                       = self.attrsets.getAttrs;
    catAttrs                       = self.attrsets.catAttrs;
    filterAttrs                    = self.attrsets.filterAttrs;
    filterAttrsRecursive           = self.attrsets.filterAttrsRecursive;
    foldAttrs                      = self.attrsets.foldAttrs;
    collect                        = self.attrsets.collect;
    nameValuePair                  = self.attrsets.nameValuePair;
    mapAttrs                       = self.attrsets.mapAttrs;
    mapAttrs'                      = self.attrsets.mapAttrs';
    mapAttrsToList                 = self.attrsets.mapAttrsToList;
    concatMapAttrs                 = self.attrsets.concatMapAttrs;
    mapAttrsRecursive              = self.attrsets.mapAttrsRecursive;
    mapAttrsRecursiveCond          = self.attrsets.mapAttrsRecursiveCond;
    genAttrs                       = self.attrsets.genAttrs;
    isDerivation                   = self.attrsets.isDerivation;
    toDerivation                   = self.attrsets.toDerivation;
    optionalAttrs                  = self.attrsets.optionalAttrs;
    zipAttrsWithNames              = self.attrsets.zipAttrsWithNames;
    zipAttrsWith                   = self.attrsets.zipAttrsWith;
    zipAttrs                       = self.attrsets.zipAttrs;
    recursiveUpdateUntil           = self.attrsets.recursiveUpdateUntil;
    recursiveUpdate                = self.attrsets.recursiveUpdate;
    matchAttrs                     = self.attrsets.matchAttrs;
    overrideExisting               = self.attrsets.overrideExisting;
    showAttrPath                   = self.attrsets.showAttrPath;
    getOutput                      = self.attrsets.getOutput;
    getBin                         = self.attrsets.getBin;
    getLib                         = self.attrsets.getLib;
    getDev                         = self.attrsets.getDev;
    getMan                         = self.attrsets.getMan;
    chooseDevOutputs               = self.attrsets.chooseDevOutputs;
    zipWithNames                   = self.attrsets.zipWithNames;
    zip                            = self.attrsets.zip;
    recurseIntoAttrs               = self.attrsets.recurseIntoAttrs;
    dontRecurseIntoAttrs           = self.attrsets.dontRecurseIntoAttrs;
    cartesianProductOfSets         = self.attrsets.cartesianProductOfSets;
    updateManyAttrsByPath          = self.attrsets.updateManyAttrsByPath;
    singleton                      = self.lists.singleton;
    forEach                        = self.lists.forEach;
    foldr                          = self.lists.foldr;
    fold                           = self.lists.fold;
    foldl                          = self.lists.foldl;
    foldl'                         = self.lists.foldl';
    imap0                          = self.lists.imap0;
    imap1                          = self.lists.imap1;
    concatMap                      = self.lists.concatMap;
    flatten                        = self.lists.flatten;
    remove                         = self.lists.remove;
    findSingle                     = self.lists.findSingle;
    findFirst                      = self.lists.findFirst;
    any                            = self.lists.any;
    all                            = self.lists.all;
    count                          = self.lists.count;
    optional                       = self.lists.optional;
    optionals                      = self.lists.optionals;
    toList                         = self.lists.toList;
    range                          = self.lists.range;
    partition                      = self.lists.partition;
    zipListsWith                   = self.lists.zipListsWith;
    zipLists                       = self.lists.zipLists;
    reverseList                    = self.lists.reverseList;
    listDfs                        = self.lists.listDfs;
    toposort                       = self.lists.toposort;
    sort                           = self.lists.sort;
    naturalSort                    = self.lists.naturalSort;
    compareLists                   = self.lists.compareLists;
    take                           = self.lists.take;
    drop                           = self.lists.drop;
    sublist                        = self.lists.sublist;
    last                           = self.lists.last;
    init                           = self.lists.init;
    crossLists                     = self.lists.crossLists;
    unique                         = self.lists.unique;
    intersectLists                 = self.lists.intersectLists;
    subtractLists                  = self.lists.subtractLists;
    mutuallyExclusive              = self.lists.mutuallyExclusive;
    groupBy                        = self.lists.groupBy;
    groupBy'                       = self.lists.groupBy';
    concatStrings                  = self.strings.concatStrings;
    concatMapStrings               = self.strings.concatMapStrings;
    concatImapStrings              = self.strings.concatImapStrings;
    intersperse                    = self.strings.intersperse;
    concatStringsSep               = self.strings.concatStringsSep;
    concatMapStringsSep            = self.strings.concatMapStringsSep;
    concatImapStringsSep           = self.strings.concatImapStringsSep;
    makeSearchPath                 = self.strings.makeSearchPath;
    makeSearchPathOutput           = self.strings.makeSearchPathOutput;
    makeLibraryPath                = self.strings.makeLibraryPath;
    makeBinPath                    = self.strings.makeBinPath;
    optionalString                 = self.strings.optionalString;
    hasInfix                       = self.strings.hasInfix;
    hasPrefix                      = self.strings.hasPrefix;
    hasSuffix                      = self.strings.hasSuffix;
    stringToCharacters             = self.strings.stringToCharacters;
    stringAsChars                  = self.strings.stringAsChars;
    escape                         = self.strings.escape;
    escapeShellArg                 = self.strings.escapeShellArg;
    escapeShellArgs                = self.strings.escapeShellArgs;
    isStorePath                    = self.strings.isStorePath;
    isStringLike                   = self.strings.isStringLike;
    isValidPosixName               = self.strings.isValidPosixName;
    toShellVar                     = self.strings.toShellVar;
    toShellVars                    = self.strings.toShellVars;
    escapeRegex                    = self.strings.escapeRegex;
    escapeXML                      = self.strings.escapeXML;
    replaceChars                   = self.strings.replaceChars;
    lowerChars                     = self.strings.lowerChars;
    upperChars                     = self.strings.upperChars;
    toLower                        = self.strings.toLower;
    toUpper                        = self.strings.toUpper;
    addContextFrom                 = self.strings.addContextFrom;
    splitString                    = self.strings.splitString;
    removePrefix                   = self.strings.removePrefix;
    removeSuffix                   = self.strings.removeSuffix;
    versionOlder                   = self.strings.versionOlder;
    versionAtLeast                 = self.strings.versionAtLeast;
    getName                        = self.strings.getName;
    getVersion                     = self.strings.getVersion;
    mesonOption                    = self.strings.mesonOption;
    mesonBool                      = self.strings.mesonBool;
    mesonEnable                    = self.strings.mesonEnable;
    nameFromURL                    = self.strings.nameFromURL;
    enableFeature                  = self.strings.enableFeature;
    enableFeatureAs                = self.strings.enableFeatureAs;
    withFeature                    = self.strings.withFeature;
    withFeatureAs                  = self.strings.withFeatureAs;
    fixedWidthString               = self.strings.fixedWidthString;
    fixedWidthNumber               = self.strings.fixedWidthNumber;
    toInt                          = self.strings.toInt;
    toIntBase10                    = self.strings.toIntBase10;
    readPathsFromFile              = self.strings.readPathsFromFile;
    fileContents                   = self.strings.fileContents;
    textClosureList                = self.stringsWithDeps.textClosureList;
    textClosureMap                 = self.stringsWithDeps.textClosureMap;
    noDepEntry                     = self.stringsWithDeps.noDepEntry;
    fullDepEntry                   = self.stringsWithDeps.fullDepEntry;
    packEntry                      = self.stringsWithDeps.packEntry;
    stringAfter                    = self.stringsWithDeps.stringAfter;
    overrideDerivation             = self.customisation.overrideDerivation;
    makeOverridable                = self.customisation.makeOverridable;
    callPackageWith                = self.customisation.callPackageWith;
    callPackagesWith               = self.customisation.callPackagesWith;
    extendDerivation               = self.customisation.extendDerivation;
    hydraJob                       = self.customisation.hydraJob;
    makeScope                      = self.customisation.makeScope;
    makeScopeWithSplicing          = self.customisation.makeScopeWithSplicing;
    lazyDerivation                 = self.derivations.lazyDerivation;
    addMetaAttrs                   = self.meta.addMetaAttrs;
    dontDistribute                 = self.meta.dontDistribute;
    setName                        = self.meta.setName;
    updateName                     = self.meta.updateName;
    appendToName                   = self.meta.appendToName;
    mapDerivationAttrset           = self.meta.mapDerivationAttrset;
    setPrio                        = self.meta.setPrio;
    lowPrio                        = self.meta.lowPrio;
    lowPrioSet                     = self.meta.lowPrioSet;
    hiPrio                         = self.meta.hiPrio;
    hiPrioSet                      = self.meta.hiPrioSet;
    getLicenseFromSpdxId           = self.meta.getLicenseFromSpdxId;
    getExe                         = self.meta.getExe;
    pathType                       = self.sources.pathType;
    pathIsDirectory                = self.sources.pathIsDirectory;
    cleanSourceFilter              = self.sources.cleanSourceFilter;
    cleanSource                    = self.sources.cleanSource;
    sourceByRegex                  = self.sources.sourceByRegex;
    sourceFilesBySuffices          = self.sources.sourceFilesBySuffices;
    commitIdFromGitRepo            = self.sources.commitIdFromGitRepo;
    cleanSourceWith                = self.sources.cleanSourceWith;
    pathHasContext                 = self.sources.pathHasContext;
    canCleanSource                 = self.sources.canCleanSource;
    pathIsRegularFile              = self.sources.pathIsRegularFile;
    pathIsGitRepo                  = self.sources.pathIsGitRepo;
    evalModules                    = self.modules.evalModules;
    setDefaultModuleLocation       = self.modules.setDefaultModuleLocation;
    unifyModuleSyntax              = self.modules.unifyModuleSyntax;
    applyModuleArgsIfFunction      = self.modules.applyModuleArgsIfFunction;
    mergeModules                   = self.modules.mergeModules;
    mergeModules'                  = self.modules.mergeModules';
    mergeOptionDecls               = self.modules.mergeOptionDecls;
    evalOptionValue                = self.modules.evalOptionValue;
    mergeDefinitions               = self.modules.mergeDefinitions;
    pushDownProperties             = self.modules.pushDownProperties;
    dischargeProperties            = self.modules.dischargeProperties;
    filterOverrides                = self.modules.filterOverrides;
    sortProperties                 = self.modules.sortProperties;
    fixupOptionType                = self.modules.fixupOptionType;
    mkIf                           = self.modules.mkIf;
    mkAssert                       = self.modules.mkAssert;
    mkMerge                        = self.modules.mkMerge;
    mkOverride                     = self.modules.mkOverride;
    mkOptionDefault                = self.modules.mkOptionDefault;
    mkDefault                      = self.modules.mkDefault;
    mkImageMediaOverride           = self.modules.mkImageMediaOverride;
    mkForce                        = self.modules.mkForce;
    mkVMOverride                   = self.modules.mkVMOverride;
    mkFixStrictness                = self.modules.mkFixStrictness;
    mkOrder                        = self.modules.mkOrder;
    mkBefore                       = self.modules.mkBefore;
    mkAfter                        = self.modules.mkAfter;
    mkAliasDefinitions             = self.modules.mkAliasDefinitions;
    mkAliasAndWrapDefinitions      = self.modules.mkAliasAndWrapDefinitions;
    fixMergeModules                = self.modules.fixMergeModules;
    mkRemovedOptionModule          = self.modules.mkRemovedOptionModule;
    mkRenamedOptionModule          = self.modules.mkRenamedOptionModule;
    mkRenamedOptionModuleWith      = self.modules.mkRenamedOptionModuleWith;
    mkMergedOptionModule           = self.modules.mkMergedOptionModule;
    mkChangedOptionModule          = self.modules.mkChangedOptionModule;
    mkAliasOptionModule            = self.modules.mkAliasOptionModule;
    mkDerivedConfig                = self.modules.mkDerivedConfig;
    doRename                       = self.modules.doRename;
    mkAliasOptionModuleMD          = self.modules.mkAliasOptionModuleMD;
    isOption                       = self.options.isOption;
    mkEnableOption                 = self.options.mkEnableOption;
    mkSinkUndeclaredOptions        = self.options.mkSinkUndeclaredOptions;
    mergeDefaultOption             = self.options.mergeDefaultOption;
    mergeOneOption                 = self.options.mergeOneOption;
    mergeEqualOption               = self.options.mergeEqualOption;
    mergeUniqueOption              = self.options.mergeUniqueOption;
    getValues                      = self.options.getValues;
    getFiles                       = self.options.getFiles;
    optionAttrSetToDocList         = self.options.optionAttrSetToDocList;
    optionAttrSetToDocList'        = self.options.optionAttrSetToDocList';
    scrubOptionValue               = self.options.scrubOptionValue;
    literalExpression              = self.options.literalExpression;
    literalExample                 = self.options.literalExample;
    literalDocBook                 = self.options.literalDocBook;
    showOption                     = self.options.showOption;
    showOptionWithDefLocs          = self.options.showOptionWithDefLocs;
    showFiles                      = self.options.showFiles;
    unknownModule                  = self.options.unknownModule;
    mkOption                       = self.options.mkOption;
    mkPackageOption                = self.options.mkPackageOption;
    mkPackageOptionMD              = self.options.mkPackageOptionMD;
    mdDoc                          = self.options.mdDoc;
    literalMD                      = self.options.literalMD;
    isType                         = self.types.isType;
    setType                        = self.types.setType;
    defaultTypeMerge               = self.types.defaultTypeMerge;
    defaultFunctor                 = self.types.defaultFunctor;
    isOptionType                   = self.types.isOptionType;
    mkOptionType                   = self.types.mkOptionType;
    assertMsg                      = self.asserts.assertMsg;
    assertOneOf                    = self.asserts.assertOneOf;
    addErrorContextToAttrs         = self.debug.addErrorContextToAttrs;
    traceIf                        = self.debug.traceIf;
    traceVal                       = self.debug.traceVal;
    traceValFn                     = self.debug.traceValFn;
    traceXMLVal                    = self.debug.traceXMLVal;
    traceXMLValMarked              = self.debug.traceXMLValMarked;
    traceSeq                       = self.debug.traceSeq;
    traceSeqN                      = self.debug.traceSeqN;
    traceValSeq                    = self.debug.traceValSeq;
    traceValSeqFn                  = self.debug.traceValSeqFn;
    traceValSeqN                   = self.debug.traceValSeqN;
    traceValSeqNFn                 = self.debug.traceValSeqNFn;
    traceFnSeqN                    = self.debug.traceFnSeqN;
    traceShowVal                   = self.debug.traceShowVal;
    traceShowValMarked             = self.debug.traceShowValMarked;
    showVal                        = self.debug.showVal;
    traceCall                      = self.debug.traceCall;
    traceCall2                     = self.debug.traceCall2;
    traceCall3                     = self.debug.traceCall3;
    traceValIfNot                  = self.debug.traceValIfNot;
    runTests                       = self.debug.runTests;
    testAllTrue                    = self.debug.testAllTrue;
    traceCallXml                   = self.debug.traceCallXml;
    attrNamesToStr                 = self.debug.attrNamesToStr;
    maybeEnv                       = self.misc.maybeEnv;
    defaultMergeArg                = self.misc.defaultMergeArg;
    defaultMerge                   = self.misc.defaultMerge;
    foldArgs                       = self.misc.foldArgs;
    maybeAttrNullable              = self.misc.maybeAttrNullable;
    maybeAttr                      = self.misc.maybeAttr;
    ifEnable                       = self.misc.ifEnable;
    checkFlag                      = self.misc.checkFlag;
    getValue                       = self.misc.getValue;
    checkReqs                      = self.misc.checkReqs;
    uniqList                       = self.misc.uniqList;
    uniqListExt                    = self.misc.uniqListExt;
    condConcat                     = self.misc.condConcat;
    lazyGenericClosure             = self.misc.lazyGenericClosure;
    innerModifySumArgs             = self.misc.innerModifySumArgs;
    modifySumArgs                  = self.misc.modifySumArgs;
    innerClosePropagation          = self.misc.innerClosePropagation;
    closePropagation               = self.misc.closePropagation;
    mapAttrsFlatten                = self.misc.mapAttrsFlatten;
    nvs                            = self.misc.nvs;
    setAttr                        = self.misc.setAttr;
    setAttrMerge                   = self.misc.setAttrMerge;
    mergeAttrsWithFunc             = self.misc.mergeAttrsWithFunc;
    mergeAttrsConcatenateValues    = self.misc.mergeAttrsConcatenateValues;
    mergeAttrsNoOverride           = self.misc.mergeAttrsNoOverride;
    mergeAttrByFunc                = self.misc.mergeAttrByFunc;
    mergeAttrsByFuncDefaults       = self.misc.mergeAttrsByFuncDefaults;
    mergeAttrsByFuncDefaultsClean  = self.misc.mergeAttrsByFuncDefaultsClean;
    mergeAttrBy                    = self.misc.mergeAttrBy;
    fakeHash                       = self.misc.fakeHash;
    fakeSha256                     = self.misc.fakeSha256;
    fakeSha512                     = self.misc.fakeSha512;
    nixType                        = self.misc.nixType;
    imap                           = self.misc.imap;
    splitVersion                   = self.versions.splitVersion;
  });
in lib
