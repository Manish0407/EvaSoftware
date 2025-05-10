# require 'csv'

# csv_text = File.read(Rails.root.join('lib','seeds','file_name.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')


  owner = AdminUser.where(email: 'admin@example.com').first_or_initialize.tap do |user|
   	user.full_name = 'Virat kohli'
    user.role = 'admin'
    user.password = '123456'
    user.password_confirmation = '123456'
    user.save
  end

  AdminUser.where(email: 'super_admin@example.com').first_or_initialize.tap do |user|
    user.full_name = 'Rohit sharma'
    user.role = 'super_admin'
    user.password = '123456'
    user.password_confirmation = '123456'
    user.save
  end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


raw_materials = [
  { rm_code: "SC 60WSI RF-2.5", item_name: "RI-18MM X 34MM X 5MM",currency: "₹", default_price_rate: 89.60, unit: "Mtr" },
  { rm_code: "SC 60TM RF-1.0", item_name: "RI-18MM X 30MM",currency: "₹", default_price_rate: 52.44, unit: "Mtr" },
  { rm_code: "SC 60TM RF-1.2", item_name: "RI-18MM X 30MM",currency: "₹", default_price_rate: 61.56, unit: "Mtr" },
  { rm_code: "SC 60TM RF-1.5", item_name: "RI-18MM X 30MM",currency: "₹", default_price_rate: 75.24, unit: "Mtr" },
  { rm_code: "SC 60TM RF-2.0", item_name: "RI-18MM X 30MM",currency: "₹", default_price_rate: 95.76, unit: "Mtr" },
  { rm_code: "SC 60TM RF-2.5", item_name: "RI-18MM X 30MM",currency: "₹", default_price_rate: 113.24, unit: "Mtr" },
  { rm_code: "SC 60DSI RF-1.0", item_name: "RI-34MM X 49MM X 48MM X 5MM", currency: "₹", default_price_rate: 77.52, unit: "Mtr" },
  { rm_code: "SC 60DSI RF-1.2", item_name: "RI-34MM X 49MM X 48MM X 5MM", currency: "₹", default_price_rate: 92.72, unit: "Mtr" },
  { rm_code: "SC 60DSI RF-1.5", item_name: "RI-34MM X 49MM X 48MM X 5MM", currency: "₹", default_price_rate: 114.00, unit: "Mtr" },
  { rm_code: "SC 60DSI RF-2.0", item_name: "RI-34MM X 49MM X 48MM X 5MM", currency: "₹", default_price_rate: 148.20, unit: "Mtr" },
  { rm_code: "SC 60DSI RF-2.5", item_name: "RI-34MM X 49MM X 48MM X 5MM", currency: "₹", default_price_rate: 180.12, unit: "Mtr" },
  { rm_code: "SC 60WSI RF-1.2", item_name: "RI-18MM X 34MM X 5MM", currency: "₹", default_price_rate: 48.64, unit: "Mtr" },
  { rm_code: "SC 60BF RF-1.0", item_name: "RI-27MM X 22MM",currency: "₹", default_price_rate: 53.96, unit: "Mtr" },
  { rm_code: "SC 60BF RF-1.5", item_name: "RI-27MM X 22MM",currency: "₹", default_price_rate: 76.76, unit: "Mtr" },
  { rm_code: "SC 60BF RF-2.0", item_name: "RI-27MM X 22MM",currency: "₹", default_price_rate: 98.04, unit: "Mtr" },
  { rm_code: "SC 60BF RF-2.5", item_name: "RI-27MM X 22MM",currency: "₹", default_price_rate: 116.28, unit: "Mtr" },
  { rm_code: "SC 60WSO RF-1.0", item_name: "RI-24MM X 34MM X 23MM X 5MM", currency: "₹", default_price_rate: 47.88, unit: "Mtr" },
  { rm_code: "SC 60WSO RF-1.2", item_name: "RI-24MM X 34MM X 23MM X 5MM", currency: "₹", default_price_rate: 56.24, unit: "Mtr" },
  { rm_code: "SC 60WSO RF-1.5", item_name: "RI-24MM X 34MM X 23MM X 5MM", currency: "₹", default_price_rate: 69.18, unit: "Mtr" },
  { rm_code: "SC 60WSO RF-2.0", item_name: "RI-24MM X 34MM X 23MM X 5MM", currency: "₹", default_price_rate: 88.16, unit: "Mtr" },
]

raw_materials.each do |raw_material|
  ReinforcementPrice.create!(raw_material)
end



# db/seeds.rb

hardware_prices_data = [
  { rm_code: "UPVC-HW-ORISC", item_name: "CMT OUTER RI SCREW", weight_per_unit: 0.000, currency: "₹", default_price_rate: 0.40, unit: "Pcs", brand_name: "UPVC HW" },
  { rm_code: "UPVC-HW-SRS", item_name: "CMT SHUTTER RI SCREW", weight_per_unit: 0.000, currency: "₹", default_price_rate: 0.40, unit: "Pcs", brand_name: "UPVC HW" },
  { rm_code: "UPVC-HW-MRISCREW", item_name: "CMT MULLION RI SCREWS", weight_per_unit: 0.000, currency: "₹", default_price_rate: 0.40, unit: "Pcs", brand_name: "UPVC HW" },
  { rm_code: "UPVC-HW-FMC", item_name: "FLY MULLION CAP", weight_per_unit: 0.000, currency: "₹", default_price_rate: 5.00, unit: "Pcs", brand_name: "UPVC HW" },
  { rm_code: "UPVC-HW-OUTERGKT", item_name: "GLAZING GASKET OUTER", weight_per_unit: 0.000, currency: "₹", default_price_rate: 12.00, unit: "Mtr", brand_name: "UPVC HW" },
  { rm_code: "UPVC-HW-GP1MM", item_name: "GLASS PACKER 1MM", weight_per_unit: 0.000, currency: "₹", default_price_rate: 0.60, unit: "Pcs", brand_name: "UPVC HW" },
  { rm_code: "UPVC-HW-CDE400", item_name: "CASEMENT 30MM BS ESPAG 400", weight_per_unit: 0.000, currency: "₹", default_price_rate: 0.00, unit: "Pcs", brand_name: "UPVC HW" },
  { rm_code: "UPVC-HW-SCEHKEY", item_name: "ESPAG HANDLE WITH KEY", weight_per_unit: nil, currency: "₹", default_price_rate: 208.00, unit: "Pcs", brand_name: "UPVC HW" },
  { rm_code: "UPVC-HW-CDECYL1600", item_name: "CASEMENT DOOR ESPAG WITH CYLINDER 1600", weight_per_unit: 0.000, currency: "₹", default_price_rate: 425.00, unit: "Pcs", brand_name: "UPVC HW" },
  { rm_code: "UPVC-HW-2DH", item_name: "2D HINGES", weight_per_unit: 0.000, currency: "₹", default_price_rate: 175.00, unit: "Pcs", brand_name: "UPVC HW" },
  # Add other rows here
]

hardware_prices_data.each do |data|
  HardwarePrice.find_or_create_by!(rm_code: data[:rm_code]) do |price|
    price.item_name = data[:item_name]
    price.brand_name = data[:brand_name]
    price.unit = data[:unit]
    price.currency = data[:currency]
    price.default_price_rate = data[:default_price_rate]
    price.weight_per_unit = data[:weight_per_unit]
  end
end


glas = GlassItem.create([
  { enternal_code: 'SA011L', glass_code: 'SA011L', glass_thickness: 6.000, report_category: 'Glazing', glass_weight: 25.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 3500.000, basic_value_in_sqFt: 3500.000 / 10.764, total_glass_value: 3500.000, glass_name: '(5+1.52+5)11.52mm LAM. (SC45)', glass_alias: '(5+1.52+5)11.52mm LAM. (SC45)', status: true },
  { enternal_code: '10 mm Clear Toughened', glass_code: '10 mm Clear Toughened', glass_thickness: 12.000, report_category: 'Glazing', glass_weight: 25.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 1630.000, basic_value_in_sqFt: 1630.000 / 10.764, total_glass_value: 1630.000, glass_name: '10 mm Clear Toughened', glass_alias: '10 mm Clear Toughened', status: true },
  { enternal_code: '10 mm reflective toughened', glass_code: '10 mm reflective toughened', glass_thickness: 12.000, report_category: 'Glazing', glass_weight: 25.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 1800.000, basic_value_in_sqFt: 1800.000 / 10.764, total_glass_value: 1800.000, glass_name: '10 mm reflective toughened', glass_alias: '10 mm reflective toughened', status: true },
  { enternal_code: '12MMTG', glass_code: '12MMTG', glass_thickness: 12.000, report_category: 'Glazing', glass_weight: 30.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 1950.000, basic_value_in_sqFt: 1950.000 / 10.764, total_glass_value: 1950.000, glass_name: '12 MM TOUGHNED GLASS', glass_alias: '12 MM TOUGHNED GLASS', status: true },
  { enternal_code: '18 mm Clear DGU Tough', glass_code: '18 mm DGU Clear Tough', glass_thickness: 18.000, report_category: 'Glazing', glass_weight: 25.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 3000.000, basic_value_in_sqFt: 3000.000 / 10.764, total_glass_value: 3000.000, glass_name: '18 mm DGU Clear Tough', glass_alias: '18 mm DGU Clear Toughened Glass', status: true },
  { enternal_code: '20MMDG', glass_code: '20MMDG', glass_thickness: 20.000, report_category: 'Glazing', glass_weight: 50.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 2200.000, basic_value_in_sqFt: 2200.000 / 10.764, total_glass_value: 2200.000, glass_name: '20 M DGU GLASS TOUGH', glass_alias: '20 M DGU GLASS TOUGH', status: true },
  { enternal_code: '22MMDGU', glass_code: '22MMDGU', glass_thickness: 22.000, report_category: 'Glazing', glass_weight: 50.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 2700.000, basic_value_in_sqFt: 2700.000 / 10.764, total_glass_value: 2700.000, glass_name: '22 MM DGU TOUGH GLASS', glass_alias: '22 MM DGU TOUGH GLASS', status: true },
  { enternal_code: '24MMDTG', glass_code: '24MMDTG', glass_thickness: 24.000, report_category: 'Glazing', glass_weight: 60.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 2500.000, basic_value_in_sqFt: 2500.000 / 10.764, total_glass_value: 2500.000, glass_name: '24mm DGU Toughened Glass', glass_alias: '24mm DGU Toughened Glass', status: true },
  { enternal_code: '4MMCT', glass_code: '4MMPH', glass_thickness: 5.000, report_category: 'Glazing', glass_weight: 10.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 450.000, basic_value_in_sqFt: 450.000 / 10.764, total_glass_value: 450.000, glass_name: '4mm Pin head', glass_alias: '4mm Pin head', status: true },
  { enternal_code: '5mm Blue Reflective Toughened', glass_code: '5mm Blue Reflective Toughened', glass_thickness: 6.000, report_category: 'Glazing', glass_weight: 12.000, unit: 'SQMT', glass_color: 'MILL FINISH', basic_value_in_sqmt: 1245.000, basic_value_in_sqFt: 1245.000 / 10.764, total_glass_value: 1245.000, glass_name: '5 mm Blue Reflective Toughened', glass_alias: '5 mm Blue Reflective Toughened', status: true },
  { enternal_code: '5MMCG', glass_code: '5MMCG', glass_thickness: 5.000, report_category: 'Glazing', glass_weight: 12.500, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 650.000, basic_value_in_sqFt: 650.000 / 10.764, total_glass_value: 650.000, glass_name: '5 MM CLEAR GLASS', glass_alias: '5 MM CLEAR GLASS', status: true },
  { enternal_code: '5MMCTG', glass_code: '5MMCTG', glass_thickness: 5.000, report_category: 'Glazing', glass_weight: 12.500, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 760.000, basic_value_in_sqFt: 760.000 / 10.764, total_glass_value: 760.000, glass_name: '5 MM CLEAR TOUGHENED GLASS', glass_alias: '5 MM CLEAR TOUGHENED GLASS', status: true },
  { enternal_code: '5MMFG', glass_code: '5MMFG', glass_thickness: 5.000, report_category: 'Glazing', glass_weight: 12.500, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 900.000, basic_value_in_sqFt: 900.000 / 10.764, total_glass_value: 900.000, glass_name: '5 MM FROSTED GLASS', glass_alias: '5 MM FROSTED GLASS', status: true },
  { enternal_code: '5 mm Frosted Tough', glass_code: '5 mm Frosted Tough', glass_thickness: 5.000, report_category: 'Glazing', glass_weight: 12.500, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 1023.000, basic_value_in_sqFt: 1023.000 / 10.764, total_glass_value: 1023.000, glass_name: '5 mm Frosted Tough', glass_alias: '5 mm Frosted Tough', status: true },
  { enternal_code: '5 mm ST 408', glass_code: '5 mm ST 408', glass_thickness: 5.000, report_category: 'Glazing', glass_weight: 12.500, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 1300.000, basic_value_in_sqFt: 1300.000 / 10.764, total_glass_value: 1300.000, glass_name: '5 mm ST 408 REFLECTED TOUGHNED GLASS', glass_alias: '5 mm ST 408 REFLECTED TOUGHNED GLASS', status: true },
  { enternal_code: '5mm unglazed', glass_code: '5 mm unglazed', glass_thickness: 5.000, report_category: 'Glazing', glass_weight: 0.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 0.000, basic_value_in_sqFt: 0.000, total_glass_value: 0.000, glass_name: '5 mm unglazed', glass_alias: '5 mm unglazed', status: true },
  { enternal_code: '5mm Gold reflective Toughened', glass_code: '5mm Gold reflective Toughened', glass_thickness: 5.000, report_category: 'Glazing', glass_weight: 15.000, unit: 'SQMT', glass_color: 'BROWN', basic_value_in_sqmt: 1100.000, basic_value_in_sqFt: 1100.000 / 10.764, total_glass_value: 1100.000, glass_name: '5mm Gold reflective Toughened', glass_alias: '5mm Gold reflective', status: true },
  { enternal_code: '6MMCG', glass_code: '6MMCG', glass_thickness: 6.000, report_category: 'Glazing', glass_weight: 15.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 800.000, basic_value_in_sqFt: 800.000 / 10.764, total_glass_value: 800.000, glass_name: '6 M CLEAR GLASS', glass_alias: '6 M CLEAR GLASS', status: true },
  { enternal_code: '6MMCTG', glass_code: '6MMCTG', glass_thickness: 6.000, report_category: 'Glazing', glass_weight: 15.000, unit: 'SQMT', glass_color: 'WHITE', basic_value_in_sqmt: 950.000, basic_value_in_sqFt: 950.000 / 10.764, total_glass_value: 950.000, glass_name: '6 MM CLEAR TOUGHENED GLASS', glass_alias: '6 MM CLEAR TOUGHENED GLASS', status: true }
])
