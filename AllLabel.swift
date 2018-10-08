import UIKit

public let formatter: NumberFormatter = NumberFormatter()

@IBDesignable
final class AllLabel: UILabel {

    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }

    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var priceCount = Int()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        
        return textRect.inset(by: invertedInsets)
    }

    override func layoutSubviews() {
        guard priceCount == 0 else {
            self.text = priceCount.JPYString
            return
        }
        super.layoutSubviews()
    }

    override func drawText(in rect: CGRect) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = (cornerRadius > 0)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        super.drawText(in: rect.inset(by: textInsets))
    }
}

extension AllLabel {

    @IBInspectable
    var topTextInset: CGFloat {
        set { textInsets.top = newValue }
        get { return textInsets.top }
    }

    @IBInspectable
    var leftTextInset: CGFloat {
        set { textInsets.left = newValue }
        get { return textInsets.left }
    }

    @IBInspectable
    var bottomTextInset: CGFloat {
        set { textInsets.bottom = newValue }
        get { return textInsets.bottom }
    }

    @IBInspectable
    var rightTextInset: CGFloat {
        set { textInsets.right = newValue }
        get { return textInsets.right }
    }
}

public extension Int {
    private func formattedString(style: NumberFormatter.Style, localeIdentifier: String) -> String {
        formatter.numberStyle = style
        formatter.locale = Locale(identifier: localeIdentifier)
        return formatter.string(from: self as NSNumber) ?? ""
    }

    var formattedJPString: String {
        return formattedString(style: .decimal, localeIdentifier: "ja_JP")
    }

    var JPYString: String {
        return formattedString(style: .currency, localeIdentifier: "ja_JP")
    }

    var USDString: String {
        return formattedString(style: .currency, localeIdentifier: "en_US")
    }
}
