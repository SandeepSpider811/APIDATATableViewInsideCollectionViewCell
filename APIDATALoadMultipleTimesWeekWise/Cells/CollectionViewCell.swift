//
//  CollectionViewCell.swift
//  APIDATALoadMultipleTimesWeekWise
//
//  Created by Sierra 4 on 23/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    var detailsDataForEachDate = [Details]()
    
    var subjectsDataForEachEnroll = [Subjects]()
    
    var startTime = ""
    @IBOutlet var tableViewOutlet: UITableView!
    
    override func awakeFromNib() {
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsDataForEachDate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        subjectsDataForEachEnroll = detailsDataForEachDate[indexPath.row].subjects!
        
        if indexPath.row == 0 {
            cell.lineAboveCircleOutlet.isHidden = true
        } else {
            cell.lineAboveCircleOutlet.isHidden = false
        }
        
        startTime = detailsDataForEachDate[indexPath.row].start_time1!
        
        cell.lblTimeFirsPart.text = DividingStartTimeStringInto3Parts(time: startTime).0
        cell.lblTimeSecondPart.text = ":" + DividingStartTimeStringInto3Parts(time: startTime).1
        cell.lblTimeThirdPart.text = DividingStartTimeStringInto3Parts(time: startTime).2
        cell.lblSubject.text = subjectLabelText(subArray: subjectsDataForEachEnroll)
        cell.lblAgeGroup.text = detailsDataForEachDate[indexPath.row].age_group! + "+"
        cell.lblCharges.text = detailsDataForEachDate[indexPath.row].charge_student
        cell.lblDuration.text = detailsDataForEachDate[indexPath.row].time_duration
        cell.lblLocation.text = detailsDataForEachDate[indexPath.row].day_location
        cell.lblEnrolled.text = String(detailsDataForEachDate[indexPath.row].enrolled!)
        
        return cell
    }
    
    //Returning subject data 
    func subjectLabelText(subArray: [Subjects]) -> String {
        var subjects = [String]()
        for index in 0..<subArray.count {
            subjects.append(subArray[index].subject_name!)
        }
        //counting subjects items
        var count = 0
        for _ in 0..<subjects.count {
            count = count + 1
        }
        let subjectLabelText = subjects[0] + " \(count - 1)+"
        return subjectLabelText
    }
    
    func DividingStartTimeStringInto3Parts(time: String) -> (String, String, String) {
        var firstPart = ""
        var secondPart = ""
        var thirdPart = ""
        //getting first part
        var index = time.index(time.startIndex, offsetBy: 2)
        firstPart = time.substring(to: index)
        //getting third part
        index = time.index(time.endIndex, offsetBy: -2)
        thirdPart = time.substring(from: index)
        //getting second part
        let chars = time.characters
        let range = chars.index(chars.startIndex, offsetBy: 3)..<chars.index(chars.endIndex, offsetBy: -3)
        secondPart = time[range]
        return (firstPart, secondPart, thirdPart)
    }
}

