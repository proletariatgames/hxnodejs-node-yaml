package js.npm;
import haxe.extern.EitherType;
import js.Error;

@:jsRequire('node-yaml')
extern class Yaml {
  @:overload(function(file:String, options:YamlOptions, callback:Error->Dynamic->Void):Void {})
  static function read(file:String, callback:Error->Dynamic->Void):Void;

  @:overload(function(file:String):Dynamic {})
  static function readSync(file:String, options:YamlOptions):Dynamic;

  @:overload(function(file:EitherType<Int, String>, data:Dynamic, callback:Error->Void):Void {})
  static function write(file:EitherType<Int, String>, data:Dynamic, options:YamlOptions, callback:Error->Void):Void;

  @:overload(function(file:EitherType<Int, String>, data:Dynamic):Void {})
  static function writeSync(file:EitherType<Int, String>, data:Dynamic, options:YamlOptions):Void;

  @:overload(function(str:String):Dynamic {})
  static function parse(str:String, options:{ schema:YamlSchema }):Dynamic;

  @:overload(function(data:Dynamic):String {})
  static function dump(data:Dynamic, options:YamlOptions):String;
}

typedef YamlOptions = {
  /**
    Default: utf8
  **/
  ?encoding:String,

  /**
    schema - specifies a schema to use.
    Default: DefaultSafe
  **/
  ?schema:YamlSchema
}

@:enum abstract YamlSchema(String) from String
{
  /**
    only strings, arrays and plain objects: http://www.yaml.org/spec/1.2/spec.html#id2802346
  **/
  var FailSafe = "FAILSAFE_SCHEMA";

  /**
    all JSON-supported types: http://www.yaml.org/spec/1.2/spec.html#id2803231
  **/
  var JsonSchema = "JSON_SCHEMA";

  /**
    same as JSON_SCHEMA: http://www.yaml.org/spec/1.2/spec.html#id2804923
  **/
  var CoreSchema = "CORE_SCHEMA";

  /**
    all supported YAML types, without unsafe ones (!!js/undefined, !!js/regexp and !!js/function): http://yaml.org/type/
  **/
  var DefaultSafe = "DEFAULT_SAFE_SCHEMA";

  /**
    all supported YAML types.
  **/
  var DefaultFull = "DEFAULT_FULL_SCHEMA";
}
