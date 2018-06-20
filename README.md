# Haxe/hxnodejs externs for the [node-yaml](https://www.npmjs.com/package/node-yaml) npm library

Tested using `node-yaml` version **3.1.1**

Example:
```haxe
import js.npm.Yaml;

Yaml.read("path/to/file.yaml", function(err, data) {
  if (err != null)
    throw err;

  trace(data);
});
```
