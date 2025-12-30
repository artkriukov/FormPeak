import UIKit

enum SegmentedControlFactories {
    static func makeSegmentedButtonsView<Item: SegmentedItem>(
        title: String,
        selected: Item
    ) -> SegmentedButtonsView<Item> {
        let config = SegmentedButtonsView<Item>.Configuration(
            title: title,
            selected: selected
        )
        
        return SegmentedButtonsView(with: config)
    }
}
