//
//  Package.swift
//  GoodNight
//
//  Created by 刘毅 on 2017/3/5.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "GoodNight",
    targets: ["1.0"],
    dependencies: [
        .Package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", versions: Version(1,0,0)..<Version(3, .max, .max)),
        ]
)
