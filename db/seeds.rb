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
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapib
story

bill_story_content = <<-story
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tem
story

ghandi_story_content = <<-story
But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or
story

marty_story_content = <<-story
The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words. If several languages coalesce, the gra
story

john_story = create_story(john.id, memorial.id, john_story_content)
bill_story = create_story(bill.id, memorial.id, bill_story_content)
ghandi_story = create_story(ghandi.id, memorial.id, ghandi_story_content)
marty_story = create_story(marty.id, memorial.id, marty_story_content)

john_post_content = <<-post
Risus nisl vitae. Enim hendrerit elit laoreet id sit vitae ante ipsum. Amet eget nulla fusce tortor turpis volutpat sollicitudin mi. Interdum ac magna. Suspendisse praesent et semper suspendisse neque. Lorem consectetur pellentesque tellus felis congue. Non est excepturi fringilla tincidunt faucibus dapibus dui sit phasellus nam erat. Ante eget montes. Pede rutrum dui. Velit quis laoreet. Culpa bibendum mi wisi nulla interdum. Purus ullamcorper dui. Mauris nulla est aptent at eu. Nisl sollicitudin volutpat imperdiet mauris libero non massa eget ultricies leo suspendisse. Wisi massa quam lorem neque tristique.

In vitae feugiat. Nunc vitae ut. Ullamcorper venenatis erat mattis etiam tincidunt. Ante suscipit fermentum. Ligula aliquam faucibus vestibulum aliquam non vitae facilisis erat. Arcu wisi tempor. Nullam ut faucibus. Nonummy in sem eget et egestas. Aliquam cursus magna torquent ac dolor fusce lacus egestas. Magni dui etiam adipiscing magna ipsum. Et vivamus eget. Ut nisl eros wisi neque id. Sollicitudin euismod donec venenatis phasellus ante eros metus pretium commodo luctus nam. Vitae arcu laoreet. Mollis platea sed sit neque ac semper purus massa libero vestibulum elit. Mauris in porttitor commodi magna tellus. Ante massa et. Vestibulum amet ipsum. Donec sit vitae. In in iaculis. Et accumsan dui. Id iaculis vitae eget in quam ornare et risus. Eleifend eget quos consectetuer lorem ipsum duis semper urna. Justo tempus est metus turpis placerat duis blandit nisl. Ornare scelerisque magna lacus parturient tortor mi tempor nulla luctus pharetra integer ut duis magna.

Duis sollicitudin lacus proin vestibulum velit nunc erat a lacus venenatis nemo. Ac vitae arcu. Sed suspendisse non donec at lorem. Morbi massa ligula viverra lorem nulla. Class nisl dolor. Ultricies vitae sed. Iaculis et vivamus sociosqu aliquam lacus. Tristique ac vulputate. Integer aliquam quis eget gravida sollicitudin. Nec placerat euismod aliquam aliquet vestibulum interdum pede placerat tellus lacus pellentesque.
post

bill_post_content = <<-post
Lorem ipsum dolor sit amet mi a tincidunt tincidunt. Odio nec ante. Non turpis nonummy aliquam at sed. Nostra hac nulla. Sed etiam non justo euismod pellentesque. Amet aliquet fringilla. Integer fusce neque in ante in. In nisl mauris eu interdum id proin hendrerit ipsum. Feugiat massa posuere arcu dui quam id tempus vulputate sodales faucibus curae. Massa non donec.

Tortor eget vel. Proin ligula eleifend. Et donec quam duis gravida magni diam dui vulputate. Mi vel illum morbi wisi phasellus et mauris ultricies. Vehicula in morbi vitae volutpat ut.

Dui dictumst pellentesque enim rutrum auctor. Convallis orci commodo venenatis sed mollit ac vel diam. Nulla turpis imperdiet. Sapien nunc nonummy. At facilisis mauris augue amet a massa interdum ac. Morbi ut proin metus duis neque fermentum ante sit. Dignissim scelerisque sodales libero lacinia vestibulum. Sed ante dolor mauris sed justo proin cursus iaculis. Est eget accumsan. Netus libero sem. Ornare modi sodales. Nec dolor congue. Ante pede mauris volutpat proin duis magna integer feugiat suspendisse non massa. Dui vel in dui augue ut quibusdam interdum id. Laoreet adipiscing vestibulum dictum pulvinar amet vitae elit con. Massa sed tellus. Malesuada non vestibulum. Eros pellentesque ut erat in ut at aliquet in amet magna phasellus nunc ipsum sed nunc posuere imperdiet ac phasellus metus. Erat eu nunc. Dolor mauris viverra non vel augue. Tempor orci elit. Aliquam excepteur atque. Ipsum pulvinar luctus. Vehicula dignissim erat. Sollicitudin volutpat ante nulla in arcu. Felis duis urna. Non arcu erat. Sollicitudin nec aliquam enim dictum velit. Consectetuer velit urna. Sed elit at dignissim et quia. Mollis velit posuere mollis tellus quis ligula in ante. Eros odio sollicitudin tortor tempus in sed aliquam at. Eu ultrices tortor. Pede enim wisi sed mollis bibendum nisl tristique quis sem earum urna ac imperdiet nostra. Ut wisi vestibulum.
post

create_post(john.id, memorial.id, "Li Europan Lingues es Membres", john_post_content)
create_post(bill.id, memorial.id, "Sed ut Perspiciatis Unde Omnis", bill_post_content)

p '*' * 25
p "THE MEMORIAL_ID THAT WAS CREATED WAS #{memorial.id}"
p "Login with 'Email: #{john.email}' and 'Password: 1'"
p "Visit '/memorials/#{memorial.id}'"
p '*' * 25
