# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
companies = Company.create([{ "code": "500114", "security_id": "TITAN", "name": "titan-company-limited" },
                            { "code": "540710", "security_id": "CAPACITE", "name": "capacite-infraprojects-ltd" },
                            { "code": "511447", "security_id": "SYLPH", "name": "sylph-technologies-ltd" },
                            { "code": "512161", "security_id": "8KMILES", "name": "8k-miles-software-services-ltd" },
                            { "code": "539807", "security_id": "INFIBEAM", "name": "infibeam-incorporation-ltd" },
                            { "code": "540704", "security_id": "MATRIMONY", "name": "matrimonycom-ltd" },
                            { "code": "539012", "security_id": "MEGRISOFT", "name": "megri-soft-ltd" },
                            { "code": "532316", "security_id": "SKUMAR", "name": "s-kumarscom-ltd" }])

market_indices = Market.create([{ "name": "Nifty 50" },
                                { "name": "BSE SmallCap" },
                                { "name": "BSE MidCap"}])


