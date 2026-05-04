import Foundation
import UIKit

extension Product {
    static var generatedSeedTemplates: [SeedTemplate] {
        return [
            SeedTemplate(
                code: "389948589",
                name: "Totem Summer 2 (v2) Double Tent",
                info: "Lightweight single-layer tent perfect for summer weekend trips and outdoor relaxation. Features a mosquito net entrance and large ventilation valve. All seams are taped for extra protection.",
                price: 350.0,
                category: .tents,
                features: [
                    Feature(.brand, value: "Totem"),
                    Feature(.weight, value: "1.9 kg"),
                    Feature(.capacity, value: "2 people"),
                    Feature(.material, value: "Polyester Taffeta"),
                    Feature(.waterproof, value: "2000 mm"),
                    Feature(.windResistance, value: "up to 50 km/h"),
                    Feature(.season, value: "Summer"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["389948589_1", "389948589_10", "389948589_12", "389948589_2", "389948589_3", "389948589_4", "389948589_5", "389948589_6", "389948589_9"],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "582797866",
                name: "Tramp Lite Fly 2 Single-Layer Tent",
                info: "Reliable lightweight tent in sand color. Compact design makes it ideal for light hiking. The high-quality polyester fabric provides good protection while keeping the weight minimal.",
                price: 420.0,
                category: .tents,
                features: [
                    Feature(.brand, value: "Tramp"),
                    Feature(.weight, value: "1.8 kg"),
                    Feature(.capacity, value: "2 people"),
                    Feature(.material, value: "Polyester Taffeta"),
                    Feature(.waterproof, value: "2000 mm"),
                    Feature(.windResistance, value: "up to 45 km/h"),
                    Feature(.season, value: "3-Season"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["582797866_1", "582797866_2", "582797866_3", "582797866_4", "582797866_5", "582797866_6", "582797866_7", "582797866_8"],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "587293630",
                name: "Camping Pro Double Tent",
                info: "Spacious camping tent with integrated mosquito net. Designed for maximum airflow during warm summer nights. Durable construction and easy setup make it a favorite for beginners.",
                price: 380.0,
                category: .tents,
                features: [
                    Feature(.brand, value: "Camping Pro"),
                    Feature(.weight, value: "2.1 kg"),
                    Feature(.capacity, value: "2 people"),
                    Feature(.material, value: "Polyester"),
                    Feature(.waterproof, value: "1500 mm"),
                    Feature(.windResistance, value: "up to 35 km/h"),
                    Feature(.season, value: "Summer"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["587293630_1"],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "3680957",
                name: "Totem Ember Sleeping Bag",
                info: "Warm and cozy sleeping bag for spring and summer nights. High-quality synthetic insulation ensures consistent performance even in damp conditions. Ergonomic shape for better heat retention.",
                price: 180.0,
                category: .sleepingBags,
                features: [
                    Feature(.brand, value: "Totem"),
                    Feature(.weight, value: "0.7 kg"),
                    Feature(.temperatureRating, value: "5°C"),
                    Feature(.insulation, value: "Hollowfiber"),
                    Feature(.season, value: "Summer/Spring"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["3680957_2", "3680957_3", "3680957_4", "3680957_5"],
                countAvailable: 8
            ),
            SeedTemplate(
                code: "3681909",
                name: "Totem Hunter Mummy Bag",
                info: "Professional mummy-style sleeping bag. Lightweight and highly packable, making it perfect for technical hiking. Specialized hood design traps heat effectively during cooler nights.",
                price: 220.0,
                category: .sleepingBags,
                features: [
                    Feature(.brand, value: "Totem"),
                    Feature(.weight, value: "1.1 kg"),
                    Feature(.temperatureRating, value: "0°C"),
                    Feature(.insulation, value: "Hollowfiber"),
                    Feature(.season, value: "3-Season"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["3681909_1", "3681909_10", "3681909_11", "3681909_12", "3681909_13", "3681909_2", "3681909_3", "3681909_4", "3681909_5", "3681909_7", "3681909_8", "3681909_9"],
                countAvailable: 6
            ),
            SeedTemplate(
                code: "446910995",
                name: "Winter Expedition Sleeping Bag -15°C",
                info: "Heavy-duty sleeping bag for extreme winter conditions. Thick multi-layer insulation provides warmth down to -15°C. Water-resistant outer shell protects against condensation and snow.",
                price: 450.0,
                category: .sleepingBags,
                features: [
                    Feature(.brand, value: "Expedition Pro"),
                    Feature(.weight, value: "2.1 kg"),
                    Feature(.temperatureRating, value: "-15°C"),
                    Feature(.insulation, value: "Synthetic Mix"),
                    Feature(.season, value: "Winter"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["446910995_1", "446910995_2", "446910995_3", "446910995_4"],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "363662235",
                name: "Naturehike 45L Trekking Backpack",
                info: "Ergonomic 45-liter backpack for multi-day trips. Advanced suspension system distributes weight evenly. Durable ripstop nylon construction with integrated rain cover.",
                price: 320.0,
                category: .backpacks,
                features: [
                    Feature(.brand, value: "Naturehike"),
                    Feature(.weight, value: "1.2 kg"),
                    Feature(.volume, value: "45 L"),
                    Feature(.maxLoad, value: "15 kg"),
                    Feature(.material, value: "Nylon Ripstop"),
                    Feature(.waterproof, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["363662235_1", "363662235_2"],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "375085551",
                name: "Eagle A21 External Frame Pack 75L",
                info: "Large capacity expedition backpack with external support frame. Ideal for heavy loads and long treks. Features multiple access points and specialized gear loops for ice axes or poles.",
                price: 480.0,
                category: .backpacks,
                features: [
                    Feature(.brand, value: "Eagle"),
                    Feature(.weight, value: "2.4 kg"),
                    Feature(.volume, value: "75 L"),
                    Feature(.maxLoad, value: "25 kg"),
                    Feature(.material, value: "Cordura 600D"),
                    Feature(.waterproof, value: "High"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["375085551_1", "375085551_2", "375085551_3"],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "584337574",
                name: "ASCE 60L Adventure Backpack",
                info: "Versatile 60-liter backpack for various outdoor activities. Highly breathable back panel and padded shoulder straps for maximum comfort during long climbs.",
                price: 380.0,
                category: .backpacks,
                features: [
                    Feature(.brand, value: "ASCE"),
                    Feature(.weight, value: "1.8 kg"),
                    Feature(.volume, value: "60 L"),
                    Feature(.maxLoad, value: "20 kg"),
                    Feature(.material, value: "Nylon Ripstop"),
                    Feature(.waterproof, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["584337574_1", "584337574_2", "584337574_3", "584337574_4", "584337574_5", "584337574_6", "584337574_7"],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "540287579",
                name: "Frontier Turun Trekking Pants",
                info: "Durable and flexible pants designed for rough terrain. Quick-dry technology and reinforced knees provide comfort and longevity on the trail.",
                price: 150.0,
                category: .clothing,
                features: [
                    Feature(.brand, value: "Frontier"),
                    Feature(.size, value: "L"),
                    Feature(.gender, value: "Men's"),
                    Feature(.material, value: "Stretch Nylon"),
                    Feature(.waterproof, value: "Water Resistant"),
                    Feature(.breathability, value: "High"),
                    Feature(.insulationLevel, value: "Light"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["540287579_1", "540287579_2", "540287579_3", "540287579_4", "540287579_5", "540287579_7"],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "540288069",
                name: "Frontier Women's Gray Hiking Pants",
                info: "Technical hiking pants tailored for women. Lightweight, breathable fabric ensures comfort during strenuous activities. Multiple secure pockets for small essentials.",
                price: 150.0,
                category: .clothing,
                features: [
                    Feature(.brand, value: "Frontier"),
                    Feature(.size, value: "XL"),
                    Feature(.gender, value: "Women's"),
                    Feature(.material, value: "Stretch Nylon"),
                    Feature(.waterproof, value: "Water Resistant"),
                    Feature(.breathability, value: "High"),
                    Feature(.insulationLevel, value: "Light"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["540288069_1", "540288069_2", "540288069_3", "540288069_4", "540288069_5", "540288069_7"],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "583615540",
                name: "La Sportiva D'Herens Down Jacket",
                info: "Premium down jacket for extreme cold. Unmatched warmth-to-weight ratio. Perfect for high-altitude climbing or winter camping where every gram counts.",
                price: 650.0,
                category: .clothing,
                features: [
                    Feature(.brand, value: "La Sportiva"),
                    Feature(.size, value: "S"),
                    Feature(.gender, value: "Men's"),
                    Feature(.material, value: "Down/Nylon"),
                    Feature(.waterproof, value: "DWR Finish"),
                    Feature(.breathability, value: "Moderate"),
                    Feature(.insulationLevel, value: "Extreme"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["583615540_1", "583615540_2", "583615540_3", "583615540_4"],
                countAvailable: 2
            ),
            SeedTemplate(
                code: "580307335",
                name: "LOWA Renegade GTX Boots",
                info: "Iconic hiking boots known for incredible comfort and stability. Vibram sole for superior grip and Gore-Tex lining for total waterproof protection.",
                price: 450.0,
                category: .footwear,
                features: [
                    Feature(.brand, value: "LOWA"),
                    Feature(.footSize, value: "45"),
                    Feature(.material, value: "Leather/Gore-Tex"),
                    Feature(.waterproof, value: "Yes"),
                    Feature(.terrain, value: "Mountain Trails"),
                    Feature(.soleType, value: "Vibram"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["580307335_1", "580307335_2", "580307335_3", "580307335_4", "580307335_5", "580307335_6"],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "589599646",
                name: "Salomon XT-6 Advanced Trail Shoes",
                info: "Technical trail running shoes with superior cushioning. Built for durability on long-distance technical terrain. Features the quick-lace system for a perfect fit.",
                price: 350.0,
                category: .footwear,
                features: [
                    Feature(.brand, value: "Salomon"),
                    Feature(.footSize, value: "44"),
                    Feature(.material, value: "Synthetic/Mesh"),
                    Feature(.waterproof, value: "Water Resistant"),
                    Feature(.terrain, value: "Technical Trail"),
                    Feature(.soleType, value: "Contagrip"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["589599646_1", "589599646_2", "589599646_3", "589599646_4", "589599646_5", "589599646_6"],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "592552453",
                name: "Lowa Innovo GTX Hiking Shoes",
                info: "Modern, lightweight hiking shoes for mixed terrain. Combines sneaker-like agility with trekking boot protection. Gore-Tex ensures you stay dry in any weather.",
                price: 320.0,
                category: .footwear,
                features: [
                    Feature(.brand, value: "LOWA"),
                    Feature(.footSize, value: "41"),
                    Feature(.material, value: "Synthetic/Gore-Tex"),
                    Feature(.waterproof, value: "Yes"),
                    Feature(.terrain, value: "Mixed Terrain"),
                    Feature(.soleType, value: "Lowa Rubber"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["592552453_1", "592552453_2"],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "2440062",
                name: "Tramp Stainless Steel Mug 300ml",
                info: "Classic camping mug with foldable handles. Durable stainless steel construction that can be used directly on a stove. Lightweight and compact for any gear set.",
                price: 60.0,
                category: .cooking,
                features: [
                    Feature(.weight, value: "0.15 kg"),
                    Feature(.cookingCapacity, value: "0.3 L"),
                    Feature(.material, value: "Stainless Steel"),
                    Feature(.foldable, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["2440062_1", "2440062_2", "2440062_3", "2440062_4"],
                countAvailable: 15
            ),
            SeedTemplate(
                code: "451607654",
                name: "Tribe Silicone Collapsible Cup",
                info: "Ultra-compact collapsible cup made of food-grade silicone. Folds flat when not in use. Ideal for fast-and-light hikers who want to save space.",
                price: 50.0,
                category: .cooking,
                features: [
                    Feature(.weight, value: "0.05 kg"),
                    Feature(.cookingCapacity, value: "0.2 L"),
                    Feature(.material, value: "Silicone"),
                    Feature(.foldable, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["451607654_1", "451607654_2", "451607654_3"],
                countAvailable: 20
            ),
            SeedTemplate(
                code: "547292937",
                name: "Tribe Collapsible Bowl 600ml",
                info: "Large silicone bowl that collapses into a flat disc. Durable construction that handles hot food with ease. Perfect for campsite dinners and easy cleanup.",
                price: 80.0,
                category: .cooking,
                features: [
                    Feature(.weight, value: "0.1 kg"),
                    Feature(.cookingCapacity, value: "0.6 L"),
                    Feature(.material, value: "Silicone"),
                    Feature(.foldable, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["547292937_1", "547292937_2"],
                countAvailable: 12
            ),
            SeedTemplate(
                code: "421872885",
                name: "TRIZAND Professional Compass",
                info: "High-precision map compass with sighting mirror. Durable baseplate with various scales for accurate navigation. Essential for wilderness orientation.",
                price: 120.0,
                category: .navigation,
                features: [
                    Feature(.compass, value: "Magnetic Sighting"),
                    Feature(.material, value: "Acrylic"),
                    Feature(.dimensions, value: "10x6 cm"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["421872885_1", "421872885_2", "421872885_4", "421872885_5", "421872885_7"],
                countAvailable: 10
            ),
            SeedTemplate(
                code: "364638498",
                name: "Luxury 2886 Power Lantern",
                info: "Powerful handheld lantern with integrated power bank function. Provides bright illumination for campsites and can charge your mobile devices in an emergency.",
                price: 280.0,
                category: .lighting,
                features: [
                    Feature(.brightness, value: "800 Lumens"),
                    Feature(.powerSource, value: "Rechargeable"),
                    Feature(.batteryLife, value: "24 hours"),
                    Feature(.weight, value: "0.5 kg"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["364638498_1", "364638498_2", "364638498_3"],
                countAvailable: 6
            ),
            SeedTemplate(
                code: "493023544",
                name: "Climbing Technology Ascent Harness",
                info: "Professional climbing harness with ergonomic padding. Multiple gear loops and highly adjustable straps for a secure and comfortable fit during climbs.",
                price: 380.0,
                category: .climbing,
                features: [
                    Feature(.weight, value: "0.45 kg"),
                    Feature(.safetyRating, value: "CE EN 12277"),
                    Feature(.material, value: "Nylon/Polyester"),
                    Feature(.skillLevel, value: "Pro"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["493023544_1", "493023544_2"],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "543007900",
                name: "Sea To Summit Pocket Shower",
                info: "Compact 10-liter solar shower. The black material heats up water in the sun. Ideal for maintaining hygiene during multi-day expeditions in remote areas.",
                price: 180.0,
                category: .waterGear,
                features: [
                    Feature(.weight, value: "0.12 kg"),
                    Feature(.capacity, value: "10 L"),
                    Feature(.material, value: "Nylon"),
                    Feature(.waterproof, value: "High"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["543007900_1", "543007900_2", "543007900_3"],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "434770868",
                name: "Camotec Extreme Winter Suit",
                info: "Heavy-duty insulated suit for extreme cold. Designed for winter camping and high-altitude activities. Provides a complete thermal barrier against snow and ice.",
                price: 850.0,
                category: .winterGear,
                features: [
                    Feature(.weight, value: "2.5 kg"),
                    Feature(.insulation, value: "Synthetic"),
                    Feature(.temperatureRating, value: "-20°C"),
                    Feature(.terrain, value: "Extreme Cold"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imageResourceNames: ["434770868_1", "434770868_10", "434770868_2", "434770868_3", "434770868_4", "434770868_5", "434770868_6", "434770868_7", "434770868_8", "434770868_9"],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "539198434",
                name: "Tribe Stainless Steel Canteen",
                info: "Classic outdoor canteen for water storage. Durable stainless steel body that is easy to clean and practically indestructible. A sustainable alternative to plastic bottles.",
                price: 140.0,
                category: .accessories,
                features: [
                    Feature(.weight, value: "0.4 kg"),
                    Feature(.material, value: "Stainless Steel"),
                    Feature(.ecoFriendly, value: "Yes"),
                    Feature(.foldable, value: "No")
                ],
                imageResourceNames: ["539198434_1", "539198434_2", "539198434_3", "539198434_4"],
                countAvailable: 12
            )
        ]
    }
}
