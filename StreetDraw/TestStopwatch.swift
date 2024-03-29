//
//  TestStopwatch.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 24.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation

func testStopwatchTwice() {
    testStopwatch()
    testStopwatch()
}
    
func testStopwatch() {
    testStopwatch1()
    testStopwatch2()
}
    
func testStopwatch1() {
    print("testStopwatch1")
    let stopwatch = Stopwatch()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:00")
    stopwatch.start()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:00")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
    stopwatch.stop()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
    stopwatch.start()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:00")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
    stopwatch.stop()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
}

func testStopwatch2() {
    print("testStopwatch2")
    let stopwatch = Stopwatch()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:00")
    stopwatch.start()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:00")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
    stopwatch.pause()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
    stopwatch.continue()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:01")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:02")
    stopwatch.pause()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:02")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:02")
    stopwatch.continue()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:02")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:03")
    stopwatch.stop()
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:03")
    sleep(1)
    check(timeInterval: stopwatch.activeDuration, expectedConversion: "00:00:03")
}


func check(timeInterval: TimeInterval, expectedConversion: String) {
    let actualConversion = timeToString(from: timeInterval)
    print("\(actualConversion==expectedConversion ? "OK" : "BAD") actualConversion: \(actualConversion), expectedConversion: \(expectedConversion)")
}


