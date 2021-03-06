# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#USERS
igor = User.new
igor.email = 'igor@allan.com'
igor.password = '#$taawktljasktlw4aaglj'
igor.username = 'igor'
igor.save!

allan = User.new
allan.email = 'allan@allan.com'
allan.password = '#$taawktljasktlw4aaglj'
allan.username = 'allan'
allan.save!

talys = User.new
talys.email = 'talys@email.com'
talys.password = 'linguime'
talys.username = 'talys'
talys.save!

cesar = User.new
cesar.email = 'cesar@allan.com'
cesar.password = '#$taawktljasktlw4aaglj'
cesar.username = 'cesar'
cesar.save!

#LANGUAGES
alemao = Language.new
alemao.idiom = 'alemão'
japones = Language.new
japones.idiom = 'japonês'
ingles = Language.new
ingles.idiom = 'inglês'
hebraico = Language.new
hebraico.idiom = 'hebraico'
portugues = Language.new
portugues.idiom = 'português'
idiche = Language.new
idiche.idiom = 'ídiche'

LearningLanguage.create(user: igor, language: alemao)
LearningLanguage.create(user: igor, language: japones)
LearningLanguage.create(user: allan, language: ingles)
LearningLanguage.create(user: talys, language: alemao)
LearningLanguage.create(user: cesar, language: hebraico)

MotherLanguage.create(user:igor, language:portugues)
MotherLanguage.create(user:igor, language:ingles)
MotherLanguage.create(user:allan, language:portugues)
MotherLanguage.create(user:talys, language:ingles)
MotherLanguage.create(user:cesar, language:idiche)

#POST
post_igor = Post.create( upvotes:1, user:igor, difficulty:2,
        learning_language:'alemão', mother_language:'inglês', title:"Wie kann man \"potato\" sagen?", text:"I want to order baked potatoes in Germany. Help me, plz")

post_allan = Post.create( upvotes:1, user:allan, difficulty:5,
        learning_language:'inglês', mother_language:'português', title:"Como se diz remoer em inglês", text:"Remoer no sentido de insistir no passado")

post_talys = Post.create( upvotes:1, user:talys, difficulty:4,
        learning_language:'alemão', mother_language:'português', title:"Como se diz a mulher bebe leite?", text:"Está correto? Die Frau trinkt Milch")

post_cesar = Post.create( upvotes:0, user:cesar, difficulty:1,
        learning_language:'ídiche', mother_language:'hebraico', title:"Boker Tov", text:"Gutn morgn?")

Bookmark.create(user: igor, post: post_allan)
Bookmark.create(user: talys, post: post_talys)
Bookmark.create(user: cesar, post: post_cesar)
Bookmark.create(user: allan, post: post_allan)
Bookmark.create(user: igor, post: post_igor)

comment_talys = Comment.create(upvoted: true, text: "Ruminate, dwell on, nibble, mull over. Bjs")
AuthorCommentPost.create(user: talys, comment: comment_talys, post: post_allan)

comment_talys2 = Comment.create(upvoted: true, text: "Kartoffel")
AuthorCommentPost.create(user: talys, comment: comment_talys2, post: post_igor)

comment_igor2 = Comment.create(upvoted: false, text: "WOW! Thanks!")
AuthorCommentPost.create(user: igor, comment: comment_igor2, post: post_igor)

comment_igor = Comment.create(upvoted: true, text: "Sim, está correto. Bjs")
AuthorCommentPost.create(user: igor, comment: comment_igor, post: post_talys)
