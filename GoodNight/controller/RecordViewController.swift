//
//  FirstViewController.swift
//  GoodNight
//
//  Created by 刘毅 on 2016/12/30.
//  Copyright © 2016年 刘毅. All rights reserved.
//

import UIKit

import HealthKit

var healthStore: HKHealthStore? = nil;

class RecordViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if HKHealthStore.isHealthDataAvailable() {
            //get a Singleton of HKHealthStore
            healthStore = HKHealthStore();
        }
        
        // 声明我们想从 HealthKit 里读取的健康数据的类型
        let healthDataToRead = Set(arrayLiteral: HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!)
        
        // 声明我们想写入 HealthKit 的数据的类型
        let healthDataToWrite = Set(arrayLiteral: HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!)
        
        // 以防万一 OneHourWalker 在 iPad 中打开
        if !HKHealthStore.isHealthDataAvailable() {
            print("Can't access HealthKit.")
        }
        
        // 请求可以读取和写入数据的权限
        healthStore?.requestAuthorization(toShare: healthDataToWrite, read: healthDataToRead) { (success, error) -> Void in
            if( success != nil ) {
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

