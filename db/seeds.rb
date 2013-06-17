
Neighborhood.delete_all
Item.delete_all
Sale.delete_all
User.delete_all




n1 = Neighborhood.create(name: 'Brooklyn Heights')
n2 = Neighborhood.create(name: 'Red Hook')
n3 = Neighborhood.create(name: 'Williamsburg')
n4 = Neighborhood.create(name: 'Carroll Gardens')
n5 = Neighborhood.create(name: 'Greenpoint')
n6 = Neighborhood.create(name: 'Fort Greene')

u1 = User.create(username: 'Tanay', password: 'pass123', email: 'tanay@stoopid.com', admin: true)
u2 = User.create(username: 'David', password: 'pass123', email: 'david@stoopid.com')
u3 = User.create(username: 'Jamie', password: 'pass123', email: 'jamie@stoopid.com')
u4 = User.create(username: 'Mike', password: 'pass123', email: 'mike@stoopid.com')
u5 = User.create(username: 'Ryan', password: 'pass123', email: 'ryan@stoopid.com')
u6 = User.create(username: 'Bill', password: 'pass123', email: 'bill@stoopid.com')




s1 = Sale.create(title: 'Brooklyn Heights Sale', address: '28 Old Fulton Street', city: 'Brooklyn', date:'2013-10-10', time: '4pm')
s2 = Sale.create(title: 'Red Hook Sale', address: '391 Van Brunt Street', city: 'Brooklyn', date:'2013-12-12', time: '3pm')
s3 = Sale.create(title: 'Williamsburg Sale', address: '170 Bedford Avenue', city: 'Brooklyn', date:'2013-9-1', time: '2pm')
s4 = Sale.create(title: 'Carroll Gardens Sale', address: '400 Degraw Street', city: 'Brooklyn', date:'2013-10-5', time: '1pm')
s5 = Sale.create(title: 'Greenpoint Sale', address: '700 Manhattan Avenue', city: 'Brooklyn', date:'2013-11-11', time: '12pm')
s6 = Sale.create(title: 'Fort Greene Sale', address: '121 Dekalb Avenue', city: 'Brooklyn', date:'2013-12-15', time: '1:30pm')


i1 = Item.create(name: 'television', price: 200, description: '54 inch flat screen', image: 'http://www.televisions.com/Images/Reviews/Televisions/2010/R1139/1240/sam_tv_ue46c7700_front.jpg')
i2 = Item.create(name: 'carpet', price: 30, description: 'Arabian and perfectly clean', image: 'http://persia.org/Images/Persian_Carpet/link/pic81.jpg' )
i3 = Item.create(name: 'dvds', price: 100, description: 'The entire James Bond Collection in Blue Ray', image: 'http://images.buydvdau.com/upload/relatedImgs/relatedImgs_2013-02-19-12-13-55_2.jpg')
i4 = Item.create(name: 'shoes', price: 20, description: 'Size 8 Adidas Sneakers', image: 'http://www.sneakerfiles.com/wp-content/uploads/2008/04/whiteblacksuperstarii.jpg' )
i5 = Item.create(name: 'baseball cards', price: 10, description: 'Best in the business', image: 'http://1.bp.blogspot.com/_nvDWp8u1GAM/TKYAaqniquI/AAAAAAAAAkY/BCS3AatwAWw/s1600/87_moyer.jpg' )
i6 = Item.create(name: 'sunglasses', price: 50, description: '2 year old Oakleys', image: 'http://calgolfnews.com/wp-content/uploads/2012/06/Oakley-Sunglasses1.png' )

n1.users << u1
n2.users << u2
n3.users << u3
n4.users << u4
n5.users << u5
n6.users << u6

u1.sales << s1
u2.sales << s2
u3.sales << s3
u4.sales << s4
u5.sales << s5 
u6.sales << s6

s1.items << i1
s2.items << i2
s3.items << i3
s4.items << i4
s5.items << i5
s6.items << i6

