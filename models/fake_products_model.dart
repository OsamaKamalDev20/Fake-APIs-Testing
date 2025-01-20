// To parse this JSON data, do
//
//     final fakeProductsModel = fakeProductsModelFromJson(jsonString);

import 'dart:convert';

List<FakeProductsModel> fakeProductsModelFromJson(String str) =>
    List<FakeProductsModel>.from(
        json.decode(str).map((x) => FakeProductsModel.fromJson(x)));

String fakeProductsModelToJson(List<FakeProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeProductsModel {
  int id;
  String name;
  String description;
  double price;
  String image;
  double rating;
  String brand;
  String? color;
  String? connectivity;
  bool? wireless;
  String? compatibility;
  String? weight;
  String? resolution;
  String? sensor;
  String? screenSize;
  String? storage;
  String? ram;
  String? display;
  bool? heartRateMonitor;
  bool? waterproof;
  int? gamesIncluded;
  String? outputPower;
  String? suctionPower;
  String? batteryLife;
  bool? mappingTechnology;
  String? storageCapacity;
  String? fakeProductsModelInterface;
  String? maxSpeed;
  String? range;
  String? weightCapacity;
  String? power;
  String? speeds;
  String? dpiRange;
  int? buttons;
  int? inclineLevels;
  bool? foldable;
  bool? voiceControl;
  String? capacity;
  String? solarPanelPower;
  String? material;
  String? thickness;
  List<String>? brushingModes;
  bool? timer;
  List<String>? plantsIncluded;
  String? potMaterial;
  String? potColor;
  String? videoResolution;
  String? fieldOfView;
  bool? adjustableHeight;
  String? maxHeight;
  List<String>? cookingModes;
  int? numberOfCameras;
  bool? nightVision;
  int? piecesIncluded;
  List<String>? levelsOfResistance;
  bool? lumbarSupport;
  List<String>? toolsIncluded;
  int? numberOfLights;
  String? lightColor;
  String? size;
  String? activeArea;
  int? penPressureLevels;
  String? brightness;
  List<String>? attachments;
  bool? adjustableLength;
  List<String>? compatibleDevices;
  List<String>? colorOptions;
  String? wirelessChargingStandard;
  List<String>? componentsIncluded;
  List<String>? activitiesTracked;

  FakeProductsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
    required this.brand,
    this.color,
    this.connectivity,
    this.wireless,
    this.compatibility,
    this.weight,
    this.resolution,
    this.sensor,
    this.screenSize,
    this.storage,
    this.ram,
    this.display,
    this.heartRateMonitor,
    this.waterproof,
    this.gamesIncluded,
    this.outputPower,
    this.suctionPower,
    this.batteryLife,
    this.mappingTechnology,
    this.storageCapacity,
    this.fakeProductsModelInterface,
    this.maxSpeed,
    this.range,
    this.weightCapacity,
    this.power,
    this.speeds,
    this.dpiRange,
    this.buttons,
    this.inclineLevels,
    this.foldable,
    this.voiceControl,
    this.capacity,
    this.solarPanelPower,
    this.material,
    this.thickness,
    this.brushingModes,
    this.timer,
    this.plantsIncluded,
    this.potMaterial,
    this.potColor,
    this.videoResolution,
    this.fieldOfView,
    this.adjustableHeight,
    this.maxHeight,
    this.cookingModes,
    this.numberOfCameras,
    this.nightVision,
    this.piecesIncluded,
    this.levelsOfResistance,
    this.lumbarSupport,
    this.toolsIncluded,
    this.numberOfLights,
    this.lightColor,
    this.size,
    this.activeArea,
    this.penPressureLevels,
    this.brightness,
    this.attachments,
    this.adjustableLength,
    this.compatibleDevices,
    this.colorOptions,
    this.wirelessChargingStandard,
    this.componentsIncluded,
    this.activitiesTracked,
  });

  factory FakeProductsModel.fromJson(Map<String, dynamic> json) =>
      FakeProductsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        brand: json["brand"],
        color: json["color"],
        connectivity: json["connectivity"],
        wireless: json["wireless"],
        compatibility: json["compatibility"],
        weight: json["weight"],
        resolution: json["resolution"],
        sensor: json["sensor"],
        screenSize: json["screen_size"],
        storage: json["storage"],
        ram: json["ram"],
        display: json["display"],
        heartRateMonitor: json["heart_rate_monitor"],
        waterproof: json["waterproof"],
        gamesIncluded: json["games_included"],
        outputPower: json["output_power"],
        suctionPower: json["suction_power"],
        batteryLife: json["battery_life"],
        mappingTechnology: json["mapping_technology"],
        storageCapacity: json["storage_capacity"],
        fakeProductsModelInterface: json["interface"],
        maxSpeed: json["max_speed"],
        range: json["range"],
        weightCapacity: json["weight_capacity"],
        power: json["power"],
        speeds: json["speeds"],
        dpiRange: json["dpi_range"],
        buttons: json["buttons"],
        inclineLevels: json["incline_levels"],
        foldable: json["foldable"],
        voiceControl: json["voice_control"],
        capacity: json["capacity"],
        solarPanelPower: json["solar_panel_power"],
        material: json["material"],
        thickness: json["thickness"],
        brushingModes: json["brushing_modes"] == null
            ? []
            : List<String>.from(json["brushing_modes"]!.map((x) => x)),
        timer: json["timer"],
        plantsIncluded: json["plants_included"] == null
            ? []
            : List<String>.from(json["plants_included"]!.map((x) => x)),
        potMaterial: json["pot_material"],
        potColor: json["pot_color"],
        videoResolution: json["video_resolution"],
        fieldOfView: json["field_of_view"],
        adjustableHeight: json["adjustable_height"],
        maxHeight: json["max_height"],
        cookingModes: json["cooking_modes"] == null
            ? []
            : List<String>.from(json["cooking_modes"]!.map((x) => x)),
        numberOfCameras: json["number_of_cameras"],
        nightVision: json["night_vision"],
        piecesIncluded: json["pieces_included"],
        levelsOfResistance: json["levels_of_resistance"] == null
            ? []
            : List<String>.from(json["levels_of_resistance"]!.map((x) => x)),
        lumbarSupport: json["lumbar_support"],
        toolsIncluded: json["tools_included"] == null
            ? []
            : List<String>.from(json["tools_included"]!.map((x) => x)),
        numberOfLights: json["number_of_lights"],
        lightColor: json["light_color"],
        size: json["size"],
        activeArea: json["active_area"],
        penPressureLevels: json["pen_pressure_levels"],
        brightness: json["brightness"],
        attachments: json["attachments"] == null
            ? []
            : List<String>.from(json["attachments"]!.map((x) => x)),
        adjustableLength: json["adjustable_length"],
        compatibleDevices: json["compatible_devices"] == null
            ? []
            : List<String>.from(json["compatible_devices"]!.map((x) => x)),
        colorOptions: json["color_options"] == null
            ? []
            : List<String>.from(json["color_options"]!.map((x) => x)),
        wirelessChargingStandard: json["wireless_charging_standard"],
        componentsIncluded: json["components_included"] == null
            ? []
            : List<String>.from(json["components_included"]!.map((x) => x)),
        activitiesTracked: json["activities_tracked"] == null
            ? []
            : List<String>.from(json["activities_tracked"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "rating": rating,
        "brand": brand,
        "color": color,
        "connectivity": connectivity,
        "wireless": wireless,
        "compatibility": compatibility,
        "weight": weight,
        "resolution": resolution,
        "sensor": sensor,
        "screen_size": screenSize,
        "storage": storage,
        "ram": ram,
        "display": display,
        "heart_rate_monitor": heartRateMonitor,
        "waterproof": waterproof,
        "games_included": gamesIncluded,
        "output_power": outputPower,
        "suction_power": suctionPower,
        "battery_life": batteryLife,
        "mapping_technology": mappingTechnology,
        "storage_capacity": storageCapacity,
        "interface": fakeProductsModelInterface,
        "max_speed": maxSpeed,
        "range": range,
        "weight_capacity": weightCapacity,
        "power": power,
        "speeds": speeds,
        "dpi_range": dpiRange,
        "buttons": buttons,
        "incline_levels": inclineLevels,
        "foldable": foldable,
        "voice_control": voiceControl,
        "capacity": capacity,
        "solar_panel_power": solarPanelPower,
        "material": material,
        "thickness": thickness,
        "brushing_modes": brushingModes == null
            ? []
            : List<dynamic>.from(brushingModes!.map((x) => x)),
        "timer": timer,
        "plants_included": plantsIncluded == null
            ? []
            : List<dynamic>.from(plantsIncluded!.map((x) => x)),
        "pot_material": potMaterial,
        "pot_color": potColor,
        "video_resolution": videoResolution,
        "field_of_view": fieldOfView,
        "adjustable_height": adjustableHeight,
        "max_height": maxHeight,
        "cooking_modes": cookingModes == null
            ? []
            : List<dynamic>.from(cookingModes!.map((x) => x)),
        "number_of_cameras": numberOfCameras,
        "night_vision": nightVision,
        "pieces_included": piecesIncluded,
        "levels_of_resistance": levelsOfResistance == null
            ? []
            : List<dynamic>.from(levelsOfResistance!.map((x) => x)),
        "lumbar_support": lumbarSupport,
        "tools_included": toolsIncluded == null
            ? []
            : List<dynamic>.from(toolsIncluded!.map((x) => x)),
        "number_of_lights": numberOfLights,
        "light_color": lightColor,
        "size": size,
        "active_area": activeArea,
        "pen_pressure_levels": penPressureLevels,
        "brightness": brightness,
        "attachments": attachments == null
            ? []
            : List<dynamic>.from(attachments!.map((x) => x)),
        "adjustable_length": adjustableLength,
        "compatible_devices": compatibleDevices == null
            ? []
            : List<dynamic>.from(compatibleDevices!.map((x) => x)),
        "color_options": colorOptions == null
            ? []
            : List<dynamic>.from(colorOptions!.map((x) => x)),
        "wireless_charging_standard": wirelessChargingStandard,
        "components_included": componentsIncluded == null
            ? []
            : List<dynamic>.from(componentsIncluded!.map((x) => x)),
        "activities_tracked": activitiesTracked == null
            ? []
            : List<dynamic>.from(activitiesTracked!.map((x) => x)),
      };
}
