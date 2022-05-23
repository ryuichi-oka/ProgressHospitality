# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'progress@test.com',
  password: 'progress',
)

Group.create!(
  admin_id: 1,
  shop_name: "〇〇屋 1号店"
  )

Group.create!(
  admin_id: 1,
  shop_name: "〇〇屋 2号店"
  )

Group.create!(
  admin_id: 1,
  shop_name: "〇〇屋 3号店"
  )

Member.create!(
  group_id: 1,
  last_name: "田中",
  first_name: "太郎",
  last_name_kana: "タナカ",
  first_name_kana: "タロウ",
  birthday: "2000-05-01",
  postal_code: "0000000",
  address: "〇〇県〇〇市〇〇町1-23",
  telephone_number: "00011111111",
  email: "member1@example.com",
  password: "password",
  objective: "",
  is_active: true
  )

Member.create!(
  group_id: 1,
  last_name: "鈴木",
  first_name: "次郎",
  last_name_kana: "スズキ",
  first_name_kana: "ジロウ",
  birthday: "2000-07-01",
  postal_code: "0000000",
  address: "〇〇県〇〇市〇〇町1-23",
  telephone_number: "00022222222",
  email: "member2@example.com",
  password: "password",
  objective: "",
  is_active: true
  )

Member.create!(
  group_id: 1,
  last_name: "佐藤",
  first_name: "翔太",
  last_name_kana: "サトウ",
  first_name_kana: "ショウタ",
  birthday: "2000-11-11",
  postal_code: "0000000",
  address: "〇〇県〇〇市〇〇町1-23",
  telephone_number: "00033333333",
  email: "member3@example.com",
  password: "password",
  objective: "",
  is_active: true
  )

Member.create!(
  group_id: 2,
  last_name: "伊藤",
  first_name: "健太",
  last_name_kana: "イトウ",
  first_name_kana: "ケンタ",
  birthday: "1998-12-24",
  postal_code: "0000000",
  address: "〇〇県〇〇市〇〇町1-23",
  telephone_number: "00044444444",
  email: "member4@example.com",
  password: "password",
  objective: "",
  is_active: true
  )

WorkType.create!(
  work_type: "ホール",
  is_active: true
  )

WorkType.create!(
  work_type: "キッチン",
  is_active: true
  )

WorkType.create!(
  work_type: "共通",
  is_active: true
  )

Skill.create!(
  work_type_id: 1,
  group_id: 1,
  name: "オーダー",
  rank: 0,
  body: "オーダーポジションとしての基本業務",
  terms: "研修期間終了",
  is_active: true
  )

Skill.create!(
  work_type_id: 1,
  group_id: 1,
  name: "レジ",
  rank: 0,
  body: "レジポジションとしての基本業務",
  terms: "研修期間終了",
  is_active: true
  )

Skill.create!(
  work_type_id: 1,
  group_id: 1,
  name: "オーダー",
  rank: 1,
  body: "オーダーポジションの素早い遂行",
  terms: "オーダーEランク習得後",
  is_active: true
  )

Skill.create!(
  work_type_id: 2,
  group_id: 1,
  name: "揚げ場",
  rank: 0,
  body: "揚げ物レシピの把握",
  terms: "研修期間終了",
  is_active: true
  )

Skill.create!(
  work_type_id: 2,
  group_id: 1,
  name: "揚げ場",
  rank: 1,
  body: "揚げ物を正確に素早く調理する",
  terms: "揚げ場Eランク習得後",
  is_active: true
  )

SkillDetail.create!(
  skill_id: 1,
  body: "ハンディーを正しく使う"
  )

SkillDetail.create!(
  skill_id: 1,
  body: "正しい言葉遣いを心がける"
  )

SkillDetail.create!(
  skill_id: 1,
  body: "テーブルバッシングを素早く行う"
  )

SkillDetail.create!(
  skill_id: 2,
  body: "POSの操作方法を覚える"
  )

SkillDetail.create!(
  skill_id: 2,
  body: "領収書の書き方を覚える"
  )

SkillDetail.create!(
  skill_id: 4,
  body: "天婦羅のきれいな揚げ方"
  )

Manual.create!(
  work_type_id: 1,
  group_id: 1,
  name: "テーブルバッシングのマニュアル",
  body: "正しいテーブルバッシングのやり方...",
  is_active: true
  )

Manual.create!(
  work_type_id: 1,
  group_id: 1,
  name: "ハンディーマニュアル",
  body: "ハンディーの使い方...",
  is_active: true
  )

Manual.create!(
  work_type_id: 1,
  group_id: 1,
  name: "お会計（現金）マニュアル",
  body: "正しい現金会計のやり方...",
  is_active: true
  )

Manual.create!(
  work_type_id: 1,
  group_id: 1,
  name: "お会計（クレジット）マニュアル",
  body: "正しいクレジット会計のやり方...",
  is_active: true
  )

Manual.create!(
  work_type_id: 2,
  group_id: 1,
  name: "揚げ物レシピ",
  body: "揚げ物レシピ一覧",
  is_active: true
  )

SkillManual.create!(
  skill_id: 1,
  manual_id: 1
  )

SkillManual.create!(
  skill_id: 1,
  manual_id: 2
  )

SkillManual.create!(
  skill_id: 2,
  manual_id: 3
  )

SkillManual.create!(
  skill_id: 2,
  manual_id: 4
  )

SkillManual.create!(
  skill_id: 4,
  manual_id: 5
  )

MemberSkill.create!(
  member_id: 1,
  skill_id: 1,
  level: 100,
  is_acquire: true
  )

MemberSkill.create!(
  member_id: 1,
  skill_id: 2,
  level: 50,
  is_acquire: false
  )

MemberSkill.create!(
  member_id: 1,
  skill_id: 3,
  level: 30,
  is_acquire: false
  )

MemberSkill.create!(
  member_id: 2,
  skill_id: 4,
  level: 100,
  is_acquire: true
  )

MemberSkill.create!(
  member_id: 2,
  skill_id: 5,
  level: 70,
  is_acquire: false
  )

GroupMessage.create!(
  group_id: 1,
  title: "テスト投稿",
  body: "hoge"
  )

GroupMessage.create!(
  group_id: 1,
  title: "テスト投稿２",
  body: "hogehoge"
  )