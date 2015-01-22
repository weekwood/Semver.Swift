## Swift Semantic Versioning Library

Semver.swift is described by the v2.0.0 specification found at http://semver.org/.

### Usage

```
Semver.valid('1.2.3') // true
Semver.valid('a.b.c') // false
Semver.clean('  =v1.2.3   ') // '1.2.3'
Semver.satisfies('1.2.3', '1.x || >=2.5.0 || 5.0.0 - 7.2.3') // true
Semver.gt('1.2.3', '9.8.7') // false
Semver.lt('1.2.3', '9.8.7') // true

```

### Author

di wu, di.wu@me.com

### License

Semver.swift is available under the MIT license. See the LICENSE file for more info.
