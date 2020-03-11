//
// Copyright (c) 2020 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation
import PassKit

extension DropInComponent {
    
    /// Contains the configuration for the drop in component and the embedded payment method components.
    public final class PaymentMethodsConfiguration {
        
        /// Card component related configuration.
        public var card = CardConfiguration()
        
        public var applePay = ApplePayConfiguration()
        
        public var navigation = NavigationConfiguration()

        /// Indicates the localization parameters, leave it nil to use the default parameters.
        public var localizationParameters: LocalizationParameters?
        
        /// Initializes the drop in configuration.
        public init() {}
        
        /// Card component related configuration.
        public final class CardConfiguration {
            
            /// The public key used for encrypting card details.
            public var publicKey: String?
            
            /// Indicates if a header with the payment method name should be shown. Defaults to true.
            public var showsHeader = true
            
            /// Indicates if the field for entering the holder name should be displayed in the form. Defaults to false.
            public var showsHolderNameField = false
            
            /// Stores footer's title.
            public var footerTitle: String?
            
            /// Stores submit button's title.
            public var submitButtonTitle: String?
            
            /// Indicates if the field for storing the card payment method should be displayed in the form. Defaults to true.
            public var showsStorePaymentMethodField = true
            
            /// The initial (prefilled) value of the card holder name field. Default is nil.
            public var cardHolderPrefill: String?
            
        }
        
        public final class ApplePayConfiguration {
            
            /// The public key used for encrypting card details.
            public var summaryItems: [PKPaymentSummaryItem]?
            
            /// The merchant identifier for apple pay.
            public var merchantIdentifier: String?
            
        }
        
        public final class NavigationConfiguration {
            
            /// Skip the list component if only a single regular payment method is available.
            public var flattensSinglePaymentMethodNavigation = true
        }
    }
}

public extension DropInComponent.PaymentMethodsConfiguration.CardConfiguration {
    
    /// :nodoc:
    @available(*, deprecated, renamed: "showsHolderNameField")
    var showsHolderName: Bool {
        set {
            showsHolderNameField = newValue
        }
        get {
            return showsHolderNameField
        }
    }
}
