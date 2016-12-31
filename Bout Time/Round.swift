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
        Event(event: "Sigmund Freud publishes The Interpretation of Dreams", year: 1900, url: "https://en.wikipedia.org/wiki/The_Interpretation_of_Dreams"),
        Event(event: "Cuba gains independence from Spain", year: 1902, url: "https://en.wikipedia.org/wiki/Cuban_War_of_Independence"),
        Event(event: "New York City subway opens", year: 1904, url: "https://en.wikipedia.org/wiki/New_York_City_Subway"),
        Event(event: "Magnitude 7.8 earthquake strikes San Francisco on April 18", year: 1906, url: "https://en.wikipedia.org/wiki/1906_San_Francisco_earthquake"),
        Event(event: "London's first summer olympics begins", year: 1908, url: "https://en.wikipedia.org/wiki/1908_Summer_Olympics"),
        Event(event: "Japan formally annexes Korea", year: 1910, url: "https://en.wikipedia.org/wiki/Japan%E2%80%93Korea_Treaty_of_1910"),
        Event(event: "Titanic hits an iceberg", year: 1912, url: "https://en.wikipedia.org/wiki/RMS_Titanic"),
        Event(event: "Archduke Franz Ferdinant of Austira is assassinated", year: 1914, url: "https://en.wikipedia.org/wiki/Timeline_of_World_War_I"),
        Event(event: "United States enters World War I", year: 1917, url: "https://en.wikipedia.org/wiki/Timeline_of_World_War_I"),
        Event(event: "Spanish Flu begins", year: 1918, url: "https://en.wikipedia.org/wiki/1918_flu_pandemic"),
        Event(event: "United States nationally ratifies Women's Suffrage", year: 1920, url: "https://en.wikipedia.org/wiki/Women%27s_suffrage_in_the_United_States"),
        Event(event: "Construction of Lincoln Memorial finishes", year: 1922, url: "https://en.wikipedia.org/wiki/Lincoln_Memorial"),
        Event(event: "Ottoman Empire Collapses", year: 1923, url: "https://en.wikipedia.org/wiki/Ottoman_Empire"),
        Event(event: "Chiang Kai-shek becomes leader of Chinese Revolutionary Party", year: 1926, url: "https://en.wikipedia.org/wiki/Chiang_Kai-shek"),
        Event(event: "The Great Depression begins", year: 1929, url: "https://en.wikipedia.org/wiki/Great_Depression"),
        Event(event: "New Delhi is inaugrated as the capital of India", year: 1931, url: "https://en.wikipedia.org/wiki/New_Delhi"),
        Event(event: "Amelia Earhart becomes the first woman to fly Atlantic solo", year: 1932, url: "https://en.wikipedia.org/wiki/Amelia_Earhart"),
        Event(event: "Adolf Hitler becomes the chancellor of Germany", year: 1933, url: "https://en.wikipedia.org/wiki/Adolf_Hitler"),
        Event(event: "Persia becomes Iran", year: 1935, url: "https://en.wikipedia.org/wiki/Iran"),
        Event(event: "World War II Begins", year: 1939, url: "https://en.wikipedia.org/wiki/World_War_II"),
        Event(event: "Winston Churchil becomes Britain's Prime Minister", year: 1940, url: "https://en.wikipedia.org/wiki/Winston_Churchill"),
        Event(event: "United States enters World War II", year: 1941, url: "https://en.wikipedia.org/wiki/Military_history_of_the_United_States_during_World_War_II"),
        Event(event: "Operation Overlord occurs", year: 1944, url: "https://en.wikipedia.org/wiki/Operation_Overlord"),
        Event(event: "United States drops atomic bomb on Hiroshima and Nagasaki", year: 1946, url: "https://en.wikipedia.org/wiki/Atomic_bombings_of_Hiroshima_and_Nagasaki"),
        Event(event: "Mahatma Gandhi is assassinated", year: 1948, url: "https://en.wikipedia.org/wiki/Mahatma_Gandhi"),
        Event(event: "Korean War Begins", year: 1950, url: "https://en.wikipedia.org/wiki/Korean_War"),
        Event(event: "Queen Elizabeth (Elizabeth II) becomes the queen", year: 1952, url: "https://en.wikipedia.org/wiki/Elizabeth_II"),
        Event(event: "Algerian War of independence begins against France", year: 1954, url: "https://en.wikipedia.org/wiki/Algerian_War"),
        Event(event: "Morocco gains independence", year: 1956, url: "https://en.wikipedia.org/wiki/Morocco"),
        Event(event: "NASA begins Project Mercury", year: 1958, url: "https://en.wikipedia.org/wiki/Project_Mercury"),
        Event(event: "Nigeria gains independence", year: 1960, url: "https://en.wikipedia.org/wiki/Nigeria"),
        Event(event: "Cuban Missile Crisis occurs", year: 1962, url: "https://en.wikipedia.org/wiki/Cuban_Missile_Crisis"),
        Event(event: "Nelson Mandela is sentenced to life imprisonment", year: 1964, url: "https://en.wikipedia.org/wiki/Nelson_Mandela"),
        Event(event: "United States begins the Medicare program", year: 1966, url: "https://en.wikipedia.org/wiki/Medicare_(United_States)"),
        Event(event: "Tonga gains independence", year: 1970, url: "https://en.wikipedia.org/wiki/Tonga"),
        Event(event: "President Nixon resigns", year: 1974, url: "https://en.wikipedia.org/wiki/Richard_Nixon"),
        Event(event: "United States celebrates bicentennial", year: 1976, url: "https://en.wikipedia.org/wiki/United_States_Bicentennial"),
        Event(event: "United States and many other countries boycott the summer olympics", year: 1980, url: "https://en.wikipedia.org/wiki/1980_Summer_Olympics_boycott"),
        Event(event: "Compact Discs (CD) become commerciallly available", year: 1982, url: "https://en.wikipedia.org/wiki/Compact_disc"),
        Event(event: "Ronald Reagan is re-elected for his second term", year: 1984, url: "https://en.wikipedia.org/wiki/Ronald_Reagan"),
        Event(event: "Benazir Bhutto becomes the first Islamic female Prime Minister", year: 1988, url: "https://en.wikipedia.org/wiki/Benazir_Bhutto"),
        Event(event: "The Soviet Union dissolves", year: 1991, url: "https://en.wikipedia.org/wiki/Soviet_Union"),
        Event(event: "FDA approves Flavr Savr - the first genetically modified food product", year: 1994, url: "https://en.wikipedia.org/wiki/Flavr_Savr"),
        Event(event: "The film Titanic becomes the highest-grossing film of all time worldwide", year: 1997, url: "https://en.wikipedia.org/wiki/Titanic_(1997_film)"),
        Event(event: "ILOVEYOU infects tens of millions of Windows computers", year: 2000, url: "https://en.wikipedia.org/wiki/ILOVEYOU"),
        Event(event: "Hi-jackers ram jetliners into the World Trade Center and the Pentagon", year: 2001, url: "https://en.wikipedia.org/wiki/September_11_attacks"),
        Event(event: "George W. Bush starts his second presidential term", year: 2005, url: "https://en.wikipedia.org/wiki/George_W._Bush"),
        Event(event: "The Great Recession begins", year: 2007, url: "https://en.wikipedia.org/wiki/Great_Recession"),
        Event(event: "Gangnam Style becomes the first YouTube video to reach one billion views", year: 2012, url: "https://en.wikipedia.org/wiki/Gangnam_Style"),
        Event(event: "Donald Trump defeats Hillary Clinton in the presidential election", year: 2016, url: "https://en.wikipedia.org/wiki/Donald_Trump")
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
