import Foundation

enum AttemptType: String, SegmentedItem {
    case training, testing, competition
    
    var title: String {
        switch self {
        case .training: "Тренировка"
        case .testing: "Тестирование"
        case .competition: "Соревнования"
        }
    }
}
