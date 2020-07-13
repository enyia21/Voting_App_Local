john_jones =    Voter.create(user_name: "jjones", password: "dfhalk3ieon4", first_name: "John", last_name: "Jones", 
email: "jjones1@yahoo.com", drivers_license: "e500-1892-2821", street_address: "1015 Austin St.", 
city: "Oak Park", state: "Illinois", zipcode: "60301")

john_jones.ballot = Ballot.create(city: john_jones.city, state: john_jones.state)
john_jones.ballot.proposals << Proposal.create(name: "Earth Day", details: "Should we celebrate earth day")
#-------------------------------------------------------------------------------------------------------------
steve_smith50 = Voter.create(user_name: "ssmith50", password: "winning123", first_name: "Steve", last_name: "Smith", 
email: "ssmith50@yahoo.com", drivers_license: "e500-5445-9999", street_address: "1013 Lombard St.", 
city: "Oak Park", state: "Illinois", zipcode: "60302")

steve_smith50.ballot = Ballot.create(city: steve_smith50.city, state: steve_smith50.state)
steve_smith50.ballot.proposals << Proposal.create(name: "Shooters Day", details: "Should we celebrate three Point shooter on this day")
#-------------------------------------------------------------------------------------------------------------
susan_sarandon = Voter.create(user_name: "ssarandon", password: "dlkajf212", first_name: "Susan", last_name: "Sarandon", 
email: "ssarandon@yahoo.com", drivers_license: "s444-1111-2821", street_address: "1015 Ridgeland St.", 
city: "Oak Park", state: "Illinois", zipcode: "60301")

susan_sarandon.ballot = Ballot.create(city: susan_sarandon.city, state: susan_sarandon.state)
susan_sarandon.ballot.proposals << Proposal.create(name: "Actors Day", details: "Should celebrate Actors day")

#-------------------------------------------------------------------------------------------------------------
steve_smith23 = Voter.create(user_name: "ssmith23", password: "winning456", first_name: "Steve", last_name: "Smith", 
email: "ssmith23@yahoo.com", drivers_license: "e500-9999-2821", street_address: "1015 Cuomo St.", 
city: "New York", state: "New York", zipcode: "10013")

steve_smith23.ballot = Ballot.create(city: steve_smith23.city, state: steve_smith23.state)
steve_smith23.ballot.proposals << Proposal.create(name: "New York Day", details: "Should we celebrate New York day")

#-------------------------------------------------------------------------------------------------------------
jaime_summers = Voter.create(user_name: "jsummers19", password: "winning987", first_name: "Jaime", last_name: "Summers", 
email: "jsummers19@yahoo.com", drivers_license: "e500-1113-9991", street_address: "1015 Avery St.", 
city: "Silver Springs", state: "Maryland", zipcode: "20901")

jaime_summers.ballot = Ballot.create(city: jaime_summers.city, state: jaime_summers.state)
jaime_summers.ballot.proposals << Proposal.create(name: "Juneteenth Day", details: "Should we celebrate Junteenth")
#-------------------------------------------------------------------------------------------------------------

chiemela_enyia = Voter.create(user_name: "c_enyia80", password: "winning1003", first_name: "Chiemela", last_name: "Enyia", 
email: "c_enyia80@yahoo.com", drivers_license: "e500-1123-9991", street_address: "108 John St.", 
city: "Chicago", state: "Illinois", zipcode: "60321")

chiemela_enyia.ballot = Ballot.create(city: chiemela_enyia.city, state: chiemela_enyia.state)
chiemela_enyia.ballot.proposals << Proposal.create(name: "African Day", details: "Should we celebrate African day")
#-------------------------------------------------------------------------------------------------------------
shaun_carter50 = Voter.create(user_name: "scarter50", password: "winning1201", first_name: "Shaun", last_name: "Carter", 
email: "scarter50@yahoo.com", drivers_license: "e990-9992-2991", street_address: "121 Rich St.", 
city: "New York", state: "New York", zipcode: "10013")

shaun_carter50.ballot = Ballot.create(city: shaun_carter50.city, state: shaun_carter50.state)
shaun_carter50.ballot.proposals << Proposal.create(name: "S. Day", details: "Should we celebrate S. day")
#-------------------------------------------------------------------------------------------------------------
kelly_clarkson92 = Voter.create(user_name: "kclarkson92", password: "winning439", first_name: "Kelly", last_name: "Clarkson", 
email: "kclarkson92@yahoo.com", drivers_license: "e500-1892-2821", street_address: "300 Stewart Ave", 
city: "Las Vegas", state: "Nevada", zipcode: "89101")

kelly_clarkson92.ballot = Ballot.create(city: kelly_clarkson92.city, state: kelly_clarkson92.state)
kelly_clarkson92.ballot.proposals << Proposal.create(name: "Mob Day", details: "Should we celebrate mobsters day?")
#-------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------
steve_smith97 = Voter.create(user_name: "ssmith97", password: "dfhalk3ieon4", first_name: "Steve", last_name: "Smith", 
email: "ssmith97@yahoo.com", drivers_license: "s500-4545-2821", street_address: "1015 Bibe St.", 
city: "Las Vegas", state: "Nevada", zipcode: "81901")

steve_smith97.ballot = Ballot.create(city: steve_smith97.city, state: steve_smith97.state)
steve_smith97.ballot.proposals << Proposal.create(name: "Ribs Day", details: "Should we celebrate Ribs day")
#-------------------------------------------------------------------------------------------------------------
nina_simone = Voter.create(user_name: "ninasimone1", password: "dfhalk3ieon4", first_name: "Nina", last_name: "Simone", 
email: "ninasimone1@yahoo.com", drivers_license: "n500-1213-2821", street_address: "1015 Silver St.", 
city: "Urbana", state: "Illinois", zipcode: "61801")

nina_simone.ballot = Ballot.create(city: nina_simone.city, state: nina_simone.state)
nina_simone.ballot.proposals << Proposal.create(name: "Jazz Day", details: "Should we celebrate jazz day?")

#-------------------------------------------------------------------------------------------------------------
bill_burr = Voter.create(user_name: "bburr", password: "burried23", first_name: "Bill", last_name: "Burr", 
email: "burr12@yahoo.com", drivers_license: "e500-9999-2312", street_address: "1015 Division St.", 
city: "New York", state: "New York", zipcode: "10012")

bill_burr.ballot = Ballot.create(city: bill_burr.city, state: bill_burr.state)
bill_burr.ballot.proposals << Proposal.create(name: "Stupid Day", details: "Should we ban celebrations on stupid day")

#-------------------------------------------------------------------------------------------------------------
dave_chappelle = Voter.create(user_name: "dchapelle1", password: "chappelleshow", first_name: "Dave", last_name: "Chappelle", 
email: "dchappelle1@yahoo.com", drivers_license: "d478-1111-2821", street_address: "1015 MLK Dr.", 
city: "Silver Springs", state: "Maryland", zipcode: "20902")

dave_chappelle.ballot = Ballot.create(city: dave_chappelle.city, state: dave_chappelle.state)
dave_chappelle.ballot.proposals << Proposal.create(name: "Dave Day", details: "Should Sake D weave Day a national holiday!")
#-------------------------------------------------------------------------------------------------------------