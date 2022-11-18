//
//  CalendarViewController.swift
//  PestTech
//
//  Created by Monica Barrios on 11/15/22.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICalendarViewDelegate {
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        return nil
    }
    

    
    var selectedDate = Date()
    var totalSquares = [String]()


    override func viewDidLoad() {

        super.viewDidLoad()
        setMonthView()
        collectionView.reloadData()
        setCellsView()

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell

        cell.dayOfMonth.text = "1"

        return cell

    }


    @IBOutlet weak var monthLabel: UILabel!


    @IBAction func previousMonth(_ sender: Any) {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()

    }


    @IBAction func nextMonth(_ sender: Any) {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }


    @IBOutlet weak var collectionView: UICollectionView!


    func setCellsView(){
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8

        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        flowLayout.itemSize = CGSize(width: width, height: height)

    }

    func setMonthView(){

        totalSquares.removeAll()

        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)

        var count: Int = 1

        while(count <= 42){

            if(count <= startingSpaces || count - startingSpaces > daysInMonth){
                totalSquares.append("")
            }
            else{
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1

        }

        monthLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)

        collectionView.reloadData()
    }

    override open var shouldAutorotate: Bool {
        return false
    }

}
