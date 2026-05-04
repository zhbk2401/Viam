import Foundation
import UIKit

extension Product {
    struct SeedTemplate {
        let code: String
        let name: String
        let info: String
        let price: Double
        let category: Category
        let features: [Feature]
        let imagesData: [Data]
        let countAvailable: Int
    }
    
    static var generatedSeedTemplates: [SeedTemplate] {
        return [
            SeedTemplate(
                code: "389948589",
                name: "Totem Summer 2 (v2) Single-Layer Tent",
                info: "This professional Totem Summer 2 (v2) single-layer tent is the perfect solution for your next adventure. Made of high-quality materials, it ensures maximum comfort and reliability in the most demanding conditions. Ergonomic design and thoughtful details make it an indispensable piece of gear for camping and short weekend trips.",
                price: 450.0,
                category: .tents,
                features: [
                    Feature(.brand, value: "Totem"),
                    Feature(.weight, value: "1.9 kg"),
                    Feature(.capacity, value: "2 people"),
                    Feature(.material, value: "Polyester Taffeta 75D"),
                    Feature(.waterproof, value: "2000 mm"),
                    Feature(.windResistance, value: "up to 50 km/h"),
                    Feature(.season, value: "Summer"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._389948589_1).pngData()!,
                    UIImage(resource: ._389948589_10).pngData()!,
                    UIImage(resource: ._389948589_12).pngData()!,
                    UIImage(resource: ._389948589_2).pngData()!,
                    UIImage(resource: ._389948589_3).pngData()!,
                    UIImage(resource: ._389948589_4).pngData()!,
                    UIImage(resource: ._389948589_5).pngData()!,
                    UIImage(resource: ._389948589_6).pngData()!,
                    UIImage(resource: ._389948589_9).pngData()!
                ],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "582797866",
                name: "Tramp Lite Fly 2 Tent Sand",
                info: "High-quality Tramp Lite Fly 2 tent in sand color. Designed for light hiking and camping. This single-layer tent offers a perfect balance between weight and protection. The high-density polyester material ensures you stay dry, while the integrated ventilation system minimizes condensation.",
                price: 550.0,
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
                imagesData: [
                    UIImage(resource: ._582797866_1).pngData()!,
                    UIImage(resource: ._582797866_2).pngData()!,
                    UIImage(resource: ._582797866_3).pngData()!,
                    UIImage(resource: ._582797866_4).pngData()!,
                    UIImage(resource: ._582797866_5).pngData()!,
                    UIImage(resource: ._582797866_6).pngData()!,
                    UIImage(resource: ._582797866_7).pngData()!,
                    UIImage(resource: ._582797866_8).pngData()!
                ],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "587293630",
                name: "Camping Double Tent with Mosquito Net",
                info: "Spacious double camping tent with a high-quality mosquito net. Ideal for summer trips where ventilation is key. Easy to set up and lightweight enough for backpacking. The durable material and reinforced seams provide reliable shelter for your outdoor stay.",
                price: 350.0,
                category: .tents,
                features: [
                    Feature(.brand, value: "Generic"),
                    Feature(.weight, value: "2.1 kg"),
                    Feature(.capacity, value: "2 people"),
                    Feature(.material, value: "Polyester"),
                    Feature(.waterproof, value: "1500 mm"),
                    Feature(.windResistance, value: "up to 35 km/h"),
                    Feature(.season, value: "Summer"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [UIImage(resource: ._587293630_1).pngData()!],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "3680957",
                name: "Totem Ember Sleeping Bag Olive",
                info: "The Totem Ember sleeping bag is designed for comfort during your outdoor nights. Featuring high-quality synthetic insulation, it provides excellent warmth-to-weight ratio. The anatomical shape and soft lining ensure a good night's sleep after a long day of hiking.",
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
                imagesData: [
                    UIImage(resource: ._3680957_2).pngData()!,
                    UIImage(resource: ._3680957_3).pngData()!,
                    UIImage(resource: ._3680957_4).pngData()!,
                    UIImage(resource: ._3680957_5).pngData()!
                ],
                countAvailable: 8
            ),
            SeedTemplate(
                code: "3681909",
                name: "Totem Hunter Mummy Sleeping Bag",
                info: "Professional mummy-style sleeping bag from Totem. Excellent for technical hiking where weight and packability are crucial. The Hunter model features reinforced stitching and a specialized hood to trap heat effectively during colder nights.",
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
                imagesData: [
                    UIImage(resource: ._3681909_1).pngData()!,
                    UIImage(resource: ._3681909_10).pngData()!,
                    UIImage(resource: ._3681909_11).pngData()!,
                    UIImage(resource: ._3681909_12).pngData()!,
                    UIImage(resource: ._3681909_13).pngData()!,
                    UIImage(resource: ._3681909_2).pngData()!,
                    UIImage(resource: ._3681909_3).pngData()!,
                    UIImage(resource: ._3681909_4).pngData()!,
                    UIImage(resource: ._3681909_5).pngData()!,
                    UIImage(resource: ._3681909_7).pngData()!,
                    UIImage(resource: ._3681909_8).pngData()!,
                    UIImage(resource: ._3681909_9).pngData()!
                ],
                countAvailable: 6
            ),
            SeedTemplate(
                code: "446910995",
                name: "Extreme Winter Sleeping Bag -15°C",
                info: "Heavy-duty insulated sleeping bag designed for extreme cold. Rated for temperatures down to -15°C. The thick insulation and specialized draft collars ensure you stay warm even in freezing conditions. Perfect for winter expeditions and high-altitude camping.",
                price: 380.0,
                category: .sleepingBags,
                features: [
                    Feature(.brand, value: "Professional"),
                    Feature(.weight, value: "2.1 kg"),
                    Feature(.temperatureRating, value: "-15°C"),
                    Feature(.insulation, value: "Synthetic Mix"),
                    Feature(.season, value: "Winter"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._446910995_1).pngData()!,
                    UIImage(resource: ._446910995_2).pngData()!,
                    UIImage(resource: ._446910995_3).pngData()!,
                    UIImage(resource: ._446910995_4).pngData()!
                ],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "363662235",
                name: "Naturehike 45L Hiking Backpack",
                info: "Lightweight and durable 45-liter hiking backpack from Naturehike. Features an ergonomic suspension system that distributes weight evenly across your hips and shoulders. Multiple compartments and attachment points for trekking poles and other gear.",
                price: 320.0,
                category: .backpacks,
                features: [
                    Feature(.brand, value: "Naturehike"),
                    Feature(.weight, value: "1.2 kg"),
                    Feature(.volume, value: "45 L"),
                    Feature(.maxLoad, value: "15 kg"),
                    Feature(.material, value: "Nylon Ripstop"),
                    Feature(.waterproof, value: "Rain Cover Included"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._363662235_1).pngData()!,
                    UIImage(resource: ._363662235_2).pngData()!
                ],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "375085551",
                name: "Eagle A21 External Frame Backpack 75L",
                info: "Large capacity 75-liter backpack with an external frame for maximum support during long-haul expeditions. Designed for heavy loads, it features thick padding and a highly adjustable harness. Ideal for week-long treks and remote wilderness travel.",
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
                imagesData: [
                    UIImage(resource: ._375085551_1).pngData()!,
                    UIImage(resource: ._375085551_2).pngData()!,
                    UIImage(resource: ._375085551_3).pngData()!
                ],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "584337574",
                name: "ASCE 60L Trekking Backpack",
                info: "Versatile 60-liter trekking backpack suitable for multi-day trips. The breathable back panel ensures comfort during strenuous climbs. Features a dedicated hydration sleeve and easy-access side pockets for water bottles and snacks.",
                price: 380.0,
                category: .backpacks,
                features: [
                    Feature(.brand, value: "ASCE"),
                    Feature(.weight, value: "1.8 kg"),
                    Feature(.volume, value: "60 L"),
                    Feature(.maxLoad, value: "20 kg"),
                    Feature(.material, value: "Nylon"),
                    Feature(.waterproof, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._584337574_1).pngData()!,
                    UIImage(resource: ._584337574_2).pngData()!,
                    UIImage(resource: ._584337574_3).pngData()!,
                    UIImage(resource: ._584337574_4).pngData()!,
                    UIImage(resource: ._584337574_5).pngData()!,
                    UIImage(resource: ._584337574_6).pngData()!,
                    UIImage(resource: ._584337574_7).pngData()!
                ],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "540287579",
                name: "Frontier Turun Trekking Pants",
                info: "Durable and flexible trekking pants from Frontier. Designed for high mobility on the trail. The quick-dry fabric and reinforced knees make them perfect for rugged terrain. Features multiple secure pockets for your essentials.",
                price: 250.0,
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
                imagesData: [
                    UIImage(resource: ._540287579_1).pngData()!,
                    UIImage(resource: ._540287579_2).pngData()!,
                    UIImage(resource: ._540287579_3).pngData()!,
                    UIImage(resource: ._540287579_4).pngData()!,
                    UIImage(resource: ._540287579_5).pngData()!,
                    UIImage(resource: ._540287579_7).pngData()!
                ],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "540288069",
                name: "Frontier Turun Gray Women's Pants",
                info: "Women's specific trekking pants from the Frontier Turun series. Lightweight, breathable, and designed for a perfect fit. Ideal for everything from day hikes to multi-day trekking expeditions. The fabric provides excellent protection against wind and light rain.",
                price: 250.0,
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
                imagesData: [
                    UIImage(resource: ._540288069_1).pngData()!,
                    UIImage(resource: ._540288069_2).pngData()!,
                    UIImage(resource: ._540288069_3).pngData()!,
                    UIImage(resource: ._540288069_4).pngData()!,
                    UIImage(resource: ._540288069_5).pngData()!,
                    UIImage(resource: ._540288069_7).pngData()!
                ],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "583615540",
                name: "La Sportiva D'Herens Down Jacket",
                info: "Premium down jacket from La Sportiva. Provides exceptional warmth in extremely cold conditions while remaining incredibly lightweight and packable. Perfect as a standalone outer layer or a warm mid-layer for high-altitude climbing.",
                price: 750.0,
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
                imagesData: [
                    UIImage(resource: ._583615540_1).pngData()!,
                    UIImage(resource: ._583615540_2).pngData()!,
                    UIImage(resource: ._583615540_3).pngData()!,
                    UIImage(resource: ._583615540_4).pngData()!
                ],
                countAvailable: 2
            ),
            SeedTemplate(
                code: "580307335",
                name: "LOWA Renegade Hiking Boots",
                info: "World-class hiking boots from LOWA. Renowned for their comfort and stability right out of the box. Featuring a Vibram sole for superior grip and a Gore-Tex lining to keep your feet dry in any weather. Perfect for rugged mountain trails.",
                price: 650.0,
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
                imagesData: [
                    UIImage(resource: ._580307335_1).pngData()!,
                    UIImage(resource: ._580307335_2).pngData()!,
                    UIImage(resource: ._580307335_3).pngData()!,
                    UIImage(resource: ._580307335_4).pngData()!,
                    UIImage(resource: ._580307335_5).pngData()!,
                    UIImage(resource: ._580307335_6).pngData()!
                ],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "589599646",
                name: "Salomon XT-6 Advanced Sneakers",
                info: "Technical trail running shoes that have become a style icon. The Salomon XT-6 provides incredible cushioning and durability on technical terrain. Features the Quicklace system for a secure and easy fit. Ideal for fast-paced hiking and trail running.",
                price: 550.0,
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
                imagesData: [
                    UIImage(resource: ._589599646_1).pngData()!,
                    UIImage(resource: ._589599646_2).pngData()!,
                    UIImage(resource: ._589599646_3).pngData()!,
                    UIImage(resource: ._589599646_4).pngData()!,
                    UIImage(resource: ._589599646_5).pngData()!,
                    UIImage(resource: ._589599646_6).pngData()!
                ],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "592552453",
                name: "Lowa Innovo GTX Hiking Shoes",
                info: "Modern, lightweight hiking shoes from LOWA. The Innovo GTX offers the agility of a sneaker with the protection of a hiking boot. Equipped with Gore-Tex for waterproof performance and a highly breathable upper for comfort in warm weather.",
                price: 520.0,
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
                imagesData: [
                    UIImage(resource: ._592552453_1).pngData()!,
                    UIImage(resource: ._592552453_2).pngData()!
                ],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "2440062",
                name: "Tramp Stainless Steel Mug 300ml",
                info: "Durable 300ml stainless steel mug from Tramp. Features foldable handles for compact storage. Perfect for heating water or enjoying your morning coffee by the campfire. Lightweight and virtually indestructible, a must-have for any camp kitchen.",
                price: 60.0,
                category: .cooking,
                features: [
                    Feature(.weight, value: "0.15 kg"),
                    Feature(.fuelType, value: "N/A"),
                    Feature(.cookingCapacity, value: "0.3 L"),
                    Feature(.powerSource, value: "Fire/Stove"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._2440062_1).pngData()!,
                    UIImage(resource: ._2440062_2).pngData()!,
                    UIImage(resource: ._2440062_3).pngData()!,
                    UIImage(resource: ._2440062_4).pngData()!
                ],
                countAvailable: 15
            ),
            SeedTemplate(
                code: "451607654",
                name: "Tribe Collapsible Silicone Cup 200ml",
                info: "Ultra-portable 200ml collapsible silicone cup from Tribe. Folds flat when not in use to save space in your pack. Made of food-grade silicone that is heat resistant and easy to clean. Perfect for fast-and-light adventures where space is at a premium.",
                price: 40.0,
                category: .cooking,
                features: [
                    Feature(.weight, value: "0.05 kg"),
                    Feature(.fuelType, value: "N/A"),
                    Feature(.cookingCapacity, value: "0.2 L"),
                    Feature(.powerSource, value: "N/A"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._451607654_1).pngData()!,
                    UIImage(resource: ._451607654_2).pngData()!,
                    UIImage(resource: ._451607654_3).pngData()!
                ],
                countAvailable: 20
            ),
            SeedTemplate(
                code: "547292937",
                name: "Tribe Collapsible Silicone Bowl 600ml",
                info: "Lightweight 600ml collapsible bowl from Tribe. Ideal for camp meals, it takes up minimal space in your gear. Durable construction that handles both hot and cold food. Easy to pack, easy to wash, and built to last through many outdoor seasons.",
                price: 80.0,
                category: .cooking,
                features: [
                    Feature(.weight, value: "0.1 kg"),
                    Feature(.fuelType, value: "N/A"),
                    Feature(.cookingCapacity, value: "0.6 L"),
                    Feature(.powerSource, value: "N/A"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._547292937_1).pngData()!,
                    UIImage(resource: ._547292937_2).pngData()!
                ],
                countAvailable: 12
            ),
            SeedTemplate(
                code: "421872885",
                name: "TRIZAND Professional Compass",
                info: "High-precision professional compass from TRIZAND. Featuring a clear baseplate for map work and a sighting mirror for accurate bearings. Reliable and durable, it's an essential tool for navigation in remote areas where electronic devices might fail.",
                price: 120.0,
                category: .navigation,
                features: [
                    Feature(.gps, value: "No"),
                    Feature(.compass, value: "Magnetic Sighting"),
                    Feature(.connectivity, value: "N/A"),
                    Feature(.batteryLife, value: "Infinity"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._421872885_1).pngData()!,
                    UIImage(resource: ._421872885_2).pngData()!,
                    UIImage(resource: ._421872885_4).pngData()!,
                    UIImage(resource: ._421872885_5).pngData()!,
                    UIImage(resource: ._421872885_7).pngData()!
                ],
                countAvailable: 10
            ),
            SeedTemplate(
                code: "562405224",
                name: "AceCamp Liquid-Free Compass",
                info: "Compact and reliable liquid-free compass from AceCamp. Durable metal housing protects the needle during transport. Simple to use and highly effective for basic navigation and orientation. A lightweight addition to your survival kit.",
                price: 90.0,
                category: .navigation,
                features: [
                    Feature(.gps, value: "No"),
                    Feature(.compass, value: "Magnetic"),
                    Feature(.connectivity, value: "N/A"),
                    Feature(.batteryLife, value: "Infinity"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [UIImage(resource: ._562405224_2).pngData()!],
                countAvailable: 15
            ),
            SeedTemplate(
                code: "364638498",
                name: "Luxury 2886 Powerful Handheld Lantern",
                info: "Powerful handheld lantern with integrated Power Bank. Provides intense illumination for your campsite or workspace. Features multiple light modes, including a side-mounted light for area lighting. Reliable battery performance ensures light when you need it most.",
                price: 280.0,
                category: .lighting,
                features: [
                    Feature(.brightness, value: "800 Lumens"),
                    Feature(.powerSource, value: "Rechargeable Battery"),
                    Feature(.batteryLife, value: "Up to 24 hours"),
                    Feature(.weight, value: "0.5 kg"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._364638498_1).pngData()!,
                    UIImage(resource: ._364638498_2).pngData()!,
                    UIImage(resource: ._364638498_3).pngData()!
                ],
                countAvailable: 6
            ),
            SeedTemplate(
                code: "398428035",
                name: "Bailong BL-8628 Tactical Flashlight",
                info: "Compact tactical flashlight with 500 lumens of output. Features an adjustable zoom for flood or spotlighting. Durable aluminum body is water and shock-resistant. Perfect for security, camping, or as a reliable backup light in your vehicle.",
                price: 150.0,
                category: .lighting,
                features: [
                    Feature(.brightness, value: "500 Lumens"),
                    Feature(.powerSource, value: "18650 Battery/AAA"),
                    Feature(.batteryLife, value: "Up to 8 hours"),
                    Feature(.weight, value: "0.2 kg"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [UIImage(resource: ._398428035_1).pngData()!],
                countAvailable: 20
            ),
            SeedTemplate(
                code: "442731275",
                name: "Delphin LightCONTACT Tent Light",
                info: "Specialized LED tent light from Delphin. Designed to hang from the ceiling of your tent, providing soft, even illumination. Features multiple brightness settings and a long run time on a single set of batteries. Compact and easy to transport.",
                price: 100.0,
                category: .lighting,
                features: [
                    Feature(.brightness, value: "200 Lumens"),
                    Feature(.powerSource, value: "AAA Batteries"),
                    Feature(.batteryLife, value: "Up to 40 hours"),
                    Feature(.weight, value: "0.15 kg"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._442731275_1).pngData()!,
                    UIImage(resource: ._442731275_2).pngData()!,
                    UIImage(resource: ._442731275_3).pngData()!
                ],
                countAvailable: 10
            ),
            SeedTemplate(
                code: "353523054",
                name: "Wealis Telescopic Nordic Walking Pole",
                info: "High-quality telescopic pole for nordic walking and light trekking. Made of lightweight aluminum, it features an adjustable height to suit your stride. The ergonomic grip and integrated shock absorption system reduce fatigue on long walks.",
                price: 180.0,
                category: .trekking,
                features: [
                    Feature(.weight, value: "0.25 kg"),
                    Feature(.material, value: "Aluminum"),
                    Feature(.adjustableSize, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._353523054_1).pngData()!,
                    UIImage(resource: ._353523054_2).pngData()!,
                    UIImage(resource: ._353523054_3).pngData()!
                ],
                countAvailable: 12
            ),
            SeedTemplate(
                code: "440216708",
                name: "Eddie Bauer Trekking Poles Set",
                info: "Professional trekking poles from Eddie Bauer. These poles provide extra stability and support on technical terrain. The lightweight carbon/aluminum construction and quick-lock system make them easy to adjust on the go. Essential for protecting your knees on descents.",
                price: 350.0,
                category: .trekking,
                features: [
                    Feature(.weight, value: "0.5 kg (pair)"),
                    Feature(.material, value: "Aluminum/Carbon"),
                    Feature(.adjustableSize, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [UIImage(resource: ._440216708_1).pngData()!],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "440753954",
                name: "CONTOOSE Folding Trekking Pole",
                info: "Ultra-compact folding trekking pole that fits easily inside your pack. Designed for travelers and hikers who value portability. Despite its folding design, it remains incredibly strong and stable. Perfect for occasional use or as a backup pole.",
                price: 220.0,
                category: .trekking,
                features: [
                    Feature(.weight, value: "0.3 kg"),
                    Feature(.material, value: "Aluminum"),
                    Feature(.adjustableSize, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [UIImage(resource: ._440753954_1).pngData()!],
                countAvailable: 8
            ),
            SeedTemplate(
                code: "493023544",
                name: "Climbing Technology Ascent Harness",
                info: "Professional climbing harness from Climbing Technology. Features high-quality padding and multiple gear loops for all your climbing essentials. The adjustable leg loops ensure a perfect fit over different clothing layers. Rated for high-performance rock climbing.",
                price: 380.0,
                category: .climbing,
                features: [
                    Feature(.weight, value: "0.45 kg"),
                    Feature(.material, value: "Polyester/Nylon"),
                    Feature(.safetyRating, value: "CE EN 12277"),
                    Feature(.skillLevel, value: "Intermediate/Pro"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._493023544_1).pngData()!,
                    UIImage(resource: ._493023544_2).pngData()!
                ],
                countAvailable: 4
            ),
            SeedTemplate(
                code: "568110076",
                name: "Climbing Technology Lime Carabiner",
                info: "High-strength straight-gate carabiner for climbing. Lightweight and durable, it features a smooth gate action and a keylock nose to prevent snagging. An essential component of any climbing rack, built to meet strict safety standards.",
                price: 50.0,
                category: .climbing,
                features: [
                    Feature(.weight, value: "0.04 kg"),
                    Feature(.material, value: "Aluminum Alloy"),
                    Feature(.safetyRating, value: "CE EN 12275"),
                    Feature(.skillLevel, value: "All Levels"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [UIImage(resource: ._568110076_1).pngData()!],
                countAvailable: 50
            ),
            SeedTemplate(
                code: "573999040",
                name: "Climbing Technology Ascent Harness XS/S",
                info: "Smaller size professional climbing harness. Provides the same high-level security and comfort as the larger models. Ideal for youth climbers or those with smaller builds. Fully adjustable and built for long-lasting durability in the vertical world.",
                price: 380.0,
                category: .climbing,
                features: [
                    Feature(.weight, value: "0.42 kg"),
                    Feature(.material, value: "Polyester/Nylon"),
                    Feature(.safetyRating, value: "CE EN 12277"),
                    Feature(.skillLevel, value: "Intermediate/Pro"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [UIImage(resource: ._573999040_1).pngData()!],
                countAvailable: 2
            ),
            SeedTemplate(
                code: "543007900",
                name: "Sea To Summit Pocket Shower 10L",
                info: "Ultra-compact 10-liter pocket shower from Sea To Summit. Ideal for hygiene during multi-day treks. The black material absorbs sunlight to provide a warm shower. Folds down to almost nothing when not in use. A game-changer for camping comfort.",
                price: 180.0,
                category: .waterGear,
                features: [
                    Feature(.weight, value: "0.12 kg"),
                    Feature(.capacity, value: "10 L"),
                    Feature(.material, value: "PU Coated Nylon"),
                    Feature(.waterproof, value: "High"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._543007900_1).pngData()!,
                    UIImage(resource: ._543007900_2).pngData()!,
                    UIImage(resource: ._543007900_3).pngData()!
                ],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "547308081",
                name: "Mares Camouflage Spearfishing Wetsuit",
                info: "Professional-grade camouflage wetsuit for spearfishing and freediving. The specialized pattern helps you blend into the underwater environment. Made of high-quality neoprene that provides excellent thermal protection and freedom of movement.",
                price: 950.0,
                category: .waterGear,
                features: [
                    Feature(.weight, value: "1.5 kg"),
                    Feature(.capacity, value: "N/A"),
                    Feature(.material, value: "Neoprene"),
                    Feature(.waterproof, value: "N/A"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [UIImage(resource: ._547308081_1).pngData()!],
                countAvailable: 2
            ),
            SeedTemplate(
                code: "391931565",
                name: "BaseCamp Chemical Foot Warmer Set",
                info: "Instant chemical foot warmers from BaseCamp. Perfect for winter hiking, skiing, or any cold-weather activity. Simply open the package to activate the heat. Provides consistent warmth for up to 8 hours. Fits comfortably inside any boot or shoe.",
                price: 70.0,
                category: .winterGear,
                features: [
                    Feature(.weight, value: "0.05 kg"),
                    Feature(.insulation, value: "Chemical Heat"),
                    Feature(.temperatureRating, value: "Up to 45°C"),
                    Feature(.terrain, value: "All Winter"),
                    Feature(.ecoFriendly, value: "Partial")
                ],
                imagesData: [UIImage(resource: ._391931565_3).pngData()!],
                countAvailable: 50
            ),
            SeedTemplate(
                code: "434770868",
                name: "Camotec HitPoint Winter Suit",
                info: "Heavy-duty winter suit from Camotec. Designed for extreme cold and snowy conditions. The insulated jacket and pants provide a complete thermal barrier. Ideal for winter camping, ice fishing, or mountain expeditions. Built to withstand the harshest elements.",
                price: 850.0,
                category: .winterGear,
                features: [
                    Feature(.weight, value: "2.5 kg"),
                    Feature(.insulation, value: "Synthetic Fiber"),
                    Feature(.temperatureRating, value: "-20°C"),
                    Feature(.terrain, value: "Snow/Extreme Cold"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._434770868_1).pngData()!,
                    UIImage(resource: ._434770868_10).pngData()!,
                    UIImage(resource: ._434770868_2).pngData()!,
                    UIImage(resource: ._434770868_3).pngData()!,
                    UIImage(resource: ._434770868_4).pngData()!,
                    UIImage(resource: ._434770868_5).pngData()!,
                    UIImage(resource: ._434770868_6).pngData()!,
                    UIImage(resource: ._434770868_7).pngData()!,
                    UIImage(resource: ._434770868_8).pngData()!,
                    UIImage(resource: ._434770868_9).pngData()!
                ],
                countAvailable: 3
            ),
            SeedTemplate(
                code: "575879887",
                name: "Marutex Camouflage Winter Gloves",
                info: "Warm and durable winter gloves for hunting, fishing, and trekking. The camouflage pattern and reinforced palms make them perfect for outdoor work in cold weather. Windproof and water-resistant material keeps your hands warm and functional.",
                price: 180.0,
                category: .winterGear,
                features: [
                    Feature(.weight, value: "0.2 kg"),
                    Feature(.insulation, value: "Fiberfill"),
                    Feature(.temperatureRating, value: "-10°C"),
                    Feature(.terrain, value: "Forest/Outdoor"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._575879887_1).pngData()!,
                    UIImage(resource: ._575879887_2).pngData()!,
                    UIImage(resource: ._575879887_3).pngData()!,
                    UIImage(resource: ._575879887_4).pngData()!,
                    UIImage(resource: ._575879887_5).pngData()!,
                    UIImage(resource: ._575879887_6).pngData()!,
                    UIImage(resource: ._575879887_7).pngData()!
                ],
                countAvailable: 8
            ),
            SeedTemplate(
                code: "357023298",
                name: "9-in-1 Survival Multi-Tool Kit",
                info: "Essential 9-in-1 survival kit in a compact camouflage case. Includes everything from a fire starter to a wire saw. Perfect for your emergency kit or for learning bushcraft skills. Compact and lightweight, it's the ultimate insurance policy for your outdoor trips.",
                price: 220.0,
                category: .accessories,
                features: [
                    Feature(.weight, value: "0.4 kg"),
                    Feature(.material, value: "Steel/Polymer"),
                    Feature(.foldable, value: "Yes"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._357023298_1).pngData()!,
                    UIImage(resource: ._357023298_2).pngData()!
                ],
                countAvailable: 10
            ),
            SeedTemplate(
                code: "510383029",
                name: "NEO Tools 6-Piece Metal Cup Set",
                info: "Set of 6 stainless steel travel cups from NEO Tools. Includes a durable carrying case for easy transport. Perfect for sharing drinks with your group after a long hike. Built to last and far more eco-friendly than disposable alternatives.",
                price: 150.0,
                category: .accessories,
                features: [
                    Feature(.weight, value: "0.3 kg"),
                    Feature(.material, value: "Stainless Steel"),
                    Feature(.foldable, value: "Compact Stack"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [UIImage(resource: ._510383029_1).pngData()!],
                countAvailable: 5
            ),
            SeedTemplate(
                code: "539198434",
                name: "Tribe Stainless Steel Canteen",
                info: "Classic stainless steel canteen from Tribe. Built for rugged use in the wilderness. The secure cap prevents leaks even when bouncing in your pack. A reliable and sustainable way to carry your water on any adventure.",
                price: 140.0,
                category: .accessories,
                features: [
                    Feature(.weight, value: "0.4 kg"),
                    Feature(.material, value: "Stainless Steel"),
                    Feature(.foldable, value: "No"),
                    Feature(.ecoFriendly, value: "Yes")
                ],
                imagesData: [
                    UIImage(resource: ._539198434_1).pngData()!,
                    UIImage(resource: ._539198434_2).pngData()!,
                    UIImage(resource: ._539198434_3).pngData()!,
                    UIImage(resource: ._539198434_4).pngData()!
                ],
                countAvailable: 12
            )
        ]
    }
}
