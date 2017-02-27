//
//  ViewController.swift
//  APIDATALoadMultipleTimesWeekWise
//
//  Created by Sierra 4 on 23/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//


import UIKit
import Alamofire
import ObjectMapper
import SVProgressHUD

class ViewController: UIViewController {
    
    var instructorData : InstructorData?
    var statusFlag = 0
    var lastdate = ""
    var pageNo = 1
    
    var numberOfItemsInCollectionView = [DataBase]()
    
    var currentDate = ""
    
    var days:[String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    var months:[String] = ["January",
                           "February",
                           "March",
                           "April",
                           "May",
                           "June",
                           "July",
                           "August",
                           "September",
                           "October",
                           "November",
                           "December"]
    
    @IBOutlet var lblForNavBar: UILabel!
    
    @IBOutlet var collectionViewOutlet: UICollectionView!
    
    @IBOutlet var lblDay0: UILabel!
    @IBOutlet var lblDay1: UILabel!
    @IBOutlet var lblDay2: UILabel!
    @IBOutlet var lblDay3: UILabel!
    @IBOutlet var lblDay4: UILabel!
    @IBOutlet var lblDay5: UILabel!
    @IBOutlet var lblDay6: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Deciding Collection View Cell Size
        let screenSize: CGRect = UIScreen.main.bounds
        let widthOfCollectionCell = CGFloat(screenSize.width)
        let heightOfCollectionViewCell = CGFloat(screenSize.height)
        let layout = collectionViewOutlet?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: widthOfCollectionCell, height: heightOfCollectionViewCell)
        
        //Top View Days
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        currentDate = formatter.string(from: date)
        print("DATED: \(currentDate)")
        let calendar = Calendar.current
        let day = calendar.component(.weekday, from: date)
        rearrangeDays(&days, firstIndex: (day - 1))
        assignDays()
        
        fetchData(pageNo: 1, lastDate: "")
    }
    
    func rearrangeDays(_ array: inout [String], firstIndex: Int) {
        var temp:String = ""
        for _ in 0..<firstIndex {
            temp = array.remove(at: 0)
            array.append(temp)
        }
    }
    
    func assignDays() {
        lblDay0.text = days[0]
        lblDay1.text = days[1]
        lblDay2.text = days[2]
        lblDay3.text = days[3]
        lblDay4.text = days[4]
        lblDay5.text = days[5]
        lblDay6.text = days[6]
    }

    func fetchData(pageNo: Int, lastDate: String) {
        
        SVProgressHUD.show()
        let param:[String:Any] = ["access_token":"ymaANbhfJT4ARby5IbK2u0hUJQ9T7dk8", "page_no":pageNo, "page_size":"7","date_selected":"2017-02-27","last_date":lastDate]
        
        APIHandler.fetchData(urlStr: "instructor-home", parameters: param) { (jsonData) in
            self.instructorData = Mapper<InstructorData>().map(JSONObject: jsonData)
            print("msg \(self.instructorData?.msg ?? "")")
            print("statusCode \(self.instructorData?.status_Code ?? 0)")
            self.statusFlag = self.instructorData?.status_Code ?? 0
            
            for index in 0..<7 {
                self.numberOfItemsInCollectionView.append((self.instructorData?.data?[index])!)
            }
            
            self.collectionViewOutlet.reloadData()
            SVProgressHUD.dismiss()
        }
    }
    
    //Making Selected LabelText Bold
    func MakingTextBoldOfSelectedLabel(label: UILabel){
        var labelsArray = [lblDay0,lblDay1,lblDay2,lblDay3,lblDay4,lblDay5,lblDay6]
        for index in 0..<labelsArray.count {
            if label == labelsArray[index] {
                label.font = UIFont.systemFont(ofSize: 14, weight: 2)
            } else {
                labelsArray[index]?.font = UIFont.systemFont(ofSize: 12, weight: 0)
            }
        }
    }

}

//MARK: CollectionView Delegates & Data Source
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if statusFlag == 200 {
            return numberOfItemsInCollectionView.count
//            return instructorData?.data?.count ?? 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        if numberOfItemsInCollectionView.count == 0 {
            cell.lblIfDataNotFound.text = "There is no content for selected day"
        }
        if statusFlag == 200 {
            cell.detailsDataForEachDate = numberOfItemsInCollectionView[indexPath.item].details!
//            cell.detailsDataForEachDate = (instructorData?.data?[indexPath.item].details)!
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if statusFlag == 200 {
//            instructorData?.data?[indexPath.item].date1 ?? "" == currentDate
            if numberOfItemsInCollectionView[indexPath.item].date1 ?? "" == currentDate {
//                lblForNavBar.text = "Today, " + (instructorData?.data?[indexPath.item].date)!
                lblForNavBar.text = "Today, " + (numberOfItemsInCollectionView[indexPath.item].date)!
            } else {
//                lblForNavBar.text = "WeekDay, " + (instructorData?.data?[indexPath.item].date)!
                lblForNavBar.text = "WeekDay, " + (numberOfItemsInCollectionView[indexPath.item].date)!
            }
            
            switch indexPath.item % 7 {
                case 0:
                    MakingTextBoldOfSelectedLabel(label: lblDay0)
                case 1:
                    MakingTextBoldOfSelectedLabel(label: lblDay1)
                case 2:
                    MakingTextBoldOfSelectedLabel(label: lblDay2)
                case 3:
                    MakingTextBoldOfSelectedLabel(label: lblDay3)
                case 4:
                    MakingTextBoldOfSelectedLabel(label: lblDay4)
                case 5:
                    MakingTextBoldOfSelectedLabel(label: lblDay5)
                case 6:
                    MakingTextBoldOfSelectedLabel(label: lblDay6)
                default:
                    print("Default")
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionViewOutlet.contentOffset
        visibleRect.size = collectionViewOutlet.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        let visibleIndexPath: IndexPath = collectionViewOutlet.indexPathForItem(at: visiblePoint)!
        
        if visibleIndexPath == [0,numberOfItemsInCollectionView.count - 1] {
            lastdate = numberOfItemsInCollectionView[visibleIndexPath.item].date1 ?? ""
            pageNo = pageNo + 1
            fetchData(pageNo: pageNo, lastDate: lastdate)
        }
    }

}

