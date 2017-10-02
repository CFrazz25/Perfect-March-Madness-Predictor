def game_simulator

  #game_combos = []
  games = []
  #round 1  upper right Midwest
   games << game1 = ["1 - Kansas","16 - UC Davis"].sample
   games << game2 = ["2 - Louisville","15 - Jacksonville St."].sample
   games << game3 = ["3 - Oregon","14 - Iona"].sample
   games << game4 = ["4 - Purdue","13 - Vermont"].sample
   games << game5 = ["5 - Iowa St.","12 - Nevada"].sample
   games << game6 = ["6 - Creighton","11 - Rhode Island"].sample
   games << game7 = ["7 - Michigan","10 - Oklahoma St."].sample
   games << game8 = ["8 - Miami University","9 - Michigan St."].sample

   "*************************"
   #round 2
   games << game9 = [game1,game8].sample
   games << game10 = [game2,game7].sample
   games << game11 = [game3,game6].sample
   games << game12 = [game4,game5].sample

   "*************************"
   # sweet 16
   games << game13 = [game9,game12].sample
   games << game14 = [game10,game11].sample

   "*************************"
   # elite 8
   games << game15 = [game13,game14].sample

##########################################################################
    #round 1 bottom right South
   games << game16 = ["1 - North Carolina","16 - Texas Southern"].sample
   games << game17 = ["2 - Kentucky","15 - Northern Kentucky"].sample
   games << game18 = ["3 - UCLA","14 - Kent St."].sample
   games << game19 = ["4 - Butler","13 - Winthrop"].sample
   games << game20 = ["5 - Minnesota","12 - Mid Tennessee"].sample
   games << game21 = ["6 - Cincinnati","11 - Kansas St."].sample
   games << game22 = ["7 - Dayton","10 - Whichita St."].sample
   games << game23 = ["8 - Arkansas","9 - Seton Hall"].sample

   "*************************"
   #round 2
   games << game24 = [game16,game23].sample
   games << game25 = [game17,game22].sample
   games << game26 = [game18,game21].sample
   games << game27 = [game19,game20].sample

   "*************************"
   # sweet 16
   games << game28 = [game24,game27].sample
   games << game29 = [game25,game26].sample

   "*************************"
   # elite 8
   games << game30 = [game28,game29].sample

##########################################################################

   #round 1  upper left EAST
   games << game31 = ["1 - Villanova","16 - MSM"].sample
   games << game32 = ["2 - Duke","15 - Troy"].sample
   games << game33 = ["3 - Baylor","14 - New Mexico St."].sample
   games << game34 = ["4 - Florida","13 - ETSU"].sample
   games << game35 = ["5 - Virginia","12 - UNC Wilmington"].sample
   games << game36 = ["6 - SMU","11 - USC"].sample
   games << game37 = ["7 - South Carolina","10 - Marquette"].sample
   games << game38 = ["8 - Wisconsin","9 - Virginia Tech"].sample

   "*************************"
   #round 2
   games << game39 = [game31,game38].sample
   games << game40 = [game32,game37].sample
   games << game41 = [game33,game36].sample
   games << game42 = [game34,game35].sample

   "*************************"
   # sweet 16
   games << game43 = [game39,game42].sample
   games << game44 = [game40,game41].sample

   "*************************"
   # elite 8
   games << game45 = [game43,game44].sample

##########################################################################
    #round 1 bottom left WEST
   games << game46 = ["1 - Gonzaga","16 - South Dakota St."].sample
   games << game47 = ["2 - Arizona","15 - North Dakota"].sample
   games << game48 = ["3 - Florida St.","14 - FGCU"].sample
   games << game49 = ["4 - West Virginia","13 - Bucknell"].sample
   games << game50 = ["5 - Notre Dame","12 - Princeton"].sample
   games << game51 = ["6 - Maryland","11 - Xavier"].sample
   games << game52 = ["7 - Saint Mary's","10 - VCU"].sample
   games << game53 = ["8 - Northwestern","9 - Vanderbilt"].sample

   "*************************"
   #round 2
   games << game54 = [game46,game53].sample
   games << game55 = [game47,game52].sample
   games << game56 = [game48,game51].sample
   games << game57 = [game49,game50].sample

   "*************************"
   # sweet 16
   games << game58 = [game54,game57].sample
   games << game59 = [game55,game56].sample

   "*************************"
   # elite 8
   games << game60 = [game58,game59].sample

##########################################################################

  # final 4
  games << game61 = [game15,game30].sample
  games << game62 = [game45,game60].sample

##########################################################################
  # CHAMPTIONSHIP
  games << game63 = [game61,game62].sample

##########################################################################

  games 
   
end


###NOTES
# -add database or something to keep track of how many times a certain team wins or a certain seed over a course of a certain
# amount of simulators. Add team names in later. Add probability of certain teams to win to figure out above requests perhaps?
# How do I give teams with better seeds a better chance to win? Have more names in the sample array?
#next, filter out easy victories like 1 v 16 to then predict new outcomes and how long it'd take.
# 2^number of possible games is way to find it. 
#can i build a "graph" of *'s that increase for each team as the program runs? 


#when filtering the result of each tournament, into all results, don't include same tourney results into the all results array.
beginning_time = Time.now 
tourney_outcomes = []
winners = []
winner_count = ''
results = 0
  5000.times do 
     tourney_result = game_simulator
     winner = tourney_result[62]
     tourney_outcomes << tourney_result unless tourney_outcomes.include?(tourney_result)
     winners << winner
     winner_count = winners.each_with_object(Hash.new(0)) { |team,counts| counts[team] += 1 }.sort_by {|key, value| -value}
     p results += 1
  end

winner_count.each do |team, count|
      p "#{team} has won #{count} times"
    end
 p tourney_outcomes.length

end_time = Time.now
time_taken_to_run_simulations = end_time - beginning_time
puts "it took #{time_taken_to_run_simulations} time to return #{results} simulations results"
# it would take 273,627,002,666  billion days to run the 9 quintillion possible results. 749,663,021 years. 
# p tourney_outcomes.uniq.length
