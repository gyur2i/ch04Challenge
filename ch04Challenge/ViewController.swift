//
//  ViewController.swift
//  ch04Challenge
//
//  Created by 김규리 on 2022/01/17.
//

import UIKit

class ViewController: UIViewController {
    // 타이머 구동 시 필요한 변수 및 상수
    let timeSelector: Selector = #selector(ViewController.updateTime) // 타이머가 구동되면 살행할 함수
    let interval = 1.0 // 타이머 간격 1초
    var count = 0
    var alarmTime: String?

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    // 선택시간에 시간 출력해주는 함수
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter() // 날짜를 출력하기 위한 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // formatter의 속성 설정
        // lblPickerTime에 삽입
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    // 현재시간
    @objc func updateTime() {
        let date  = NSDate() // 현재 시간 가져오기
        
        let formatter = DateFormatter() // 날짜를 출력하기 위한 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" // formatter의 속성 설정
        // lblCurrentTime에 삽입
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime){
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
}

