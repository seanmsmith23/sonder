# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.all.destroy_all
Memorial.all.destroy_all
Membership.all.destroy_all
Story.all.destroy_all
Storylike.all.destroy_all

def create_user(name)
  names = name.split(' ')
  first = names[0].downcase
  last = names[1].downcase

  User.create!(first_name: first, last_name: last, email: "#{first}#{last}@example.com", password: "1")
end

sean = create_user("Sean Smith")
allie = create_user("Allison Ettinger")
elise = create_user("Elise Belusa")
woubie = create_user("Woubedie Alemeyah")
toni = create_user("Toni Mariviglia")
rishma = create_user("Rishma Ramrattan")
betty = create_user("Parbatee Ramrattan")
josh = create_user("Josh Weinstein")
carol = create_user("Carol Nekesa")
jon = create_user("Jon Helfers")
faizan = create_user("Faizan Diwan")

memorial = Memorial.create!(user_id: sean.id, name: "Ravindra Ramrattan", born: Date.strptime('09/2/1983', "%m/%d/%Y"), died: Date.strptime('09/21/2013', "%m/%d/%Y"))

Membership.create!(user_id: elise.id, memorial_id: memorial.id)
Membership.create!(user_id: allie.id, memorial_id: memorial.id)
Membership.create!(user_id: sean.id, memorial_id: memorial.id)
Membership.create!(user_id: woubie.id, memorial_id: memorial.id)
Membership.create!(user_id: toni.id, memorial_id: memorial.id)
Membership.create!(user_id: rishma.id, memorial_id: memorial.id)
Membership.create!(user_id: betty.id, memorial_id: memorial.id)
Membership.create!(user_id: josh.id, memorial_id: memorial.id)
Membership.create!(user_id: carol.id, memorial_id: memorial.id)

woubie_story = Story.create!(user_id: woubie.id, memorial_id: memorial.id, story: "You had told me a lot about this guy 'Ravi' previously - about his intelligence, his wit, and his dancing skills - but nothing could have prepared me for what I saw that first night at Changes, and later at Black Diamond.  He was hilarious, whip-smart, and had a lovely posh accent that was super endearing.  We bonded over our shared Oxford connection, and he was also one of the best and most energetic dancers I had ever met.  Even though Sloan and I were kind of together at the time, I remember spending the ENTIRE night dancing with Ravi to a mix of dance hall music and Kenyan hits and absolutely loving it.")

josh_story = Post.create!(user_id: josh.id, memorial_id: memorial.id, title: "A Tribute to My Friend, Ravi Ramrattan",content:"This weekend has been difficult. I found out yesterday that a friend was killed in the senseless, horrible attack in Nairobi. He was a great person and meant a lot to many people. He had a profound impact on so many people’s lives that I would not even begin to understand how to chronicle it all. So I will settle for talking about the time I knew him. I met Ravi early on in my time in Nairobi. I was grabbing a drink at a bar called Sierra Brewery with another guy named Ravi (Ravi Bungoma, after the town he hailed from in Western Kenya) who was applying for a job at my company, and he brought along Ravi Ramrattan (also known as Ravi Mumias). He worked for an organization called Innovations for Poverty Action at the time, and was stationed at a sugar factory in a town called Mumias a few hours outside of Nairobi.  I remember thinking that this guy was exceptionally smart. Subsequently, I found out he had bachelors degree in mathematics from the University of Cambridge, a masters degree in financial economics from Oxford, and another masters in econometrics and mathematical economics from the London School of Economics. After teaching statistics to graduate students at the London Business School for a year – at the tender age of 26 – he decided to move to Kenya to commit himself to the cause of poverty alleviation.

After six years in London, Ravi moved to Mumias, a rural town of 33,000 people in Western Kenya, where he spent a year and a half implementing an academic study at the Mumias Sugar Factory. Ravi ran a study evaluating the impact of a conditional cash advance and a cell phone based extension system on sugar cane farmers. Using a randomized controlled trial – the methodology used by pharmaceutical companies to determine the efficacy of a drug – Ravi tried to determine whether this particular development intervention generated additional income for the recipients. After picking up three degrees from some of the most prestigious universities in the world, he moved from London to a rural town in Western Kenya to help people he’d never met.")


story = Story.create!(user_id: toni.id, memorial_id: memorial.id, story: "Someone at the memorial last Friday told a story about this time when Ravi was living in Mumias. He decided he wanted to go out clubbing in Busia with the IPA staff. So he rented a whole matatu, rode in it to Busia, then went to each person's house and picked them up to take them to the only dance club in town.")

carol_story = Post.create!(user_id: carol.id, memorial_id: memorial.id, title: "A Trinidadian Hero in Kenya", content: "Having worked with Ravi for over a year, a fair description of his love for human life is something the terrorists never knew and shall never live to know. Only the people he touched shall live to tell. He may not be present physically but his love and kindness shall forever be felt in many ways and will never fade from our memories.
In March 2011, when Ravi lead a field team, one of his staff members was hit by a motor cyclist and was seriously injured. The staff member was rushed to a close-by hospital which did not have the relevant facilities to ascertain the magnitude of the injury.  Ravi quickly liaised with the management and made an executive decision for the staff to be transferred to Aga Khan Hospital Kisumu for quality services. Not only that, he personally offered to accompany the staff to the hospital. After the staff was discharged and returned to his home, Ravi organized with some of his colleagues to visit the injured staff at home in turns, mostly to give the staff moral support and reassurance of their love and care as a project. Ironically the staff got a job and did not disclose this to his colleagues. One day during normal routine visits, the visiting staff did not see the injured team member; his mother revealed that his son had secured another job but was ashamed of informing Ravi and the team over the situation knowing how supportive the project had been to him.  This incident broke Ravi’s heart but it did not stop him from extending his kindness to other staff.
In December 2011, IPA was forced to downsize one project within a very short period of time. Again after deliberating the issue with Ravi, he was quick in taking some of the staff onto his project; this led to three staff that would have otherwise lost their jobs to continue enjoying the fruits of employment.
Ravi had an indiscriminate tender heart; I am sure that most people who knew him can attest to this.")

allie_story = Story.create!(user_id: allie.id, memorial_id: memorial.id, story: " A new roommate moved into my apartment and I wanted to welcome her to Nairobi in style, so I immediately called Ravi to help me do so.  He was wrapping up a conference at work and had some colleagues in town, but rather than opting out, he invited them along for dinner and dancing.  We were a hodge-podge group, but Ravi made us all feel included.  At one point, all of us (a 50-year-old American economist; a young Libyan-American entrepreneur who was a former US soldier; a Danish economist who was a former national salsa champion; me; Ravi; and Tessa) were breaking it down on a small, hard-wood dance floor at an Ethiopian sports bar, much to the delight of the Kenyan and Ethiopian patrons at the bar.")

jon_story = Post.create!(user_id: jon.id, memorial_id: memorial.id, content: "I really got to know Ravi well last March when my wife Daniele and I went together with a large group of friends to the coast. It was the first time I had spent an extended period of time with him, having in the past mostly had dinners together when we would periodically visit Nairobi. On the coast, I remember as I spent more time with him, once again, being thoroughly impressed by him. He was just clearly a really smart guy while he remained unassuming. His generous and kind spirit were evident in his genuine interest in getting to know me better as a person—to his almost uncle like affection in looking after my young daughter Josephine. Ravi’s reputation had preceded him—in the best possible way—many of my close friends who had known him for a long time had always spoken highly of him. Their accolades are now my own, he was the life of the party while never really having to be the center of attention—he was simply just the person everyone wanted to be around. His passing will be felt deeply by me and I think all those who knew him. I will miss him but I also hope to emulate the quality of his character in my own life—to the lion of Mumias.", title: "To Emulate the Lion of Mumias")

faizan_story = Story.create!(user_id: faizan.id, memorial_id: memorial.id, story: " This is not so much a story as a funny image but a group of us went to Diani in March, including Aleem, who visiting Kenya for a couple of weeks. Ravi, Aleem and I were sharing a room and, at one point, we decided to put on sun tan lotion in preparation to go to the beach. The room had a really long mirror so, for the heck of it, the three of us decided to stand in line in front of the mirror, in our swim trunks, rubbing sun tan lotion on ourselves in sync. It's a ridiculous image -- 3 south asian men rubbing lotion all over themselves together -- but always makes me laugh when I think about it.")

Storylike.create!(story_id: story.id, user_id: toni.id)
Storylike.create!(story_id: story.id, user_id: faizan.id)
Storylike.create!(story_id: story.id, user_id: woubie.id)
Storylike.create!(story_id: story.id, user_id: betty.id)
Storylike.create!(story_id: story.id, user_id: jon.id)

Storylike.create!(story_id: woubie_story.id, user_id: faizan.id)
Storylike.create!(story_id: woubie_story.id, user_id: sean.id)
Storylike.create!(story_id: woubie_story.id, user_id: betty.id)
Storylike.create!(story_id: woubie_story.id, user_id: woubie.id)

Storylike.create!(story_id: allie_story.id, user_id: betty.id)
Storylike.create!(story_id: allie_story.id, user_id: woubie.id)

Storylike.create!(story_id: jon_story.id, user_id: sean.id)





