# Study-Swift - The powerful programming language that is also easy to learn.
Swift는 Apple이 iOS, Mac, Apple TV 그리고 Apple Watch 앱 개발용으로 만든 강력하고 직관적인 프로그래밍 언어입니다. 개발자들에게 어느 때보다 큰 자유를 선사하기 위해 설계되었죠. Swift는 사용이 간편한 오픈 소스 언어라서, 번뜩이는 아이디어만 있다면 누구나 놀라운 결과물을 만들어낼 수 있답니다.

## ★ First-Class object - 일급 객체
스위프트는 객체지향 언어이자 동시에 함수형 언어이다. 함수형 언어를 학습하게 되면 반드시 일극 객체라는 용어를 접하게 된다. 컴퓨터 프로그래밍 언어 디자인에서, 특정 언어의 일급 객체 (first-class citizens, 일급 값, 일급 엔티티, 혹은 일급 시민)이라 함은 일반적으로 다른 객체들에 적용 가능한 연산을 모두 지원하는 객체를 가리킨다. 함수에 매개변수로 넘기기, 변수에 대입하기와 같은 연산들이 여기서 말하는 일반적인 연산의 예에 해당한다. 일급/이급 객체의 개념은 영국의 컴퓨터 과학자 크리스토퍼 스트레이치에 의해 1960년대에 처음 소개되었다. 그는 명시적으로 일급 객체의 개념을 정의하지는 않았으나, Algol 프로그래밍 언어의 실수(Real number)와 프로시저를 비교함으로써 일급 객체의 개념에 대해 처음으로 언급하였다.

#### ⌘ First-Class object Feature
* 객체가 런타임에도 생성이 가능해야 한다.
* 인자값으로 객체를 전달할 수 있어야 한다. (함수의 인자값으로 함수를 사용할 수 있다.)
* 반환값으로 객체를 사용할 수 있어야 한다. (함수의 반환 타입으로 함수를 사용할 수 있다.)
* 변수나 데이터 구조 안에 저장할 수 있어야 한다. (변수나 상수에 함수를 대입할 수 있다.)
* 할당에 사용된 이름과 관계없이 고유한 구별이 가능해야 한다.

**즉, 함수형 언어에서는 함수가 일급 객체로 대우받는다.**

## ★ Difference Struct vs Class
**⌘ 구조체의 값 전달 방식: 복사에 의한 전달**

  구조체는 인스턴스를 생성한 후 이를 변수나 상수에 할당하거나 함수의 인자값으로 전달할 때 값을 복사하여 전달하는 방식을 사용한다. 이를 값 타입(Value Type) or 복사에 의한 전달이라고 한다. 스위프트에서 모든 구조체를 값 타입이다. 열거형(Enum) 역시 값 타입이다. 또한 구조체 인스턴스를 변수에 대입하면 기존의 인스턴스가 그대로 대입되는 것이 아니라 이를 복사한 새로운 값이 대입된다.
  
  * 구조체는 값의 할당이 곧 복사이므로 하나의 인스턴스는 오로지 하나의 변수와 상수만이 참조할 수 있다.
    
* * *
    
**⌘ 클래스의 값 전달 방식: 참조에 의한 방식**

  클래스는 메모리 주소 참조에 의한 전달 방식을 사용한다. 이를 참조 타입 (Reference Type)이라한다. 참조 타입은 변수나 상수에 할당될 때, 또는 함수의 인자값으로 전달될 때 값의 복사가 이루어지지 않는다. 대신, 현재 존재하는 인스턴스에 대한 참조가 전달된다. 참조란, 인스턴스가 저장된 메모리 주소 정보가 전달된다는 뜻이다.
  
  * 클래스는 참조 타입으로서 한 곳에서 수정할 경우 다른 곳에도 적용되는 특징이 있다.
  * 하나의 클래스 인스턴스를 여러 변수나 상수, 또는 함수의 인자값에서 동시에 참조할 수 있다는 특징이 있다.
  * 클래스 인스턴스는 여러곳에서 동시 참조가 가능하므로 한 곳에서의 참조가 완료되었다고 해도 마음대로 메모리 해제를 할 수 없는 특징이 있다. 다른 곳에서 해당 인스턴스를 계속 참조하고 있기 때문이다. 이를 방치할 경우 잘못된 메모리 참조 오류가 발생한다.

## ★ Property - 프로퍼티
* 프로퍼티는 클래스나 구조체에 값을 제공하며 저장 프로퍼티와 연산 프로퍼티가 존재한다.

* Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.

  Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associated with the type itself. Such properties are known as type properties.

  In addition, you can define property observers to monitor changes in a property’s value, which you can respond to with custom actions. Property observers can be added to stored properties you define yourself, and also to properties that a subclass inherits from its superclass.

**⌘ Stored Properties - 저장 프로퍼티**
* 입력된 값을 저장하거나 저장된 값을 제공하는 역할을 제공한다.
* 상수 및 변수를 사용해서 정의 기능을 제공한다.
* 클래스와 구조체에서는 사용이 가능하지만, 열거형에서는 사용할 수 없다.

**⌘ Lazy Stored Properties - 지연 저장 프로퍼티**
* A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration.
  
  Lazy properties are useful when the initial value for a property is dependent on outside factors whose values are not known until after an instance’s initialization is complete. Lazy properties are also useful when the initial value for a property requires complex or computationally expensive setup that should not be performed unless or until it is needed.

* 클래스 인스턴스가 생성되어 모든 저장 프로퍼티가 만들어지더라도 lazy 키워드가 붙은 프로퍼티는 선언만 될 뿐 초기화되지 않고 계속 대기하고 잇다가 프로퍼티가 호출되는 순간에 초기화 된다. 이처럼 호출되기 전에는 선언만 된 상태로 대기하다가 실제로 호출되는 시점에서 초기화가 이루어지는 저장 프로퍼티를 지연 저장 프로퍼티라 한다.

```swift
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

print(manager.importer.filename)
// the DataImporter instance for the importer property has now been created
// Prints "data.txt"
```

* * *

**⌘ Computed Properties - 연산 프로퍼티**
* 특정 연산을 통해 값을 만들어 제공하는 역할을 제공한다.
* 변수만 사용해서 정의 기능을 제공한다.
* 클래스, 구조체, 열거형 모두에서 사용 가능하다.

```swift
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"
```

**⌘ Read-Only Computed Properties - 읽기 전용 연산 프로퍼티**
* A computed property with a getter but no setter is known as a read-only computed property. A read-only computed property always returns a value, and can be accessed through dot syntax, but cannot be set to a different value.
  
  You must declare computed properties—including read-only computed properties—as variable properties with the var keyword, because their value is not fixed. The let keyword is only used for constant properties, to indicate that their values cannot be changed once they are set as part of instance initialization.

```swift
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0"
```

> This example defines a new structure called Cuboid, which represents a 3D rectangular box with width, height, and depth properties. This structure also has a read-only computed property called volume, which calculates and returns the current volume of the cuboid. It doesn’t make sense for volume to be settable, because it would be ambiguous as to which values of width, height, and depth should be used for a particular volume value. Nonetheless, it is useful for a Cuboid to provide a read-only computed property to enable external users to discover its current calculated volume.

## ★ Property Observers - 프토퍼티 옵저버
* 프로퍼티 옵저버는 프로퍼티의 값을 직접 변경하거나 시스템에 의해 자동으로 변경하는 경우에 상관없이 일단 프로퍼티의 값이 설정되면 호출된다. 심지어 프로퍼티에 현재와 동일한 값이 재할당이 되어도 호출된다. 예를 들어 저장 프로퍼티에 값을 대입하는 구문이 수행되거나 연산 프로퍼티에서 set 구문이 실행되는 모든 경우에 프로퍼티 옵저버가 호출된다.

* 프로퍼티 옵저버에는 willSet와 didSet이 존재한다. willSet은 프로퍼티의 값이 변경되기 직전에 호출되는 옵저버이고 didSet은 프로퍼티의 값이 변경된 직후에 호출되는 옵저버이다.

* The willSet and didSet observers of superclass properties are called when a property is set in a subclass initializer, after the superclass initializer has been called. They are not called while a class is setting its own properties, before the superclass initializer has been called.

```swift
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps
```

## ★ Type Property - 타입 프로퍼티
* 인스턴스를 생성하지 않고 클래스나 구조체 자체에 값을 저장하게 되며 이를 타입 프로퍼티(Type Property)라고 한다.

* 타입 프로퍼티(Type Property)은 클래스나 구조체의 인스턴스에 속하는 값이 아니라 클래스나 구조체 자체에 속하는 값이므로 인스턴스를 생성하지 않고 클래스나 구조체 자체에 저장하게 되며, 저장된 값은 모든 인스턴스가 공통으로 사용할 수 있다.

* 인스턴스 프로퍼티는 개별 인스턴스마다 다른 값을 저장할 수 있어서 하나의 인스턴스에서 변경한 프로퍼티의 값은 그 인스턴스 내에서만 유지될 뿐 나머지 인스턴스에 영향을 미치지 않지만, 타입 프로퍼티는 인스턴스가 아무리 많더라도 모든 인스턴스가 하나의 값을 공용으로 사용한다. 또한 스위프트에서 타입 프로퍼티는 클래스나 구조체, 열거형 객체 내에 선언하는 것이므로 선언된 객체 내에서만 접근 가능한 범위를 가진다.

```swift
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
```

## ★ ARC (Auto Reference Counting)
* iOS는 레퍼런스 카운팅을 통해 레퍼런스가 더 이상 사용되지 않는 시점을 결정하여 레퍼런스가 할당받아 사용하던 메모리를 해제할 수 있도록 만듭니다. 개념적으로 간단한 것으로 프로퍼티, 상수, 변수에 레퍼런스가 지정되면 때 여기에 들어있는 카운트를 증가시키고 프로퍼티, 상수, 변수가 해제되면 카운트를 감소시킵니다. 보유한 카운트가 0이 되면 메모리를 해제시킵니다.

* 인스턴스를 모니터링하면서 변수나 상수, 함수의 인자값으로 할당되면 카운트를 1증가시키고 해당 변수나 상수들이 종료되면 카운트를 1 감소시키는 작업을 계속하면서 인스턴스의 참조 수를 계산한다. 이 과정에서 인스턴스의 참조 카운트가 0이 되면 메모리 해제 대상으로 간주하여 적절히 메모리에서 해제한다.

![https://www.raywenderlich.com/959-arc-and-memory-management-in-swift](https://user-images.githubusercontent.com/20036523/44619524-df672200-a8c2-11e8-8ecd-fab5225754d3.png)

## ★ Etc
* 옵셔널 (Optinal)은 프로그램의 안정성을 높이기 위한 개념으로서 nil을 사용할 수 있는 타입과 사용할 수 없는 타입으로 구분하고 사용할 수 있는 타입을 가리켜 옵셔널 타입 (Optional Type)이라고 한다.

* * *

**⌘ 업 캐스팅 (Up Casting)**
1. 하위 클래스 타입을 상위 클래스 타입으로 변환할 때
2. 캐스팅하기 전 타입이 하위 클래스, 캐스팅한 후 타입이 상위 클래스일 때
3. 캐스팅한 결과, 캐스팅하기 전 타입보다 추상화될 때
4. 일반적으로 캐스팅 과정에서 오류가 발생할 가능성이 없다.

* * *

**⌘ 다운 캐스팅 (Down Casting)**
1. 상위 클래스 타입을 하위 클래스 타입으로 캐스팅할 때
2. 캐스팅하기 전 타입이 상위 클래스, 캐스팅한 후 타입이 하위 클래스
3. 캐스팅한 결과, 캐스팅하기 전 타입보다 구체화될 때
4. 캐스팅 과정에서 오류가 발생할 가능성이 있다.
5. 오류에 대한 처리 방식에 따라 옵셔널 캐스팅과 강제 캐스팅으로 나뉜다.

## ★ Access Control - 접근제어 지시자

* Open access and public access enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use open or public access when specifying the public interface to a framework. The difference between open and public access is described below.

* Internal access enables entities to be used within any source file from their defining module, but not in any source file outside of that module. You typically use internal access when defining an app’s or a framework’s internal structure.

* File-private access restricts the use of an entity to its own defining source file. Use file-private access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.

* Private access restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file. Use private access to hide the implementation details of a specific piece of functionality when those details are used only within a single declaration.

## ★ Reference
* [스위프트 ARC와 순환참조와 클로저 - Out of Bedlam](https://outofbedlam.github.io/swift/2016/01/31/Swift-ARC-Closure-weakself/)
* [꼼꼼한 재은 씨의 Swift 문법편 - Naver Book](https://book.naver.com/bookdb/book_detail.nhn?bid=12864380)
* [일급 객체 - 위키백과](https://ko.wikipedia.org/wiki/%EC%9D%BC%EA%B8%89_%EA%B0%9D%EC%B2%B4)
* [The Swift Programming Language - Swift community](https://swift.org/)
* [Raywenderlich - iOS](https://www.raywenderlich.com/)
