dinosaurs = [
  {
    name: "Pachycephalosaurus",
    weight: 1814,
    height: 3.1,
    image: "http://ap.lanexdev.com/user_images/Discovery/image/magazine/2015/01/Pachycephalosaurus-Isolated-dreamstime_l_21671248.png",
    dinosaur_type: "herbivor"
  }, {
    name: "Stegosaurus",
    weight: 2722,
    height: 3.4,
    image: "http://www.paleo.cc/ce/stegosaurus.gif",
    dinosaur_type: "herbivor"
  }, {
    name: "Triceratops",
    weight: 6350,
    height: 2.9,
    image: "http://images.dinosaurpictures.org/triceratops-dinossauro-herbivoro-cretaceo-miniatura-safari_MLB-F-4535322572_062013_52bf.jpg",
    dinosaur_type: "herbivor"
  }, {
    name: "Tyrannosaurus Rex",
    weight: 6350,
    height: 7,
    image: "http://vignette3.wikia.nocookie.net/jurassicpark/images/3/34/T-Rex_3.png/revision/latest?cb=20141230024946",
    dinosaur_type: "carnivor"
  }, {
    name: "Spinosaurus",
    weight: 6350,
    height: 2.4,
    image: "http://vignette1.wikia.nocookie.net/dino/images/a/aa/SpinosaurusInfobox.png/revision/latest?cb=20150720021036",
    dinosaur_type: "carnivor"
  },
  {
   name: "Iguanodon",
   weight: 2465,
   height: 12,
   image: "http://prehlife.weebly.com/uploads/2/2/0/8/22089980/490340_orig.png?432",
   dinosaur_type: "herbivor"
 }
#  {
#   name: "Velociraptor",
#   weight: 325,
#   height: 3,
#   image: "http://vignette2.wikia.nocookie.net/jurassicpark/images/1/12/Velociraptor-detail-header.png/revision/latest?cb=20150420213742",
#   dinosaur_type: "carnivor"
# },
# {
#  name: "Brachiosaurus",
#  weight: 25000,
#  height: 25,
#  image: "http://vignette1.wikia.nocookie.net/zt2downloadlibrary/images/5/5e/Brachiosaurus_%28Simba_%26_Verdant_Gregor%29.png/revision/latest?cb=20150301030200",
#  dinosaur_type: "carnivor"
# }

]

dinosaurs.each do |dinosaur|
  Dinosaur.create!(name: dinosaur[:name], weight: dinosaur[:weight], height: dinosaur[:height], image: dinosaur[:image], dinosaur_type: dinosaur[:dinosaur_type])
end
