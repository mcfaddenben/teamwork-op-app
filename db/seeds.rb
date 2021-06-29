Membership.create!([
  {user_id: 2, team_id: 1, primary_role: "mid", seecondary_role: "adc", fill: true, assigned_role: "mid"},
  {user_id: 3, team_id: 1, primary_role: "adc", seecondary_role: "supp", fill: true, assigned_role: "adc"},
  {user_id: 4, team_id: 1, primary_role: "top", seecondary_role: "jung", fill: true, assigned_role: "top"},
  {user_id: 5, team_id: 1, primary_role: "jung", seecondary_role: "top", fill: false, assigned_role: "jung"},
  {user_id: 6, team_id: 1, primary_role: "supp", seecondary_role: "adc", fill: true, assigned_role: "supp"}
])
Team.create!([
  {name: "inters", private: true, about: "likely inting", user_id: 2},
  {name: "not inters", private: false, about: "definitely not inting", user_id: 6},
  {name: "high flyers", private: true, about: "playing while high", user_id: 4}
])
User.create!([
  {summoner_name: "chicken", email: "chicken@gmail.com", password_digest: "$2a$12$DLKnyiStJnOSCxk/.Q.oz.3ShQNmv10aAFIDiQoqjwFnM6z0OFukC", region: "NA", bio: "a bio"},
  {summoner_name: "duck", email: "duck@gmail.com", password_digest: "$2a$12$N/MHEkfWDUvIr4pgiRL7POZHpQO81NbxwizCTx81NLSY6s/0qM.pO", region: "NA", bio: "another bio"},
  {summoner_name: "sparrow", email: "sparrow@gmail.com", password_digest: "$2a$12$Yl0eT0bAvmLyOnTDm1ZaZ.YB4MhgiNCaRi7TkcSqg0YcuD5YjiFdS", region: "NA", bio: "another nice  bio"},
  {summoner_name: "pigeon", email: "pigeon@gmail.com", password_digest: "$2a$12$VdZiRxgSonLmQ66oo9POFe7AGmueFsWmZ0nCKwcVkHO9k/nWVGVH6", region: "NA", bio: "another fancy  bio"},
  {summoner_name: "turkey", email: "turkey@gmail.com", password_digest: "$2a$12$DzIiFRllhqqHIEK5jTmuOuXMm6B32Nt8gjVBuI6wy6vMIfck2WPg6", region: "NA", bio: "another fake   bio"}
])
