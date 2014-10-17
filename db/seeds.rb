require_relative 'seed_creation_methods'

clear_seeds

john = create_user("John Kennedy")
bill = create_user("William McKinley")
ghandi = create_user("Mahatma Ghandi")
marty = create_user("Martin King")

memorial = Memorial.create!(user_id: john.id, name: "Abraham Lincoln", born: Date.strptime('10/02/1950', "%m/%d/%Y"), died: Date.strptime('12/21/1992', "%m/%d/%Y"))

create_membership(john.id, memorial.id)
create_membership(bill.id, memorial.id)
create_membership(ghandi.id, memorial.id)
create_membership(marty.id, memorial.id)

john_story_content = <<-story
Lorem ipsum dolor sit amet, is, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapib.
story

bill_story_content = <<-story
Sed ut perspiciatis unde omnis quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit
story

ghandi_story_content = <<-story
But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure
story

marty_story_content = <<-story
The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.
story

john_post_content = <<-post
Risus nisl vitae. Enim hendrerit elit laoreet id sit vitae ante ipsum. Amet eget nulla fusce tortor turpis volutpat sollicitudin mi. Interdum ac magna. Suspendisse praesent et semper suspendisse neque. Lorem consectetur pellentesque tellus felis congue. Non est excepturi fringilla tincidunt faucibus dapibus dui sit phasellus nam erat. Ante eget montes. Pede rutrum dui. Velit quis laoreet. Culpa bibendum mi wisi nulla interdum. Purus ullamcorper dui. Mauris nulla est aptent at eu. Nisl sollicitudin volutpat imperdiet mauris libero non massa eget ultricies leo suspendisse. Wisi massa quam lorem neque tristique.
post

bill_post_content = <<-post
Lorem ipsum dolor sit amet mi a tincidunt tincidunt. Odio nec ante. Non turpis nonummy aliquam at sed. Nostra hac nulla. Sed etiam non justo euismod pellentesque. Amet aliquet fringilla. Integer fusce neque in ante in. In nisl mauris eu interdum id proin hendrerit ipsum. Feugiat massa posuere arcu dui quam id tempus vulputate sodales faucibus curae. Massa non donec.
post

create_story(john.id, memorial.id, john_story_content)

create_post(john.id, memorial.id, "Li Europan Lingues es Membres", john_post_content)

create_story(bill.id, memorial.id, bill_story_content)

create_post(bill.id, memorial.id, "Sed ut Perspiciatis Unde Omnis", bill_post_content)

create_story(ghandi.id, memorial.id, ghandi_story_content)
create_story(marty.id, memorial.id, marty_story_content)

p '*' * 25
p "THE MEMORIAL_ID THAT WAS CREATED WAS #{memorial.id}"
p "Login with 'Email: #{john.email}' and 'Password: 1'"
p "Visit '/memorials/#{memorial.id}'"
p '*' * 25
