//
//  Round.swift
//  Bout Time
//
//  Created by Joseph Kim on 12/30/16.
//  Copyright © 2016 Joseph Kim. All rights reserved.
//

import Foundation
import GameKit

struct Round {
    // A list of 50 events
    let events: [Event] = [
        Event(event: "1", year: 1901, url: "https://en.wikipedia.org/wiki/Logo_(programming_language)"),
        Event(event: "2", year: 1902, url: "https://en.wikipedia.org/wiki/B_(programming_language)"),
        Event(event: "3", year: 1903, url: "https://en.wikipedia.org/wiki/Pascal_(programming_language)"),
        Event(event: "4", year: 1904, url: "https://en.wikipedia.org/wiki/Forth_(programming_language)"),
        Event(event: "5", year: 1905, url: "https://en.wikipedia.org/wiki/C_(programming_language)"),
        Event(event: "6", year: 1906, url: "https://en.wikipedia.org/wiki/Smalltalk"),
        Event(event: "7", year: 1907, url: "https://en.wikipedia.org/wiki/Prolog"),
        Event(event: "8", year: 1908, url: "https://en.wikipedia.org/wiki/ML_(programming_language)"),
        Event(event: "9", year: 1909, url: "https://en.wikipedia.org/wiki/Scheme_(programming_language)"),
        Event(event: "10", year: 1910, url: "https://en.wikipedia.org/wiki/SQL"),
        Event(event: "11", year: 1911, url: "https://en.wikipedia.org/wiki/C%2B%2B"),
        Event(event: "12", year: 1912, url: "https://en.wikipedia.org/wiki/Ada_(programming_language)"),
        Event(event: "13", year: 1913, url: "https://en.wikipedia.org/wiki/Common_Lisp"),
        Event(event: "14", year: 1914, url: "https://en.wikipedia.org/wiki/MATLAB"),
        Event(event: "15", year: 1915, url: "https://en.wikipedia.org/wiki/Eiffel_(programming_language)"),
        Event(event: "16", year: 1916, url: "https://en.wikipedia.org/wiki/Objective-C"),
        Event(event: "17", year: 1917, url: "https://en.wikipedia.org/wiki/Erlang_(programming_language)"),
        Event(event: "18", year: 1918, url: "https://en.wikipedia.org/wiki/Perl"),
        Event(event: "19", year: 1919, url: "https://en.wikipedia.org/wiki/Tcl"),
        Event(event: "20", year: 1920, url: "https://en.wikipedia.org/wiki/Wolfram_Language"),
        Event(event: "21", year: 1921, url: "https://en.wikipedia.org/wiki/FL_(programming_language)"),
        Event(event: "22", year: 1922, url: "https://en.wikipedia.org/wiki/Haskell_(programming_language)"),
        Event(event: "23", year: 1923, url: "https://en.wikipedia.org/wiki/Python_(programming_language)"),
        Event(event: "24", year: 1924, url: "https://en.wikipedia.org/wiki/Visual_Basic"),
        Event(event: "25", year: 1925, url: "https://en.wikipedia.org/wiki/Ruby_(programming_language)"),
        Event(event: "26", year: 1926, url: "https://en.wikipedia.org/wiki/Lua_(programming_language)"),
        Event(event: "27", year: 1927, url: "https://en.wikipedia.org/wiki/R_(programming_language)"),
        Event(event: "28", year: 1928, url: "https://en.wikipedia.org/wiki/CLOS"),
        Event(event: "29", year: 1929, url: "https://en.wikipedia.org/wiki/Ada_95"),
        Event(event: "30", year: 1930, url: "https://en.wikipedia.org/wiki/Java_(programming_language)"),
        Event(event: "31", year: 1931, url: "https://en.wikipedia.org/wiki/Embarcadero_Delphi"),
        Event(event: "32", year: 1932, url: "https://en.wikipedia.org/wiki/JavaScript"),
        Event(event: "33", year: 1933, url: "https://en.wikipedia.org/wiki/PHP"),
        Event(event: "34", year: 1934, url: "https://en.wikipedia.org/wiki/REBOL"),
        Event(event: "35", year: 1935, url: "https://en.wikipedia.org/wiki/D_(programming_language)"),
        Event(event: "36", year: 1936, url: "https://en.wikipedia.org/wiki/ActionScript"),
        Event(event: "37", year: 1937, url: "https://en.wikipedia.org/wiki/C_Sharp_(programming_language)"),
        Event(event: "38", year: 1938, url: "https://en.wikipedia.org/wiki/Groovy_(programming_language)"),
        Event(event: "39", year: 1939, url: "https://en.wikipedia.org/wiki/Scala_(programming_language)"),
        Event(event: "40", year: 1940, url: "https://en.wikipedia.org/wiki/F_Sharp_(programming_language)"),
        Event(event: "41", year: 1941, url: "https://en.wikipedia.org/wiki/Windows_PowerShell"),
        Event(event: "42", year: 1942, url: "https://en.wikipedia.org/wiki/Clojure"),
        Event(event: "43", year: 1943, url: "https://en.wikipedia.org/wiki/Go_(programming_language)"),
        Event(event: "44", year: 1944, url: "https://en.wikipedia.org/wiki/Rust_(programming_language)"),
        Event(event: "45", year: 1945, url: "https://en.wikipedia.org/wiki/Dart_(programming_language)"),
        Event(event: "46", year: 1946, url: "https://en.wikipedia.org/wiki/Julia_(programming_language)"),
        Event(event: "47", year: 1947, url: "https://en.wikipedia.org/wiki/Swift_(programming_language)"),
        Event(event: "48", year: 1948, url: "https://en.wikipedia.org/wiki/Swift_(programming_language)"),
        Event(event: "49", year: 1949, url: "https://en.wikipedia.org/wiki/Swift_(programming_language)"),
        Event(event: "50", year: 1950, url: "https://en.wikipedia.org/wiki/Swift_(programming_language)")
    ]
    
    
    /// Returns a specified random, non-repeating events in an array
    func getRoundSet(for number: Int) -> [Event] {
        var eventList: [Event] = []
        var iterator = 0
        var indexOfSelectedEvent: Int
        var exist = false
        while (iterator < number) {
            while (iterator >= eventList.count) {
                exist = false
                indexOfSelectedEvent = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
                if eventList.count == 0 {
                    eventList.append(events[indexOfSelectedEvent])
                }
                for event in eventList {
                    if event.event == events[indexOfSelectedEvent].event {
                        exist = true
                    }
                }
                if(!exist) {
                    eventList.append(events[indexOfSelectedEvent])
                }
            }
            iterator += 1
        }
        return eventList
    }
}
