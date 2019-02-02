//
//  ViewController.swift
//  CaroFit
//
//  Created by labcisco on 15/11/18.
//  Copyright © 2018 labcisco. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, UISearchBarDelegate, AKPickerViewDataSource,AKPickerViewDelegate{
    let pickerData = ["","","","","","",""]
    
    
    @IBOutlet weak var pickerView: AKPickerView!
    
    func numberOfItemsInPickerView(_ pickerView: AKPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: AKPickerView, imageForItem item: Int) -> UIImage {
        return UIImage(named: "food_\(item)")!.imageWithSize(CGSize(width: 150, height: 150))
    }
    
    
    
    
    var alimentos = [Alimento]()
    var currentlyAlimentos = [Alimento]()//Tablaactualizadades
    var searchedAlimentos = [Alimento]()//TablaBusqueda
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.dataSource = self
        pickerView.delegate = self
        pickerView.dataSource = self
        setUpFood()
        currentlyAlimentos = alimentos.filter({ alimento -> Bool in
            alimento.tipo.lowercased().hasPrefix("cereal")
        })
        currentlyAlimentos = currentlyAlimentos.sorted(by: { $0.nombre < $1.nombre})
        setUpSearchBar()

        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background_food")?.draw(in: self.view.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image ?? UIColor.white as! UIImage)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func setUpFood() {
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Amaranto tostado",porcion:"1/4 tz",peso:"16 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Arroz cocido",porcion:"1/4 tz",peso:"47 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Arroz inflado natural",porcion:"1/2 tz",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Arroz crudo",porcion:"20 gramos",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Avena cocida en agua",porcion:"1/2 tz",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Avena en hojuelas cruda",porcion:"1/4 tz",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Camote cocido",porcion:"1/3 tz",peso:"70 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Cuscus cocido",porcion:"1/3 tz",peso:"50 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Elote blanco cocido",porcion:"1/2 tz",peso:"82 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Espaguetti integral cocido",porcion:"1/3 tz",peso:"46 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Elote amarillo enlatado",porcion:"1/3 tz",peso:"82 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Galleta habanera",porcion:"4 pz",peso:"18 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Galleta saladita",porcion:"3 pz",peso:"16 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Granola sin azúcar",porcion:"3 C",peso:"18 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Harina de arroz",porcion:"2 C",peso:"18 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Harina de amaranto",porcion:"2 C",peso:"19 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Harina de avena",porcion:"1/5 tz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Harina de papa",porcion:"2 C",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Harina de trigo integral",porcion:"2 1/2 C",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Harina de maíz nixtamalizada",porcion:"2 1/2 C",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Galletas maria",porcion:"3 pz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Masa de maíz blanco",porcion:"45 gr",peso:"45 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Maíz pozolero cocido",porcion:"1/3 tz",peso:"54 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Maíz blanco cocido",porcion:"25 gr",peso:"25 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Maicena",porcion:"2 C",peso:"16 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Nixtamal crudo",porcion:"45 gr",peso:"45 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Nixtamal cocido",porcion:"90 gr",peso:"90 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Palomitas infladas sin grasa",porcion:"2 tz",peso:"15 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan bagel integral",porcion:"1/3 tz",peso:"25 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan birote",porcion:"1/3 tz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan tostado",porcion:"1 pz",peso:"25 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan árabe",porcion:"1/2 pz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan centeno",porcion:"3/4 pz",peso:"25 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan integral Bimbo",porcion:"1 pz ",peso:"25 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"´Pan cero cero Bimbo",porcion:"1 pz",peso:"25 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan Ezequiel",porcion:"1 pz ",peso:"34 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan pita taquero",porcion:"1/2 tz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan pita integral Castaño",porcion:"3/4 pz",peso:"30 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan pita Libanius",porcion:"1/2 pz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan Thins",porcion:"1 1/2 pz",peso:"30 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan multigrain Oroweat",porcion:"3/4 pz",peso:"30 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Papa cocida",porcion:"1/2 pz",peso:"70 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pasta cruda",porcion:"20 gr",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Pasta cocida",porcion:"1/3 tz",peso:"50 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Puré de camote natural",porcion:"1/4 tz",peso:"60 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Quinoa cocida",porcion:"1/2 tz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Rice cake",porcion:"2 pz",peso:"15 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Salmas Sanissimo",porcion:"3 pz",peso:"18 gr"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Salvado de maíz",porcion:"6 C",peso:"30 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Salvado de trigo",porcion:"6 C",peso:"30 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tapioca",porcion:"1/4 tz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortilla maíz",porcion:"1 pz",peso:"20 gr"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortillas delgaditas Torti-regias",porcion:"3 pz ",peso:"33 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortillas nopal Azteca",porcion:"1 pz",peso:"22 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortillas de avena integral",porcion:"2 pz",peso:"-"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortillas artesanales AVESANAS",porcion:"2 pz",peso:"-"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortillas Tomatillas",porcion:"2 pz",peso:"-"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortillas de Amaranto Rafita",porcion:"1 ½ pz",peso:"28 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortilla nopal Susalia",porcion:"3 pz",peso:"66 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortilla nopal Nopalia",porcion:"2 pz",peso:"25 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tostada nopal Sr. Cactus",porcion:"3 pz",peso:"36 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortilla Sr. Cactus",porcion:"1 pz",peso:"25 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tostada de maíz y nopal Nopalia",porcion:"1 pz",peso:"11 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tostada nopal Susalia",porcion:"3 pz",peso:"30 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Tostada horneada Sanissimo",porcion:"1 pz",peso:"12 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Totopos horneados Nopalia",porcion:"18 pz",peso:"22 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Totopos horneados Susalia",porcion:"24 pz",peso:"50 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Yuca",porcion:"1/4 pz",peso:"88 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Arepa integral",porcion:"1/4 pz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Choclo cocido",porcion:"1/2 tz",peso:"50 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Galletas de maíz inflado",porcion:"2 pz",peso:"15 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Fideos de arroz secos",porcion:"20 gr",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Fideos de arroz cocido",porcion:"1/3 tz",peso:"60 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Fideos cocidos",porcion:"1/3 tz",peso:"60 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Galletas de soda",porcion:"6 pz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Galletas de arroz inflado",porcion:"2 pz",peso:"15 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Galletas Gullon",porcion:"3 pz",peso:"20 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Kasha",porcion:"1/4 tz",peso:"22 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Maíz inflado",porcion:"1/2 tz",peso:"18 gramos"))
            alimentos.append(Alimento(tipo:"Cereal",nombre:"Mijo cocido",porcion:"1/3 tz",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Muesli",porcion:"3 C",peso:"18 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan Funchs multigrano light",porcion:"1 pz",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan pita ideal integral light",porcion:"1 pz",peso:"38 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan molde integral light Castaño",porcion:"2 pz",peso:"45 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Granola Nutrisa",porcion:"3 C",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan marraqueta",porcion:"1/4 pz",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan molde ideal light",porcion:"2 pz",peso:"45 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan molde ideal",porcion:"1 pz",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan árabe integral",porcion:"1/2 pz",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Patata",porcion:"100 gr",peso:"100 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Trigo cocido",porcion:"1/3 tz",peso:"80 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Churritos de nopal",porcion:"25 gr",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Galletas tika",porcion:"4 pz",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Jicas horneadas",porcion:"1 paquete ",peso:"-"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"TARO chips",porcion:"1 paquete",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"ZANAZ chips",porcion:"1/2 paquete",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"CAMOS chips",porcion:"1/3 paquete",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Banana chips vitali",porcion:"25 gr",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Churros de amaranto vitali",porcion:"22 gr",peso:"22 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Churros de amaranto con limón y sal vitali",porcion:"22 gr ",peso:"22 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pita Crisp Libanius",porcion:"22 gr",peso:"22 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Totopos horneados Sanissimo",porcion:"7 pz",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Galletas de ajonjolí Breton",porcion:"3 pz ",peso:"14 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pita chips Town House",porcion:"5 pz",peso:"12 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Pan de centeno",porcion:"1 pz",peso:"24 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Galletas de nopal horneadas Nopalia",porcion:"4 pz ",peso:"22 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Churritos de nopal Nopalia",porcion:"20 gr ",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Crisps Susalia",porcion:"9 pz",peso:"54 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Susalitas enchiladas Susalia",porcion:"25 gr",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Churrinopal Susalia",porcion:"25 gr",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortillas PanchoVilla",porcion:"1 pz",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortillas Rapiditas",porcion:"1 pz ",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Tostadas Noglut Santiveri",porcion:"3 pz",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Obleas Amarea",porcion:"1 paquete ",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Ligeritas de maíz",porcion:"6 pz",peso:"18 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Tortillas de nopal y linaza Nopalia",porcion:"2 pz",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Papel de arroz",porcion:"2 pz",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Horneadas baked tostadas Guerrero",porcion:"1 1/2 pz",peso:"18 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Joseph's Lavash bread",porcion:"3/4 tz",peso:"48 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Chips de camote Cerzana",porcion:"1 paquete",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Chips de betabel Cerzana",porcion:"1 paquete ",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Chips de jicama Cerzana",porcion:"1 paquete ",peso:"55 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Chips de Taro Cerzana",porcion:"1 paquete",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Cereal",nombre:"Granola sin azúcar En Linea",porcion:"3 C",peso:"30 gramos"))
        
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Alubia cocida",porcion:"1/2 tz",peso:"90 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Chícharo cocido",porcion:"1/2 tz",peso:"100 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Ejotes",porcion:"1 1/2 tz",peso:"300 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Edamames",porcion:"3/4 tz",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Frijoles naturales aplastados",porcion:"1/3 tz",peso:"75 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Frijol entero cocido",porcion:"1/2 tz",peso:"85 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Garbanzo cocido",porcion:"1/2 tz",peso:"85 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Haba cruda",porcion:"1/4 tz",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Haba cocida",porcion:"1/2 tz",peso:"85 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Hummus",porcion:"5 C",peso:"75 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Lenteja cocida",porcion:"1/2 tz",peso:"100 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Proteína de soya",porcion:"20 gr",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Soya texturizada",porcion:"30 gr",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Soya cocida",porcion:"1/3 tz",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Harina de garbanzo",porcion:"25 gr",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Porotos enteros cocidos",porcion:"1/2 tz",peso:"85 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Tempeh",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Leguminosa",nombre:"Judías verdes",porcion:"1 1/2 tz",peso:"300 gramos"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Acelga",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Ajo",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Alcachofas",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Alfalfa",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Apio",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Berenjena",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Brócoli",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Calabazaitaliana",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Calabaza de Castilla",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Cebollín",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Cebolla",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Champiñon",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Chayote",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Cilantro",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Chile",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Chile habanero",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Chile jalapeño",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Chile poblano",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Chile de árbol",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Cilantro",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Col de bruselas",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Col rizada",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Coliflor",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Escarola",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Espinacas",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Espárragos",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Germinado de alfalfa",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Hinojo",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Jitomate",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Jícama",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Kale",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Lechuga orejona",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Lechuga romana",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Limón",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Nopal",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Palmito",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Pepinillos",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Puerros",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Pimiento morrón",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Repollo",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Rúcula",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Romeritos",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Rábano",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Setas",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Tomatito cherry",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Tomate",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Verdolagas",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Zanahoria",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Verdura",nombre:"Zapallito italiano",porcion:"Libre",peso:"-"))
        
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Agua de coco",porcion:"1 1/2 tz",peso:"360 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Arándanos deshidratados",porcion:"1/5 tz",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Arándanos frescos",porcion:"1 tz",peso:"110 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Cereza fresca",porcion:"20 pz",peso:"88 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Chabacano",porcion:"4 pz",peso:"130 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Chirimoya",porcion:"1/3 tz",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Ciruela morada",porcion:"3 pz",peso:"150 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Ciruela pasa deshuesada",porcion:"3 pz",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Ciruelitas rojas",porcion:"7 pz",peso:"75 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Ciruelitas amarillas",porcion:"7 pz",peso:"75 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Durazno amarillo",porcion:"2 pz",peso:"150 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Dátil",porcion:"3 pz",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Frambuesa",porcion:"1 tz",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Fresa",porcion:"1 tz",peso:"200 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Granada china",porcion:"2 pz",peso:"68 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Granada roja",porcion:"1 tz",peso:"88 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Guanábana",porcion:"1 pz",peso:"230 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Guayaba",porcion:"3 pz",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Higo",porcion:"2 pz",peso:"70 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Kiwi",porcion:"2 pz",peso:"110 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Lichis",porcion:"1 tz",peso:"90 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Mamey",porcion:"1/3 pz",peso:"85 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Mandarina",porcion:"2 pz",peso:"130 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Mango",porcion:"3/4 pz",peso:"140 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Manzana roja",porcion:"1 pz",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Manzana verde",porcion:"1 pz",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Maracuyá",porcion:"3 pz",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Melón",porcion:"3/4 pz",peso:"140 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Naranja",porcion:"1 pz",peso:"160 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Nectarina",porcion:"3/4 pz",peso:"140 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Níspero",porcion:"8 pz",peso:"140 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Papaya",porcion:"1 tz",peso:"140 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Pasitas secas",porcion:"10 pz",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Pera",porcion:"1 pz",peso:"80 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Perón",porcion:"1 pz",peso:"100 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Piña",porcion:"3/4 tz",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Plátano dominico",porcion:"3 pz",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Plátano macho",porcion:"1/4 pz",peso:"50 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Pulpa de tamarindo",porcion:"8 C",peso:"100 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Sandía",porcion:"1 tz",peso:"160 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Tangerina",porcion:"2 pz",peso:"130 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Toronja",porcion:"1 pz",peso:"160 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Tuna",porcion:"2 pz",peso:"130 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Uva con semilla",porcion:"1 tz",peso:"114 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Uva sin semilla",porcion:"1 tz",peso:"90 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Zapote negro",porcion:"1/2 tz",peso:"90 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Zarzamora",porcion:"1 tz",peso:"140 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Banana",porcion:"1/2 pz",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Banano",porcion:"1/2 tz",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Ananá",porcion:"3/4 tz",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Caquis",porcion:"1 pz",peso:"100 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Moras",porcion:"1 tz",peso:"140 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Membrillo",porcion:"1/2 pz",peso:"100 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Pitahaya Sonorense",porcion:"3 pz",peso:"110 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Pitahaya",porcion:"1 pz",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Pomelo",porcion:"1 pz",peso:"160 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Tamarindo",porcion:"50 gr",peso:"50 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Uchuva",porcion:"8 pz",peso:"120 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Mermelada de fresa natural",porcion:"2 C",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Mermelada de zarzamora natural",porcion:"2 C",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Mermelada de frambuesa natural",porcion:"2 C",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Mermelada de durazno natural",porcion:"2 C",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Crudo",porcion:"1 pz",peso:"160 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Clementina",porcion:"1 pz",peso:"130 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Damascos",porcion:"2 pz",peso:"150 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Frutilla",porcion:"1 tz",peso:"200 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Huesillos",porcion:"3 tz",peso:"24 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Lechosa",porcion:"1 tz",peso:"140 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Lima",porcion:"3 pz",peso:"140 gramos"))
        alimentos.append(Alimento(tipo:"Fruta",nombre:"Lúcuma",porcion:"1 pz",peso:"60 gramos"))
        
        alimentos.append(Alimento(tipo:"Otros",nombre:"Agua natural",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Agua mineral",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Arroz de coliflor",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Café americano",porcion:"2 tazas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Caldo natural de camarón",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Caldo natural de pollo",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Caldo natural de res desgrasado",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Caldo natural de vegetales",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Canela en polvo",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Chicles sin azúcar",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Chile en polvo bajo en sodio",porcion:"2 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Cacao en polvo sin azúcar, amargo",porcion:"2 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Curry",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Espaguetti de calabacin",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Especias",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Gelatina light",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Hierbas de olor",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Jamaica sin azúcar",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Leche de almendras o coco sin azúcar",porcion:"2 tazas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Licuado de verduras",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Limón",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Limonada sin azúcar",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Miel maple jarabe sin azúcar",porcion:"3 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Mostaza",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Orégano",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Pimienta",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Puré de coliflor",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Salsa picante",porcion:"3 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Salsa inglesa",porcion:"2 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Salsa Tabasco",porcion:"3 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Splenda",porcion:"2 sobres al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Stevia 100% natural",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Té natural sin azúcar",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Vainilla",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Verduras",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Vinagre de arroz",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Vinagre balsámico",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Vinagre de manzana",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Vinagre",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Hershey’s chocolate sugar free syrup",porcion:"3 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Don’t worry merengues",porcion:"5 piezas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Halo top ice cream",porcion:"1/4 taza al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Dulce de leche 0% azúcar En Linea",porcion:"1 cucharada al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Cajeta quemada sin azúcar Tillot",porcion:"1 cucharada al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Whipped cream sugar free",porcion:"2 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Hot sauce Siete Foods",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Helado Holanda sin azúcar",porcion:"100 ml",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Monk endulzante natural",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Paletas de hielo Holistik",porcion:"1 pieza al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Chipotle en salsa",porcion:"3 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Aderezos del molino Finas hierbas",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Aderezos del molino Chipotle Ranch",porcion:"2 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Aderezos del molino Mostaza bajo en calorias",porcion:"3 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Aderezos del molino Cilantro bajo en calorias",porcion:"3 cucharadas al día máximo",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Aderezos del molino italiano sin grasa",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Aderezos del molino cilantro sin grasa",porcion:"Libre",peso:"-"))
        alimentos.append(Alimento(tipo:"Otros",nombre:"Tagatosa",porcion:"Libre",peso:"-"))
        
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Aceite para cocina",porcion:"1 c",peso:"5 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Aceite de girasol",porcion:"1 c",peso:"5 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Aceite de canola",porcion:"1 c",peso:"5 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Aceite de oliva",porcion:"1 c",peso:"5 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Aceite pam en spray",porcion:"4 sprays",peso:"5 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Aceitunas  verde o negra",porcion:"5 pz",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Aguacate",porcion:"1/4 pz",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Ajonjolí",porcion:"4 c",peso:"10 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Almendra",porcion:"10 pz",peso:"12 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Almendra fileteada",porcion:"2 C",peso:"12 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Avellana",porcion:"10 pz",peso:"12 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Castañas",porcion:"10 pz",peso:"12 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Cacahuate natural",porcion:"14 pz",peso:"12 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Cacao nibs",porcion:"20 gr",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Chía",porcion:"3 c",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Chocolate Turín sin azúcar",porcion:"1 pz",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Chocolate Carlos V sin azúcar",porcion:"1 pz",peso:"15 gramos "))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Chocolate Larín sin azúcar",porcion:"1 pz",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Coco fresco",porcion:"12 gr",peso:"12 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Coco rallado natural",porcion:"1 1/2 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Crema de almendras natural sin azúcar",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Crema de maní natural sin azúcar",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Crema de avellanas natural sin azúcar",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Linaza",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Maní",porcion:"14 pz",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Nuez brasileña",porcion:"4 pz",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Nuez",porcion:"3 pz ",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Nueces mixtas",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Nuez de la india",porcion:"6 pz",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Palta",porcion:"1/4 pz",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"´Pepitas tostadas",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Piñon",porcion:"1 c",peso:"5 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Pistaches",porcion:"18 px",peso:"5 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Semillas de girasol",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Mantequilla de cajú",porcion:"1 C",peso:"5 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Semillas de calabaza",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Semillas de cártamo",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Semillas de sésamo",porcion:"1 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Tahini, pasta de sésamo",porcion:"2 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Guacamole",porcion:"2 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Mazapan sin azúcar de la Rosa",porcion:"1 pz",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Harina de almendras",porcion:"11 gr",peso:"11 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Pesto",porcion:"2 C",peso:"15 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Chocolate En Linea sin azúcar 85% CACAO",porcion:"18 gr",peso:"18 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Choco ZERO sin azúcar",porcion:"18 gr",peso:"18 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Semillas de hemp",porcion:"2 c",peso:"11 gramos"))
        alimentos.append(Alimento(tipo:"Grasa",nombre:"Semillas de cañamo",porcion:"2 c",peso:"11 gramos"))

        alimentos.append(Alimento(tipo:"Proteina",nombre:"Abulón fresco",porcion:"50 gr",peso:"-"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Almeja fresca",porcion:"4 pz",peso:"50 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Arrachera",porcion:"30 gr",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Atún fresco",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Atún de lata en agua",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Barbacoa",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Bistec de res",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Cabrito",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Calamar",porcion:"60 gr",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Camarón seco",porcion:"10 gr",peso:"10 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Camarón cocido",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Carne cuete",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Carne molida negra",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Cecina",porcion:"25 gr",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Chamberete",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Chuleta ahumada",porcion:"25 gr",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Clara de huevo",porcion:"2 pz",peso:"-"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Claras en tetra-pack",porcion:"1/4 tz",peso:"-"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Cuete de res",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Falda de res",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Filete de pescado, mojarra, merluza",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Filete de res",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Filete de sirloin",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Filete de tampiqueña",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Huevo entero",porcion:"1 pz",peso:".-"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Jaiba cocida entera",porcion:"60 gr",peso:"60 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Jocoque",porcion:"30 gr",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Lomo de cerdo",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Machaca",porcion:"1 C",peso:"-"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Marlin",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Milanesa de pollo/res",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Ostión",porcion:"70 gr",peso:"70 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Pechuga de pavo ahumada",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Pechuga de pavo",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Pechuga de pollo ahumada",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Pechuga de pollo sin piel",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Pulpo crudo",porcion:"45 gr",peso:"45 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Pulpo cocido",porcion:"30 gr",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Queso COLUN light",porcion:"22 gr",peso:"22 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Queso Cottage light",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Queso de cabra",porcion:"20 gr",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Queso feta",porcion:"20 gr",peso:"20 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Queso mozzarella cero grasa",porcion:"30 gr",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Queso Oaxaca light",porcion:"30 gr",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Queso panela",porcion:"30 gr",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Requesón/ricotta",porcion:"30 gr",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Salmón ahumado",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Salmón fresco",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Sardinas enlatadas",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Surimi",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Tampiqueña",porcion:"30 gr",peso:"30 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Ternera",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Yogurt light sin azúcar",porcion:"1/2 tz",peso:"-"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Yogurt griego sin azúcar",porcion:"1/2 tz",peso:"-"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Queso fresco Santa Rosa light",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Quesillo COLUN light",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Ave de pato",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Ave de pavo",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Ave de pollo",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Tofu",porcion:"80 gr",peso:"80 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Veneras",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Cangrejo",porcion:"2 pz",peso:"-"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Carne de res deshidratada",porcion:"25 gr",peso:"25 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Carne molida tártaro",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Cerdo magro",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Cerdo pulpa",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Ceviche fresco mixto",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Chuleta de cordero",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Merluza",porcion:"85 gr",peso:"85 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Cordero pulpa",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Corvina",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Congrio",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Langosta",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Lomo sin cordón de vacuna",porcion:"40 gr",peso:"40 gramos"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Ostras frescas",porcion:"4 pz",peso:"-"))
        alimentos.append(Alimento(tipo:"Proteina",nombre:"Levadura nutricional",porcion:"15 gr",peso:"15 gramos"))
        
        currentlyAlimentos = alimentos
    }
    
    func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentlyAlimentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else{
            return UITableViewCell()
        }
        cell.nombre.text = currentlyAlimentos[indexPath.row].nombre
        cell.porcion.text = currentlyAlimentos[indexPath.row].porcion
        cell.peso.text = currentlyAlimentos[indexPath.row].peso
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentlyAlimentos = searchedAlimentos
            table.reloadData()
            return
        }
        currentlyAlimentos = searchedAlimentos.filter({ alimento -> Bool in
            alimento.nombre.lowercased().hasPrefix(searchText.lowercased())
        })
        table.reloadData()
    }

    
    func pickerView(_ pickerView: AKPickerView, didSelectItem item: Int) {
        switch item {
        case 0:
            currentlyAlimentos = alimentos.filter({ alimento -> Bool in
                alimento.tipo.lowercased().hasPrefix("cereal")
            })
        case 1:
            currentlyAlimentos = alimentos.filter({ alimento -> Bool in
                alimento.tipo.lowercased().hasPrefix("proteina")
            })
        case 2:
            currentlyAlimentos = alimentos.filter({ alimento -> Bool in
                alimento.tipo.lowercased().hasPrefix("fruta")
            })
        case 3:
            currentlyAlimentos = alimentos.filter({ alimento -> Bool in
                alimento.tipo.lowercased().hasPrefix("otros")
            })
        case 4:
            currentlyAlimentos = alimentos.filter({ alimento -> Bool in
                alimento.tipo.lowercased().hasPrefix("verdura")
            })
        case 5:
            currentlyAlimentos = alimentos.filter({ alimento -> Bool in
                alimento.tipo.lowercased().hasPrefix("grasa")
            })
        case 6:
            currentlyAlimentos = alimentos.filter({ alimento -> Bool in
                alimento.tipo.lowercased().hasPrefix("leguminosa")
            })
        default:
            currentlyAlimentos = alimentos
        }
        currentlyAlimentos = currentlyAlimentos.sorted(by: { $0.nombre < $1.nombre})
        searchedAlimentos = currentlyAlimentos
        table.reloadData()
    }
    
    
}


class Alimento{
    
    let tipo:String
    let nombre:String
    let porcion:String
    let peso:String
    
    init(tipo:String,nombre:String, porcion:String, peso:String) {
        self.tipo = tipo
        self.nombre = nombre
        self.porcion = porcion
        self.peso = peso
    }
    
}
