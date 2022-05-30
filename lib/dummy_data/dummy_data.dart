import 'package:finsem_client/model/event_model.dart';
import 'package:finsem_client/model/housekeeping_model.dart';
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
  ].obs;
}
