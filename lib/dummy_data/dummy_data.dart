import 'package:finsem_client/model/event_model.dart';
import 'package:finsem_client/model/housekeeping_model.dart';
import 'package:finsem_client/model/notice_model.dart';
import 'package:finsem_client/model/txn_model.dart';
import 'package:get/get.dart';

class DummyData {
  RxList<Event> events = [
    Event(
      title: "Dussehra",
      description:
          "Vijayadashami (Sanskrit: विजयदशमी, romanized: Vijayadaśamī), also known as Dussehra, Dasara or Dashain, is a major Hindu festival celebrated at the end of Navaratri every year. It is observed on the tenth day in the Hindu calendar month of Ashvin, the seventh month of the Hindu Luni-Solar Calendar, which typically falls in the Gregorian months of September and October",
      imageLink:
          "https://i0.wp.com/www.jaipurstuff.com/wp-content/uploads/2019/10/1508168997_CoverPage-Dussehra.jpg.jpg?fit=956%2C535&ssl=1",
      location: "Orion Mall",
      date: "12 October 2022",
      time: "10Am-2Pm",
      donation: true,
      amountReq: 13500,
    ),
    Event(
      title: "Diwali Celebration",
      description:
          " Diwali is a festival of lights and one of the major festivals celebrated by Hindus, Buddhists, Jains, and Sikhs. The festival usually lasts five days and is celebrated during the Hindu lunisolar month Kartika.",
      imageLink:
          "https://media.istockphoto.com/photos/indian-family-celebrating-diwali-festival-with-fire-crackers-picture-id698710824?k=20&m=698710824&s=612x612&w=0&h=rmuV9NO-7D1ClGOksWR_CHvnibo4BJaOYw9QVpEQ6Tc=",
      location: "Compound",
      date: "13 November 2022",
      time: "8Pm-10Pm",
      donation: false,
    ),
    Event(
      title: "Kavi Sammelan",
      description:
          "Kavi Sammelan is a gathering of poets in the Hindi Belt of northern India. The participants recite their poetry to each other and have a general discussion on literary issues. This may take place among the poets but is mostly done before an audience.",
      imageLink:
          "https://res.cloudinary.com/dwzmsvp7f/image/fetch/q_75,f_auto,w_800/https%3A%2F%2Fmedia.insider.in%2Fimage%2Fupload%2Fc_crop%2Cg_custom%2Fv1519627962%2Fvltlogy23k1iid9pjffx.jpg",
      location: "Orion Mall",
      date: "15 August 2022",
      time: "10Am-2Pm",
      donation: true,
      amountReq: 15000,
    ),
    Event(
      title: "Rangoli",
      description:
          "Rangoli is an art form originating in the Indian subcontinent, in which patterns are created on the floor or a tabletop using materials such as powdered lime stone, red ochre, dry rice flour, coloured sand, quartz powder, flower petals, and coloured rocks.",
      imageLink:
          "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2021/11/04/1003926-diwali-ani.jpg",
      location: "Compound",
      date: "13 November 2022",
      time: "6Pm-8Pm",
      donation: false,
    ),
  ].obs;
  RxList<Txn> txns = [
    Txn(
      id: '1513515131#1515',
      amount: 500,
      desc: "Kavi Sammelan",
      paidBy: 'lXRK6svHrwVCkrkGiGuckVJDF6H2',
      orgId: "tw2TPyM4WQgbLJ3w4hxAfGnc9JE2",
      type: 'Donation',
      date: "15 Jan",
      time: "13:44",
      pyMode: "Upi",
    ),
    Txn(
      id: '1513515131#1515',
      amount: 50,
      desc: "June payment",
      paidBy: 'lXRK6svHrwVCkrkGiGuckVJDF6H2',
      orgId: "tw2TPyM4WQgbLJ3w4hxAfGnc9JE2",
      type: 'Monthly',
      date: "13 June",
      time: "13:44",
      pyMode: "Upi",
    ),
    Txn(
      id: '1513515131#1515',
      amount: 100,
      desc: "May payment",
      paidBy: 'lXRK6svHrwVCkrkGiGuckVJDF6H2',
      orgId: "tw2TPyM4WQgbLJ3w4hxAfGnc9JE2",
      type: 'Monthly',
      date: "24 May 2021",
      time: "13:44",
      pyMode: "Upi",
    ),
    Txn(
      id: '1513515131#1515',
      amount: 2500,
      desc: "Diwali",
      paidBy: 'lXRK6svHrwVCkrkGiGuckVJDF6H2',
      orgId: "tw2TPyM4WQgbLJ3w4hxAfGnc9JE2",
      type: 'Donation',
      date: "24 May",
      time: "13:44",
      pyMode: "Upi",
    ),
    Txn(
      id: '1513515131#1515',
      amount: 50,
      desc: "April payment",
      paidBy: 'lXRK6svHrwVCkrkGiGuckVJDF6H2',
      orgId: "tw2TPyM4WQgbLJ3w4hxAfGnc9JE2",
      type: 'Monthly',
      date: "24 April",
      time: "13:44",
      pyMode: "Upi",
    ),
  ].obs;
  RxList<HouseKeeping> houseKeeping = [
    HouseKeeping(
      name: 'Suraj Singh',
      age: 26,
      desc: 'Skilled cook with 2+ years\' experience',
      hkType: HkType.cook,
      veg: false,
      mobile: '+919914173314',
      gender: 'M',
    ),
    HouseKeeping(
      name: 'Rani Devi',
      age: 30,
      desc: 'Clean your house and kitchen',
      hkType: HkType.maid,
      veg: false,
      mobile: '+919914170014',
      gender: 'F',
    ),
    HouseKeeping(
      name: 'Rishi yadav',
      age: 30,
      desc: 'Gourmet cook with 6+ years experience',
      hkType: HkType.cook,
      veg: false,
      mobile: '+919914170014',
      gender: 'M',
    ),
    HouseKeeping(
      name: 'Anita',
      age: 30,
      desc:
          'Skilled cook having more than 3 years of experience and cooks north indian varieties, south indian varieties, marwari dishes and Chinese dishes too',
      hkType: HkType.cook,
      veg: false,
      mobile: '+919914170014',
      gender: 'F',
    ),
    HouseKeeping(
      name: 'Parvez H',
      age: 30,
      desc:
          'He is skilled, punctual and obedient cook. He cooks on basis on ur requirement or desire. Cooks kashmiri, Punjabi and mughlai dishes and having 2+ years experience',
      hkType: HkType.cook,
      veg: false,
      mobile: '+919914170014',
      gender: 'M',
    ),
    HouseKeeping(
      name: 'Lakhan',
      age: 30,
      desc:
          'Skilled cooks with 1 year experience and makes delicious and tasty north Indian as well as south indian food.',
      hkType: HkType.cook,
      veg: false,
      mobile: '+919914170014',
      gender: 'M',
    ),
  ].obs;
  RxList<Notice> notice = [
    Notice(
        title: "Waste Management",
        description:
            "Wet waste is all the kitchen waste that we produce. This can include vegetable peels, used tea, fruits, leftovers, etc. This is biodegradable organic waste that can also be composted. Dry waste comprises paper, glass, plastic, cardboard, styrofoam, rubber, metal, food packaging material, etc. Even milk cartons and packets go into a dry waste bin. Dry waste is recyclable but will be rejected if it is contaminated or soiled.",
        imageLink: "assets/images/waste.jpeg"),
    Notice(
        title: "Dont litter in Society Campus",
        description:
            "Litter pollutes the air as it decomposes, releasing unwanted chemicals into the air we breathe. Too much litter in a community can decrease the quality of air, impacting both our and our children's health. Disposing of waste correctly means that litter is kept away from thriving communities.",
        imageLink: "assets/images/env.jpeg"),
    Notice(
        title: "Proper Attire in Swiming pool",
        description:
            "In order to gain entry into the pool area, you must be clothed in proper swim attire. Clean white t-shirts may be worn over proper swim attire. Colored t-shirts will not be allowed in the pool. All infants/toddlers that require a diaper must wear swimmer diapers and proper swimwear. Community pools are family friendly. All swim wear must be appropriate. Approved water shoes are permitted.",
        imageLink: "assets/images/swim.jpeg"),
    Notice(
        title: "Please Pickup After pet",
        description:
            "Dog waste can contain bacteria, parasites, and pathogens that can directly and indirectly cause people to get sick. Although it may look like the poo in your yard has disappeared over time or washed away, some micro-organisms (such as Roundworms, E. coli, and Giardia) can persist and survive in your yard for up to four years if not picked up! Think of how often you use your backyards and lawns, and imagine what microscopic beasts could be proliferating there if the dog poo is left untouched.",
        imageLink: "assets/images/dog.jpeg"),
  ].obs;
}
