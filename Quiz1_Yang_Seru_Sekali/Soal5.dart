import 'dart:io';

class Ujian {
  int totalNilai = 0;
  int jumlahData = 0;

  void tambahNilai(int nilai) {
    totalNilai += nilai;
    jumlahData++;
  }

  double rataRata() {
    return totalNilai / jumlahData;
  }
} // sampai senturi depan jg ini ga diajarin pak jago

void main() {
  Ujian ujian = Ujian();

  for (int i = 0; i < 3; i++) {
    stdout.write('nama murid: ');
    stdin.readLineSync();

    stdout.write('masukkan nilai: ');
    int nilai = int.parse(stdin.readLineSync()!);

    ujian.tambahNilai(nilai);
  }

  print('Rata-rata: ${ujian.rataRata()}');
}