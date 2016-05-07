//
//  Semver.swift
//  Semver
//
//  Created by di wu on 1/20/15.
//  Copyright (c) 2015 di wu. All rights reserved.
//

import Foundation

struct Regex {
    var pattern: String {
        didSet {
            updateRegex()
        }
    }
    var expressionOptions: NSRegularExpressionOptions {
        didSet {
            updateRegex()
        }
    }
    var matchingOptions: NSMatchingOptions
    
    var regex: NSRegularExpression?
    
    init(pattern: String, expressionOptions: NSRegularExpressionOptions, matchingOptions: NSMatchingOptions) {
        self.pattern = pattern
        self.expressionOptions = expressionOptions
        self.matchingOptions = matchingOptions
        updateRegex()
    }
    
    init(pattern: String) {
        self.pattern = pattern
        expressionOptions = NSRegularExpressionOptions.CaseInsensitive
        matchingOptions = NSMatchingOptions.ReportProgress
        updateRegex()
    }
    
    mutating func updateRegex() {
        do {
            regex = try NSRegularExpression(pattern: pattern, options: expressionOptions)
        } catch {
            print(error)
        }
    }
}

extension String {
    func matchRegex(pattern: Regex) -> Bool {
        let range: NSRange = NSMakeRange(0, characters.count)
        if pattern.regex != nil {
            let matches: [AnyObject] = pattern.regex!.matchesInString(self, options: pattern.matchingOptions, range: range)
            return matches.count > 0
        }
        return false
    }
    
    func match(patternString: String) -> Bool {
        return self.matchRegex(Regex(pattern: patternString))
    }
    
    func replaceRegex(pattern: Regex, template: String) -> String {
        if self.matchRegex(pattern) {
            let range: NSRange = NSMakeRange(0, characters.count)
            if pattern.regex != nil {
                return pattern.regex!.stringByReplacingMatchesInString(self, options: pattern.matchingOptions, range: range, withTemplate: template)
            }
        }
        return self
    }
    
    func replace(pattern: String, template: String) -> String {
        return self.replaceRegex(Regex(pattern: pattern), template: template)
    }
}


public class Semver {
    
    let SemVerRegexp = "\\A(\\d+\\.\\d+\\.\\d+)(-([0-9A-Za-z-]+(\\.[0-9A-Za-z-]+)*))?(\\+([0-9A-Za-z-]+(\\.[0-9A-Za-z-]+)*))?\\Z"
    
    var major: String = ""
    var minor: String = ""
    var patch: String = ""
    var pre: String = ""
    var build: String = ""
    var versionStr: String = ""
    
    let BUILD_DELIMITER: String = "+"
    let PRERELEASE_DELIMITER: String = "-"
    let VERSION_DELIMITER: String  = "."
    let IGNORE_PREFIX: String = "v"
    let IGNORE_EQ: String = "="
    
    required public init(){
        
    }
    
    public class func version() -> String{
        return "0.1.2"
    }
    
    convenience init(version: String!){
        self.init()
        self.versionStr = version
        if valid(){
            var v = versionStr.componentsSeparatedByString(VERSION_DELIMITER) as Array
            major = v[0]
            minor = v[1]
            patch = v[2]
            
            var prerelease = versionStr.componentsSeparatedByString(PRERELEASE_DELIMITER) as Array
            if (prerelease.count > 1) {
                pre = prerelease[1]
            }
            
            var buildVersion = versionStr.componentsSeparatedByString(BUILD_DELIMITER) as Array
            if (buildVersion.count > 1) {
                build = buildVersion[1]
            }
        }
    }
    
    func diff(version2: String) -> Int{
        let version = Semver(version: version2)
        if (major.compare(version.major) != .OrderedSame){
            return major.compare(version.major).rawValue
        }
        
        if (minor.compare(version.minor) != .OrderedSame){
            return minor.compare(version.minor).rawValue
        }
        
        if (patch.compare(version.patch) != .OrderedSame){
            return patch.compare(version.patch, options: NSStringCompareOptions.NumericSearch).rawValue
        }
        
        return 0
    }
    
    public class func valid(version: String) -> Bool{
        return Semver(version: version).valid()
    }
    
    public func valid() -> Bool{
        if let _ = versionStr.rangeOfString(SemVerRegexp, options: .RegularExpressionSearch){
            return true
        }
        return false
    }
    
    public class func clean(version: String) -> String{
        return Semver(version: version).clean()
    }
    
    public func clean() -> String{
        versionStr = versionStr.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        return versionStr.replace("^[=v]+", template: "")
    }
    
    public class func gt(version1: String, version2: String) -> Bool{
        return Semver(version: version1).diff(version2) > 0
    }
    
    public class func lt(version1: String, version2: String) -> Bool{
        return Semver(version: version1).diff(version2) < 0
    }
    
    public class func gte(version1: String, version2: String) -> Bool{
        return Semver(version: version1).diff(version2) >= 0
    }
    
    public class func lte(version1: String, version2: String) -> Bool{
        return Semver(version: version1).diff(version2) <= 0
    }
    
    public class func eq(version1: String, version2: String) -> Bool{
        return Semver(version: version1).diff(version2) == 0
    }
}
