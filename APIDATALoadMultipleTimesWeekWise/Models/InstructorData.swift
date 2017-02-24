//
//  InstructorData.swift
//  APIDATALoadMultipleTimesWeekWise
//
//  Created by Sierra 4 on 23/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import Foundation

import ObjectMapper

class InstructorData : Mappable{
    var update_popup: Int?
    var status_Code: Int?
    var is_package: Int?
    var data: [DataBase]?
    var msg: String?
    
    required init?(map: Map){
        update_popup <- map["update_popup"]
        status_Code <- map["status_code"]
        is_package <- map["is_package"]
        data <- map["data"]
        msg <- map["msg"]

    }
    func mapping(map: Map){
        update_popup <- map["update_popup"]
        status_Code <- map["status_code"]
        is_package <- map["is_package"]
        data <- map["data"]
        msg <- map["msg"]
    }
}

class DataBase : Mappable {
    var date: String?
    var date1: String?
    var day: String?
    var details: [Details]?
    
    required init?(map: Map){
        date <- map["date"]
        date1 <- map["date1"]
        day <- map["day"]
        details <- map["details"]
    }
    func mapping(map: Map){
        date <- map["date"]
        date1 <- map["date1"]
        day <- map["day"]
        details <- map["details"]
    }
}

class Details : Mappable {
    var slot_details_id: Int?
    var day_location: String?
    var unavailable: Int?
    var charge_student: String?
    var time_duration: String?
    var start_time: String?
    var enrolled: Int?
    var locations: [Locations]?
    var slot_date: String?
    var end_time1: String?
    var max_student: Int?
    var slot_day: String?
    var slot_date1: String?
    var slot_id: Int?
    var start_time1: String?
    var category_id: Int?
    var age_group: String?
    var subjects: [Subjects]?
    
    required init?(map: Map){
        slot_details_id <- map["slot_details_id"]
        day_location <- map["day_location"]
        unavailable <- map["unavailable"]
        charge_student <- map["charge_student"]
        time_duration <- map["time_duration"]
        start_time <- map["start_time"]
        enrolled <- map["enrolled"]
        locations <- map["locations"]
        slot_date <- map["slot_date"]
        end_time1 <- map["end_time1"]
        max_student <- map["max_student"]
        slot_day <- map["slot_day"]
        slot_date1 <- map["slot_date1"]
        slot_id <- map["slot_id"]
        start_time1 <- map["start_time1"]
        category_id <- map["category_id"]
        age_group <- map["age_group"]
        subjects <- map["subjects"]
    }
    func mapping(map: Map){
        slot_details_id <- map["slot_details_id"]
        day_location <- map["day_location"]
        unavailable <- map["unavailable"]
        charge_student <- map["charge_student"]
        time_duration <- map["time_duration"]
        start_time <- map["start_time"]
        enrolled <- map["enrolled"]
        locations <- map["locations"]
        slot_date <- map["slot_date"]
        end_time1 <- map["end_time1"]
        max_student <- map["max_student"]
        slot_day <- map["slot_day"]
        slot_date1 <- map["slot_date1"]
        slot_id <- map["slot_id"]
        start_time1 <- map["start_time1"]
        category_id <- map["category_id"]
        age_group <- map["age_group"]
        subjects <- map["subjects"]
    }
}

class Locations : Mappable {
    var slot_day: String?
    var slot_location: Int?
    
    required init?(map: Map){
        slot_day <- map["slot_day"]
        slot_location <- map["slot_location"]
    }
    func mapping(map: Map){
        slot_day <- map["slot_day"]
        slot_location <- map["slot_location"]
    }
}

class Subjects : Mappable {
    var subject_id: Int?
    var subject_name: String?
    required init?(map: Map){
        subject_id <- map["subject_id"]
        subject_name <- map["subject_name"]
    }
    func mapping(map: Map){
        subject_id <- map["subject_id"]
        subject_name <- map["subject_name"]
    }
}
