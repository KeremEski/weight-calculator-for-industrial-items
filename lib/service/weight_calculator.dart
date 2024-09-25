class WeightCalculator {

  WeightCalculator({required this.en,required this.boy,required this.yukseklik,required this.tablaSayisi,required this.ayakSayisi,required this.sacKalinligi,required this.sacKalitesi,required this.etrafiAcikmi,required this.eviyeSayisi});

  final double en;
  final double boy;
  final double yukseklik;
  final int tablaSayisi;
  final double sacKalinligi;
  final int ayakSayisi;
  final String sacKalitesi;
  final bool etrafiAcikmi;
  final int eviyeSayisi;
  final double ozgulAgirlik = 0.8;

  double tablaAgirlikHesapla(){
    double tablaEn = en + 15;
    double tablaBoy = boy + 15;
    double tekTablaAgirlik = tablaBoy*tablaEn*sacKalinligi*(0.8);
    return tekTablaAgirlik*tablaSayisi;
  }

  double profilAgirlikHesapla(){
    double ayakAgirlik = 2.1;
    if(yukseklik <= 100 && yukseklik > 60){
      ayakAgirlik = 2;
    }
    else if(yukseklik <= 60 && yukseklik >= 10){
      ayakAgirlik = 1.7;
    }
      double toplamAyakAgirlik = ayakAgirlik * ayakSayisi;
      return toplamAyakAgirlik*1000;
  }

  double bantAgirlik(){
    double bantEn = eviyeSayisi > 0 ? 27 : 17;
    double uzunBantAgirlik = boy*(bantEn+7)*sacKalinligi*ozgulAgirlik;
    double kisaBantAgirlik = en*(10)*sacKalinligi*ozgulAgirlik;
    return uzunBantAgirlik*2 + kisaBantAgirlik*2;
  }

  double kayitAgirlikHesapla(){
    if(boy<=100){
      return 4*1000;
    }
    return (2+((boy*2)/100)) * 1000;
  }
  //Komple Etrafı Açık Tezgah Hesaplama
  double etrafiAcikTezgahHesaplama(){
    double tablaAgirlik = tablaAgirlikHesapla();
    double bantAgirligi = bantAgirlik();
    double ayakAgirlik = profilAgirlikHesapla();
    if(tablaSayisi > 1 && eviyeSayisi == 0){
      return (tablaAgirlik + bantAgirligi + ayakAgirlik)/1000;
  }
  //Buraya eviye ağırlığını eklemen lazım
  else if(tablaSayisi > 1 && eviyeSayisi >= 1){
    double eviyeAgirlik = (3 * double.parse(eviyeSayisi.toString()))*1000;
    return (tablaAgirlik + bantAgirligi + ayakAgirlik + eviyeAgirlik)/1000;
  }
  else if(tablaSayisi == 1 && eviyeSayisi == 0){
    double kayitAgirlik = kayitAgirlikHesapla();
  return (tablaAgirlik + bantAgirligi + kayitAgirlik + ayakAgirlik)/1000;
  }
  else{
    double kayitAgirlik = kayitAgirlikHesapla();
  return (tablaAgirlik + bantAgirligi + kayitAgirlik + ayakAgirlik)/1000;
  }
  
}

}