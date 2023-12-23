//
//  CalanderViewController.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit
import CalendarKit

class CalanderViewController: DayViewController {
    // Return an array of EventDescriptors for particular date
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        
        var events = [Event]()
        
        
        let list = [(TimeInterval(), TimeInterval() + 7200, "Morning Tour: Historical Landmarks"),
                    (TimeInterval() + 10000, TimeInterval() + 13600, "Afternoon Tour: Disney land"),
                    (TimeInterval() + 15000, TimeInterval() + 18600, "Evening Tour: Live Music"),
        ]
        
        list.forEach { item in
            // Create new EventView
            let event = Event()
            event.backgroundColor = .lightCyanColor()
            event.color = .cyanColor()
            // Specify DateInterval
            event.dateInterval = DateInterval(start: Date(timeIntervalSinceNow: item.0), end: Date(timeIntervalSinceNow: item.1))
            var info = [item.2]
            event.text = info.reduce("", {$0 + $1 + "\n"})
            events.append(event)
            
        }
        return events
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        var style = CalendarStyle()
        style.header.daySelector.selectedBackgroundColor = .pinkColor()
        style.header.daySelector.todayActiveBackgroundColor = .pinkColor()
        style.header.daySelector.weekendTextColor = .pinkColor()
        style.header.daySelector.todayInactiveTextColor = .pinkColor()
        style.header.daySymbols.weekendColor = .pinkColor()
        style.timeline.timeIndicator.color = .pinkColor()
        dayView.updateStyle(style)
        let bar = NavigatorBar(title: "schedule", imageName: "back")
        bar.iconImageView.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        dayView.addSubview(bar)
        addSwitch()
        bar.frame = CGRectMake(0, (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0), UIScreen.main.bounds.width, 64)
        dayView.autoScrollToFirstEvent = true
        NSLayoutConstraint.activate([
            dayView.dayHeaderView.topAnchor.constraint(equalTo: dayView.topAnchor, constant: 50 + 64 + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0))
        ])
    }
    
    @objc
    func onClickBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func addSwitch() {
        let container = UIView()
        container.layer.shadowOpacity = 0.1
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOffset = CGSize(width: 1, height: 1)
        container.layer.shadowRadius = 10
        container.layer.cornerRadius = 18
        container.layer.masksToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        dayView.addSubview(container)
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: dayView.leadingAnchor, constant: 30),
            container.trailingAnchor.constraint(equalTo: dayView.trailingAnchor, constant: -30),
            container.heightAnchor.constraint(equalToConstant: 36),
            container.bottomAnchor.constraint(equalTo: dayView.dayHeaderView.topAnchor, constant: -10)
        ])
        
        var leftAnchor = container.leadingAnchor
        let list = [ "Create", "Plan", "Explore" ]
        for i in 0..<list.count {
            let btn = CommonButton()
            btn.layer.cornerRadius = 14
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.setTitle(list[i], for: .normal)
            container.addSubview(btn)
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: container.topAnchor, constant: 4),
                btn.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -4),
                btn.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1 / 3, constant: -6),
                btn.leadingAnchor.constraint(equalTo: leftAnchor, constant: 4)
            ])
            leftAnchor = btn.trailingAnchor
        }
        
    }
    override func dayViewDidSelectEventView(_ eventView: EventView) {
        //      print("Event has been selected: \(eventview.data)")
    }
    
    override func dayViewDidLongPressEventView(_ eventView: EventView) {
        //      print("Event has been longPressed: \(eventView.data)")
    }
}
