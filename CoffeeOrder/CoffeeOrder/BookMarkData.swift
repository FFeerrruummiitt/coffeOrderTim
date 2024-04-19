//
//  BookMarkData.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 17.12.2023.
//

import UIKit

var bookMarkData = [CoffeeMarketModel]()

var typeCoffeeData = [
   coffeTypeStruct(click: true, name: "Late"),
   coffeTypeStruct(click: false, name: "Espresso"),
   coffeTypeStruct(click: false, name: "Americano"),
   coffeTypeStruct(click: false, name: "Cappuccino"),
   coffeTypeStruct(click: false, name: "Macchiato"),
   coffeTypeStruct(click: false, name: "Flat White"),
   coffeTypeStruct(click: false, name: "Affogato"),
   coffeTypeStruct(click: false, name: "Turkish Coffee"),
   coffeTypeStruct(click: false, name: "Cold Brew")
]

var coffeesData = [
    CoffeeMarketModel(id: 0, imageName: "coffee2", coffeeName: "Espresso", element: "with Chocolate", price: 1200, checkBookmark: false, count: 0),
   CoffeeMarketModel(id: 1, imageName: "coffee1", coffeeName: "Late", element: "with Oat Milk", price: 1000, checkBookmark: false, count: 0),
   CoffeeMarketModel(id: 2, imageName: "coffee1", coffeeName: "Late", element: "with Chocolate", price: 1400, checkBookmark: false, count: 0),
   CoffeeMarketModel(id: 3, imageName: "coffee2", coffeeName: "Flat White", element: "with Oat Milk", price: 1500, checkBookmark: false, count: 0),
   CoffeeMarketModel(id: 4, imageName: "coffee2", coffeeName: "Cold Brew", element: "with Oat Milk", price: 1100, checkBookmark: false, count: 0),
   CoffeeMarketModel(id: 5, imageName: "coffee1", coffeeName: "Cappuccino", element: "with Chocolate", price: 1299, checkBookmark: false, count: 0),
   CoffeeMarketModel(id: 6, imageName: "coffee1", coffeeName: "Americano", element: "with Oat Milk", price: 1320, checkBookmark: false, count: 0),
   CoffeeMarketModel(id: 7, imageName: "coffee2", coffeeName: "Late", element: "with Oat Milk", price: 1580, checkBookmark: false, count: 0),
   CoffeeMarketModel(id: 8, imageName: "coffee2", coffeeName: "Macchiato", element: "with Chocolate", price: 1399, checkBookmark: false, count: 0),
]
