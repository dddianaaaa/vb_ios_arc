import Foundation

enum CarActions{
case turnOnEngine
case turnOffEngine
case openWindow
case closeWindow
case loadTrunk(_ value: Int)
case unloadTrunk(_ value: Int)
}
struct Car : Hashable{
var mark: String
var year: Int
var trunkVolume: Int
var isGo: Bool
var isOpenedWind: Bool
var isFullTrunk: Bool{
if(trunkVolume == 200){
return true
}
else{
return false
}
}
mutating func change(action: CarActions){
switch action {
case .turnOnEngine:
self.isGo = true

case .turnOffEngine:
self.isGo = false

case .openWindow:
self.isOpenedWind = true

case .closeWindow:
self.isOpenedWind = true

case .loadTrunk(let value):
self.trunkVolume += value

case .unloadTrunk(let value):
self.trunkVolume -= value
}
}
}

var bmw = Car(mark: "BMW", year: 2022, trunkVolume: 0, isGo: false, isOpenedWind: false)

bmw.change(action: .turnOnEngine)
var benz = Car(mark: "Mercedes-Benz", year: 2007, trunkVolume: 0, isGo: false, isOpenedWind: false)
benz.change(action: .openWindow)
var dict : [Car: String] = [bmw: bmw.mark, benz: benz.mark]
print(dict[benz])


class Car2 {
    weak var driver: Man2? //решением будет поставить слабую(weak) ссылку чтобы при удалении строгой эта ссылка на класс тоже удалилась
    deinit{
        print("Машина удалена из памяти")
    }
}
class Man2 {
    weak var myCar: Car2? //решением будет поставить слабую(weak) ссылку чтобы при удалении строгой эта ссылка на класс тоже удалилась
    deinit{
        print("Мужчина удален из памяти")
    }
}
var car2: Car2? = Car2()
var man2: Man2? = Man2()
car2?.driver = man2
man2?.myCar = car2
car2 = nil
man2 = nil



class Man{
weak var passport: Passport? //решением будет поставить слабую(weak) ссылку чтобы при удалении строгой эта ссылка на класс тоже удалилась(не додумался как без weak поставить)

deinit{
print("Мужчина удален из памяти")
}
}
class Passport{
weak var man: Man?
init(man: Man){
self.man = man
man.passport = self
}

deinit{
print("Паспорт удален из памяти")
}
}
var man: Man? = Man()
var passport: Passport? = Passport(man: man!)
passport = nil
man = nil
