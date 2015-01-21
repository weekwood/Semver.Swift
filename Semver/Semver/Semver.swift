//
//  Semver.swift
//  Semver
//
//  Created by di wu on 1/20/15.
//  Copyright (c) 2015 di wu. All rights reserved.
//

import Foundation

public class Semver {
    
    let major: String = ""
    let minor: String = ""
    let patch: String = ""
    
    func diff(version1: String, version2: String) -> Bool{
        return false
    }
    
    public func valid(version: String) -> Bool{
        return false
    }
    
    public func clean(version: String) -> String{
        return ""
    }
    
    public func gt(version1: String, version2: String) -> Bool{
        return false
    }
    
    public func lt(version1: String, version2: String) -> Bool{
        return false
    }
    
    public func gte(version1: String, version2: String) -> Bool{
        return false
    }
    
    public func lte(version1: String, version2: String) -> Bool{
        return false
    }
    
    func parse(version: String) -> Semver{
        return Semver()
    }
    

    
}
