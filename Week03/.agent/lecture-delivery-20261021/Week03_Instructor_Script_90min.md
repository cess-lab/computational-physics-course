# Week 03 — 90-minute lecture delivery script

**INSTRUCTOR ONLY — spoken BM Malaysia; technical terms in English.** This is an oral delivery script, not an additional student learning note. Keep student-facing course materials in English.

Use the existing 15-slide deck and the canonical lecture Live Script. The 90 minutes include spoken explanation, prediction, paired discussion, code tracing, MATLAB execution, and exit-ticket responses. The audio contains the spoken script only; it does not pretend to include student answers or a recorded MATLAB session.

## Before class

- Open the final PPTX and the lecture Live Script in MATLAB R2025a or later. Use a fresh MATLAB session, preserve any unrelated work, and run the demonstration sections in order.
- Keep the baseline source file intact. Use an unsaved instructor scratch copy for modifications. Do not run optional stretch sections during the Core route.
- Baseline: R1=2 Ω; R2=3 Ω; Rs=1 Ω; V1=5 V; V2=2 V. A=[3 −1; −1 4] Ω, b=[5; 2] V, x=[2; 1] A, shared current=1 A downward.
- Ask for a prediction before each reveal. Wait for responses; supply the suggested answer only after students have tried.

## Delivery map

| Elapsed | Slide | Focus |
|---|---:|---|
| 00:00–04:00 | 1 | From a circuit to a checked solution |
| 04:00–12:00 | 2 | Choose directions before algebra |
| 12:00–22:00 | 3 | Write the two physical equations |
| 22:00–30:00 | 4 | Map equations into rows |
| 30:00–34:00 | 5 | Audit the units |
| 34:00–40:00 | 6 | Trace all four coefficients |
| 40:00–52:00 | 7 | MATLAB demo: build and solve |
| 52:00–56:00 | 8 | MATLAB demo: recover branch current |
| 56:00–64:00 | 9 | MATLAB demo: direct substitution |
| 64:00–68:00 | 10 | Interpret the checked result |
| 68:00–76:00 | 11 | MATLAB demo: a plausible wrong sign |
| 76:00–77:00 | 12 | Optional: recognise a larger system |
| 77:00–78:00 | 13 | Optional: sketch the scaffold |
| 78:00–85:00 | 14 | MATLAB demo: representation or physics? |
| 85:00–90:00 | 15 | Exit ticket and capstone direction |

If behind: omit the two optional bridge slides and use their two minutes for Core validation. Preserve the wrong-sign diagnosis and exit ticket. For an on-time route, keep bridge exposure to one minute per slide.

## 00:00–04:00 · Slide 1 · From a circuit to a checked solution

**Delivery action (do not narrate):** Keep MATLAB closed initially. Ask for a show of hands, then take two responses.

**Say:**

Assalamualaikum dan salam sejahtera semua. Hari ini kita akan gunakan satu litar yang kecil untuk belajar cara menyelesaikan linear systems. Kita ada dua loop, dua arus yang belum diketahui, dan dua persamaan Kirchhoff. Physics yang kita gunakan masih biasa. Yang kita nak bina ialah hubungan antara litar, persamaan, matriks, dan keputusan komputer.

Cuba bayangkan saya terus tunjuk dua nombor daripada MATLAB. Adakah dua nombor itu sudah cukup untuk kita kata jawapannya betul? Ambil sekejap untuk fikir. Kita perlu tahu nombor itu mewakili apa, unitnya apa, arah arus yang kita andaikan, dan bagaimana kita semak keputusan tersebut. Komputer boleh menyelesaikan persamaan yang kita beri, termasuk persamaan yang tersalah bina.

Ada tiga perkara utama hari ini. Pertama, pilih unknowns dan arah, kemudian tulis persamaan daripada model fizikal. Kedua, susun persamaan itu sebagai A darab x sama dengan b, dan gunakan MATLAB backslash. Ketiga, masukkan jawapan kembali ke persamaan asal dan terangkan maksud fizikalnya. Kita akan buat prediction dahulu, bukan tunggu komputer bagi jawapan baru kita cuba cari cerita.

Saya akan berhenti beberapa kali untuk kamu bincang dan trace kod. Tak perlu tulis program dari kosong. Gunakan scaffold yang diberi. Kalau kamu boleh jelaskan satu coefficient datang dari mana, baca dua entry output dengan betul, dan tunjuk satu validation check, itu kemahiran yang kita sedang bina. Mari mula dengan litar, sebelum kita sentuh MATLAB.

**Pause / student task:** What would make two current values credible?

**Expected response / repair:** A defined model, units, a check against the original equations, and a physical interpretation.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 04:00–12:00 · Slide 2 · Choose directions before algebra

**Delivery action (do not narrate):** Pairs: trace both clockwise arrows. Draw the top-junction current balance. Ask a student to explain why currents subtract.

**Say:**

Lihat nilai komponen dahulu. Resistor persendirian di kiri ialah dua ohm. Di kanan, tiga ohm. Resistor yang dikongsi di tengah ialah satu ohm. Sumber kiri lima volt, dan sumber kanan dua volt. Kita gunakan model litar arus terus dengan resistor ideal dan nilai sumber yang tetap.

Kita pilih kedua-dua mesh current mengikut arah jam. Pilihan arah ini ialah reference untuk tanda. Ia bukan jaminan bahawa arus sebenar mesti ikut arah yang kita pilih. Kalau jawapan negatif nanti, kita baca semula arah sebenar berbanding reference tersebut.

Sekarang lihat junction di atas resistor tengah. Arus I satu masuk dari kiri. Arus I dua keluar ke kanan. Arus shared yang kita tandakan pula keluar ke bawah. Jadi, arus masuk sama dengan jumlah arus keluar. I satu sama dengan I dua tambah I shared. Susun semula: I shared sama dengan I satu tolak I dua.

Mengapa bukan tambah? Sebab pada branch tengah, kedua-dua mesh current melalui arah yang bertentangan. Mesh kiri menyumbang ke bawah; mesh kanan menyumbang ke atas. Arus fizikal pada resistor tengah ialah beza dua sumbangan ini. Mesh current ialah unknown yang kita pilih untuk memudahkan persamaan. Branch current ialah arus sebenar dalam branch tersebut.

Bincang dengan orang sebelah. Jika I satu dua ampere dan I dua satu ampere, berapa arus ke bawah? Kemudian uji sebaliknya: kalau I satu satu ampere dan I dua dua ampere, apakah maksud tanda negatif? Jawapannya satu ampere ke atas. Kita belum menyelesaikan litar; kita sedang melatih cara membaca tanda.

Berdasarkan sumber dan rintangan ini, kita jangka I satu lebih besar daripada I dua. Anggap itu prediction yang munasabah untuk litar ini, bukan hukum umum bahawa sumber lebih besar sentiasa menghasilkan mesh current lebih besar. Loop ini saling berkait melalui resistor tengah. Kita akan semak prediction selepas solve.

**Pause / student task:** If I1 = 2 A and I2 = 1 A, what flows down the shared branch?

**Expected response / repair:** 1 A downward. At the upper junction, 2 A enters; 1 A leaves right and 1 A leaves down.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 12:00–22:00 · Slide 3 · Write the two physical equations

**Delivery action (do not narrate):** Board work: expand each shared-resistor term. Students fill the two missing signs before revealing the numeric equations.

**Say:**

Kita sekarang berjalan satu loop pada satu masa. Untuk loop kiri, jumlah voltage drop pada resistor mesti sepadan dengan sumber lima volt, dengan polarity dan arah traversal yang ditunjukkan. Resistor kiri membawa I satu. Resistor tengah membawa I satu tolak I dua dalam arah loop kiri.

Jadi kita tulis: R satu darab I satu, tambah R shared darab kurungan I satu tolak I dua, sama dengan V satu. Kembangkan kurungan itu perlahan-lahan. Terma I satu menjadi R satu tambah R shared. Terma I dua menjadi negatif R shared. Maka persamaannya ialah, kurungan R satu tambah R shared, darab I satu, tolak R shared darab I dua, sama dengan V satu.

Dengan nilai yang diberi, dua tambah satu menjadi tiga. Kita dapat tiga I satu tolak I dua sama dengan lima. Setiap terma di kiri ialah voltage drop, jadi unitnya volt. Tiga itu mewakili tiga ohm, bukan nombor tanpa unit.

Untuk loop kanan pula, current difference pada resistor tengah dalam arah traversal loop kanan ialah I dua tolak I satu. Jadi R dua darab I dua, tambah R shared darab kurungan I dua tolak I satu, sama dengan V dua. Selepas dikembangkan, negatif R shared darab I satu, tambah kurungan R dua tambah R shared darab I dua, sama dengan V dua. Secara nombor, negatif I satu tambah empat I dua sama dengan dua.

Sekarang tutup bahagian jawapan sekejap. Dalam pasangan, seorang jelaskan loop kiri dan seorang jelaskan loop kanan. Jangan hanya sebut negatif satu kerana nampak pattern matriks. Jelaskan arah arus pada resistor yang dikongsi. Jika kamu tersangkut, kembali kepada kurungan current difference sebelum expand.

Kita tidak perlu hafal semua bentuk matriks litar. Kita perlu pastikan setiap persamaan boleh dibaca semula sebagai physical loop. Sebelum bergerak, semak dua perkara: tanda sumber mengikut polarity yang dilukis, dan setiap resistance kali current menghasilkan volt. Inilah jambatan daripada physical model kepada algebra.

**Pause / student task:** Why is the coefficient of I2 negative in the left-loop equation?

**Expected response / repair:** The shared drop is Rs(I1 − I2), so expansion gives −Rs I2.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 22:00–30:00 · Slide 4 · Map equations into rows

**Delivery action (do not narrate):** Students fill A=[3 __; __ 4] and b=[__; __]. Trace A(1,2) and x(2), without solving.

**Say:**

Kita sudah ada dua persamaan. Sekarang kita ubah cara menyimpan maklumat yang sama. Kita tetapkan x sebagai satu column vector: I satu di atas, I dua di bawah. Susunan unknown ini mesti konsisten sepanjang pengiraan.

Baris pertama datang daripada persamaan loop kiri. Coefficient untuk I satu ialah tiga, dan coefficient untuk I dua ialah negatif satu. Jadi baris pertama A ialah tiga, negatif satu. Sumber yang sepadan ialah lima volt, jadi entry pertama b ialah lima.

Baris kedua datang daripada persamaan loop kanan. Coefficient untuk I satu ialah negatif satu, dan coefficient untuk I dua ialah empat. Maka baris kedua A ialah negatif satu, empat. Entry kedua b ialah dua volt. A mempunyai dua baris dan dua column. x dan b masing-masing dua baris dan satu column.

Baca matrix multiplication sebagai persamaan. Baris pertama A darab x bermaksud tiga darab I satu, tambah negatif satu darab I dua. Itulah tiga I satu tolak I dua sama dengan lima. Baris kedua pula membina semula persamaan kanan. Matriks tidak menggantikan physics; ia menyimpan coefficient secara teratur.

Cuba lengkapkan dua entry kosong yang saya tunjuk. Kemudian tunjuk entry pada baris dua, column satu. Entry itu berkait dengan persamaan mana dan unknown mana? Jawapannya ialah persamaan loop kanan dan unknown I satu. Unit coefficient itu ohm.

Kita juga perlu bezakan indexing. Dalam MATLAB, x kurungan dua bermaksud entry kedua vector, iaitu I dua. A kurungan satu koma dua bermaksud baris satu, column dua, iaitu coefficient I dua dalam persamaan pertama. Ambil masa untuk trace kedua-dua contoh ini dengan jari. Kesilapan susunan boleh menghasilkan nombor yang kelihatan munasabah tetapi merujuk kepada masalah yang lain.

**Pause / student task:** Which coefficient belongs in row 2, column 1?

**Expected response / repair:** −1 ohm: the coefficient multiplying I1 in the right-loop equation.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 30:00–34:00 · Slide 5 · Audit the units

**Delivery action (do not narrate):** Quick response: identify units of A, x, b and one expanded term. Clarify that the variable A_ohm is a matrix, while A is also the unit symbol for ampere.

**Say:**

Sebelum solve, kita semak unit. Matrix A menyimpan resistance, jadi unit entrynya ohm. Vector x menyimpan current dalam ampere. Vector b menyimpan source voltage dalam volt. Maka A darab x mempunyai unit ohm kali ampere, iaitu volt. Kedua-dua belah persamaan mempunyai unit yang sama.

Ada satu perkara yang boleh mengelirukan. Huruf besar A digunakan sebagai nama coefficient matrix. Simbol A juga digunakan untuk unit ampere. Dalam kod, kita gunakan nama A underscore ohm supaya jelas bahawa matrix itu mengandungi resistance. Nama x underscore A pula menunjukkan current dalam ampere. Suffix pada nama variable membantu pembaca, tetapi MATLAB tidak melakukan unit checking secara automatik hanya kerana nama itu ada perkataan ohm atau volt.

Cuba baca terma pertama: tiga ohm darab I satu ampere. Hasilnya volt. Terma seterusnya, negatif satu ohm darab I dua ampere, juga volt. Kita hanya boleh tambah dan tolak kuantiti yang mempunyai unit serasi dalam persamaan ini.

Jika seseorang memasukkan nilai current ke dalam b kerana tersilap salin, kod mungkin masih berjalan sebagai operasi nombor. Unit check membantu kita nampak bahawa model itu tidak konsisten. Tetapi unit yang betul sahaja belum membuktikan tanda dan sambungan litar betul. Kita perlukan kedua-duanya: unit yang konsisten dan coefficient yang sepadan dengan persamaan asal.

Sekarang jawab secara ringkas: unit A apa, unit x apa, unit b apa? Kemudian terangkan satu terma dengan ayat penuh. Kita mahu boleh membaca nombor sebagai kuantiti fizikal.

**Pause / student task:** If A stores resistance, what must the units of x be?

**Expected response / repair:** Amperes, because resistance × current gives voltage.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 34:00–40:00 · Slide 6 · Trace all four coefficients

**Delivery action (do not narrate):** Cold-call with support: each pair explains one entry. Repair by returning to expanded KVL, not by memorising a sign pattern.

**Say:**

Ini audit terakhir sebelum kita minta MATLAB solve. Kita baca empat entry A satu per satu. Entry baris satu, column satu ialah tiga ohm. Ia datang daripada resistor kiri dua ohm tambah resistor shared satu ohm, kedua-duanya mendarab I satu dalam persamaan kiri.

Entry baris satu, column dua ialah negatif satu ohm. Ia datang daripada sumbangan negatif R shared darab I dua dalam persamaan kiri. Entry baris dua, column satu juga negatif satu ohm, tetapi kali ini ia datang daripada sumbangan negatif R shared darab I satu dalam persamaan kanan. Nilai sama tidak bermaksud kita boleh abaikan maksud baris dan column.

Entry baris dua, column dua ialah empat ohm. Ia datang daripada resistor kanan tiga ohm tambah resistor shared satu ohm, yang mendarab I dua dalam persamaan kanan. Semua empat entry masih boleh ditunjuk balik kepada litar.

Sekarang setiap pasangan pilih satu entry. Terangkan nilainya, tandanya, unitnya, dan persamaan yang diwakilinya. Pasangan lain semak menggunakan persamaan, bukan berdasarkan warna pada slide sahaja. Jika ada yang kata off-diagonal mesti sentiasa negatif, kita perhalus ayat itu. Untuk pilihan dua mesh clockwise dan resistor shared dalam litar ini, coefficient tersebut negatif kerana current contributions bertentangan. Tanda datang daripada model dan convention yang dipilih.

Bayangkan saya tersalah taip plus satu pada top-right. Adakah MATLAB akan tahu bahawa kita tersalah tulis physical model? Tidak semestinya. Solver menerima coefficient yang kita masukkan. Sebab itulah audit sebelum solve menjimatkan masa debugging kemudian.

Bila kamu boleh trace semua empat entry, barulah matrix itu menjadi ringkasan yang boleh dipercayai. Kita sudah ada model, unknown order, equations, dan unit. Sekarang kita buka Live Script dan lihat bagaimana struktur yang sama muncul dalam kod.

**Pause / student task:** Where does A22 = 4 ohm come from?

**Expected response / repair:** R2 + Rs = 3 + 1 ohm in the right-loop equation.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 40:00–52:00 · Slide 7 · MATLAB demo: build and solve

**Delivery action (do not narrate):** DEMO A — Run sections: Circuit Model → Map the Equations → Solve. Read KVL text between them. Stop before shared-current section. Students trace semicolons and x_A indexing; do not Run All yet.

**Say:**

Kita buka Live Script lecture yang diberi. Untuk demo ini, jalankan section mengikut urutan dari atas. Saya mulakan daripada fresh MATLAB session supaya tiada variable lama yang membantu secara senyap. Kita belum tekan Run All kerana saya nak kamu nampak hubungan antara section.

Section pertama menyimpan parameter. R satu underscore ohm ialah dua, R dua underscore ohm ialah tiga, R shared underscore ohm ialah satu. V satu underscore V ialah lima, dan V dua underscore V ialah dua. Semak nilai ini dengan litar pada slide. Nama variable yang panjang sedikit membantu kita ingat kuantiti dan unitnya.

Seterusnya kita bina A underscore ohm. Baris pertama mempunyai R satu tambah R shared, kemudian negatif R shared. Semicolon di dalam square brackets memulakan baris baharu. Baris kedua mempunyai negatif R shared, kemudian R dua tambah R shared. Tiga titik pada hujung baris kod hanya menyambung arahan ke baris berikutnya supaya lebih mudah dibaca.

Vector b dibina dengan lima di atas dan dua di bawah. Semicolon di dalam kurungan itu menghasilkan column vector. Ini berbeza daripada semicolon di hujung arahan, yang biasanya menyembunyikan paparan output. Tengok dimensi yang kita jangka: A dua kali dua, b dua kali satu.

Sekarang baris solve: x underscore A sama dengan A underscore ohm backslash b underscore V. Backslash bermaksud selesaikan linear system yang dinyatakan oleh A dan b. Kita menggunakan syntax yang dibekalkan. Kita tidak perlu menulis algoritma matrix solver sendiri hari ini.

Sebelum saya run, tulis makna entry pertama dan entry kedua. Selepas run, kita dapat I satu dua ampere, dan I dua satu ampere. Jangan berhenti pada dua nombor itu. Kaitkan entry pertama dengan unknown order tadi. Jika saya tukar susunan unknown tetapi masih baca output dengan susunan lama, interpretation akan salah.

Sekarang ambil masa untuk trace kod pada laptop atau kertas. Tunjuk baris yang menyimpan physics input, baris yang membina coefficient matrix, dan baris yang menyelesaikan unknowns. Jika kod kamu gagal kerana satu variable belum wujud, kembali ke section parameter dan jalankan ikut urutan. Kita akan validate output ini sebentar lagi.

**Pause / student task:** Before running: what do x_A(1) and x_A(2) represent?

**Expected response / repair:** Left mesh current and right mesh current, in amperes, in the declared order. Expected: 2 A and 1 A.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 52:00–56:00 · Slide 8 · MATLAB demo: recover branch current

**Delivery action (do not narrate):** DEMO B — Run Reconstruct the Shared-Branch Current only. Compare sign to the downward reference arrow.

**Say:**

Kita sudah ada dua mesh current. Tetapi resistor tengah tidak membawa dua ampere tambah satu ampere. Ia dikongsi oleh dua mesh dengan sumbangan yang bertentangan arah. Jadi kita kembali kepada equation yang dibina di junction tadi: I shared sama dengan I satu tolak I dua.

Dalam Live Script, jalankan section Reconstruct the Shared-Branch Current. Baris kodnya ialah I shared underscore A sama dengan I satu underscore A tolak I dua underscore A. Dengan nilai dua dan satu ampere, hasilnya satu ampere. Tanda positif bermaksud arus net mengikut reference shared yang kita pilih, iaitu ke bawah.

Cuba terangkan menggunakan junction. Dua ampere datang dari kiri. Satu ampere meneruskan ke kanan. Maka satu ampere lagi turun melalui resistor tengah. Penjelasan ini membantu kita hubungkan unknown matematik dengan branch fizikal.

Sekarang saya ubah soalan secara lisan sahaja. Jika subtraction menghasilkan negatif kosong perpuluhan empat ampere, adakah kita buang tanda negatif dan kata error? Tidak. Kita kata arus sebenar kosong perpuluhan empat ampere melawan reference yang dipilih. Magnitude dan direction perlu dibaca bersama.

Bincang cepat dengan orang sebelah: satu ayat untuk beza mesh current dan branch current. Mesh current ialah unknown loop yang memudahkan pembentukan equation. Shared branch current ialah beza dua mesh contributions untuk convention ini. Kita tidak perlu tambah unknown baharu untuk branch tengah, sebab nilainya boleh direconstruct daripada dua unknown sedia ada.

**Pause / student task:** Why is the shared branch not carrying 3 A?

**Expected response / repair:** The two clockwise mesh contributions oppose in that branch.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 56:00–64:00 · Slide 9 · MATLAB demo: direct substitution

**Delivery action (do not narrate):** DEMO C — Predict 5 and 2 before running Core Validation. Expand 3(2)−1 and −2+4(1) on the board. Explain 1e−12 V tolerance.

**Say:**

Sekarang kita buat check yang wajib. Kita tidak menerima output hanya kerana MATLAB tidak memaparkan error. Kita masukkan dua current yang dikira kembali ke persamaan Kirchhoff asal.

Untuk kiri, tiga ohm darab dua ampere, tolak satu ohm darab satu ampere. Enam volt tolak satu volt, jadi lima volt. Itu sepadan dengan source kiri. Untuk kanan, negatif satu ohm darab dua ampere, tambah empat ohm darab satu ampere. Negatif dua volt tambah empat volt, jadi dua volt. Itu sepadan dengan source kanan.

Sebelum run section Core Validation, tulis dahulu dua nilai yang kamu jangka: lima volt dan dua volt. Kemudian lihat bagaimana kod membina left reconstructed dan right reconstructed daripada parameter dan solved currents. Kita tolak source voltage masing-masing untuk mendapat validation difference. Bagi jawapan yang betul, kedua-dua differences hampir sifar.

Dalam kod ada assert yang memeriksa sama ada nilai absolute difference terbesar lebih kecil daripada sepuluh kuasa negatif dua belas. Oleh sebab difference ini dalam volt, tolerance itu juga dibaca dalam volt. Untuk contoh kecil ini, tolerance yang sangat kecil masih munasabah. Jangan anggap nilai itu sesuai untuk semua eksperimen atau semua skala masalah.

Mengapa guna tolerance dan bukan paksa equality tepat kepada sifar? Pengiraan komputer menggunakan floating-point numbers. Kadangkala ada beza yang sangat kecil daripada pembundaran. Kita bandingkan dengan tolerance yang sesuai dengan skala dan tujuan pengiraan. Beza kecil akibat arithmetic berbeza daripada mismatch besar akibat model salah.

Sekarang seorang pelajar baca check kiri dengan unit, dan seorang lagi baca check kanan. Terangkan juga had check ini: ia menunjukkan current memenuhi equations yang kita uji. Ia tidak membuktikan bahawa model ideal menangkap semua keadaan litar sebenar. Sebab itulah kita audit litar dan signs dahulu, kemudian validate secara numerik.

Kita kini ada satu set evidence yang jelas: dua current dalam ampere, dua voltage reconstructions yang sepadan dengan source, dan difference yang hampir sifar. Selepas check, barulah kita tafsirkan keputusan fizikal dengan lebih yakin.

**Pause / student task:** Which equations should be used to check the computed currents?

**Expected response / repair:** The original correct Kirchhoff equations, independently of any suspect matrix entry.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 64:00–68:00 · Slide 10 · Interpret the checked result

**Delivery action (do not narrate):** Run Interpret the Result Physically. Ask students to state values, directions, prediction comparison, and one model limitation.

**Say:**

Mari baca nombor kembali pada litar. I satu ialah dua ampere dan positif. Maka current mesh kiri ikut clockwise reference yang kita pilih. I dua ialah satu ampere dan juga positif, jadi ikut clockwise reference kanan. Shared current ialah satu ampere ke bawah untuk reference yang dilukis.

Prediction kita tadi ialah I satu lebih besar daripada I dua. Hasil dua ampere berbanding satu ampere menyokong prediction itu untuk nilai komponen ini. Kita tetap sebut untuk litar ini, kerana current dalam coupled circuit bergantung pada keseluruhan persamaan, bukan satu source sahaja.

Cuba lengkapkan ayat: hasil pengiraan menunjukkan apa, check kita menunjukkan apa, dan model kita mengabaikan apa? Contohnya, hasil menunjukkan shared current satu ampere ke bawah. Substitution menunjukkan kedua-dua KVL equations dipenuhi dalam tolerance. Model menggunakan resistor dan source ideal, jadi ia tidak memasukkan semua kesan komponen sebenar, seperti perubahan resistance dengan suhu.

Kalau output negatif, kita tidak terus ubah arrow dan rerun semata-mata untuk mendapat nombor positif. Kita baca tanda berdasarkan reference yang sudah ditetapkan. Jika mahu menukar convention, equations dan interpretation perlu ditukar secara konsisten.

Inilah maksud physical interpretation. Kita menyebut kuantiti, unit, direction, dan kaitan dengan prediction. Kita juga tahu sejauh mana check kita menyokong jawapan. Nombor yang betul tanpa explanation masih belum menunjukkan bahawa kita memahami model.

**Pause / student task:** What does a negative current mean?

**Expected response / repair:** Actual current flows opposite to the assumed reference direction; it is not automatically a coding error.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 68:00–76:00 · Slide 11 · MATLAB demo: a plausible wrong sign

**Delivery action (do not narrate):** DEMO D — Run Diagnose a Plausible Matrix. Locate A_wrong_sign_ohm(1,2)=+1. Correct only that entry in an instructor scratch copy, rerun and compare. Do not save over the canonical file.

**Say:**

Sekarang kita sengaja lihat satu defect. Matrix yang salah hampir sama dengan matrix asal, tetapi entry baris satu column dua ditukar daripada negatif satu kepada positif satu. Semua entry masih dalam ohm. Saiz matrix masih betul. MATLAB masih boleh solve.

Sebelum run, jangan cuba teka exact output. Sebaliknya, cari hubungan fizikal yang sudah rosak. Top-right coefficient sepatutnya datang daripada negatif R shared darab I dua dalam equation kiri. Bila kita tukar kepada positif, kita telah menukar equation yang diwakili, walaupun syntax sah.

Run section Diagnose a Plausible Matrix with the Wrong Circuit Sign. Kita dapat current yang finite, lebih kurang satu perpuluhan tiga lapan empat enam ampere dan kosong perpuluhan lapan empat enam dua ampere. Output nampak biasa. Tiada tanda bahawa komputer tahu litar yang kita niatkan berbeza daripada matrix yang diberi.

Sekarang lihat wrong model difference. Check ini menggunakan A yang betul, iaitu coefficient daripada original physical equations, untuk menguji current yang datang daripada wrong matrix. Equation kiri mempunyai mismatch lebih kurang negatif satu perpuluhan enam sembilan dua tiga volt. Equation kanan masih sepadan. Itu petunjuk yang tepat: defect kita berada pada equation kiri.

Kalau kita cuma mengira wrong matrix darab wrong solution tolak b, kita mungkin dapat hampir sifar. Itu menunjukkan solver menyelesaikan wrong system dengan baik. Ia tidak membetulkan physical model. Kita mesti check against equations yang memang dimaksudkan oleh litar.

Bincang dalam pasangan. Kenal pasti defect, jelaskan sebab tanda itu salah, dan cadangkan pembaikan minimum. Jawapannya ubah coefficient top-right kepada negatif R shared, kemudian solve dan validate semula. Kita tidak perlu menukar banyak nilai untuk memaksa jawapan nampak cantik.

Cuba bezakan tiga situasi: syntax error menyebabkan arahan gagal dibaca; indexing atau dimension error menyebabkan operasi tidak serasi; physical sign defect pula boleh menghasilkan output tanpa error tetapi tidak memenuhi model yang betul. Kemahiran debugging kita mesti merangkumi ketiga-tiganya.

**Pause / student task:** MATLAB returns finite currents. What evidence would expose the sign defect?

**Expected response / repair:** Substitution in the correct physical equations gives a left-loop mismatch of −22/13 ≈ −1.6923 V; right-loop mismatch is 0 V.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 76:00–77:00 · Slide 12 · Optional: recognise a larger system

**Delivery action (do not narrate):** Recognition only. Do not derive or solve. If behind, skip slides 12–13 and return their two minutes to direct-substitution practice.

**Say:**

Dua slide seterusnya ialah optional future exposure. Kita tidak menambah derivation tiga mesh sebagai keperluan Core hari ini. Lihat idea yang sama pada network lebih besar: tiga mesh current bermaksud tiga unknown dan tiga equation, jadi coefficient matrix bersaiz tiga kali tiga.

Perhatikan resistor R tujuh dikongsi oleh I satu dan I dua. Resistor diagonal R b pula dikongsi oleh I dua dan I tiga. Kita masih bermula dengan connection dan direction sebelum coefficient. Kita berhenti pada recognition ini. Jangan anggap kamu perlu menyelesaikan bridge circuit ini untuk menguasai contoh dua loop hari ini.

**Pause / student task:** What size of A would match three mesh-current unknowns?

**Expected response / repair:** 3×3, with x and b both 3×1.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 77:00–78:00 · Slide 13 · Optional: sketch the scaffold

**Delivery action (do not narrate):** Point-and-name only; no coefficient calculation. Keep this optional task bounded.

**Say:**

Gunakan gambar yang sama untuk satu soalan ringkas. Tunjuk pasangan mesh yang berkongsi R tujuh, kemudian pasangan yang berkongsi R b. Kita cuma mahu lihat struktur hubungan. I satu dan I tiga tidak berkongsi branch secara langsung dalam lukisan ini.

Kalau kamu hendak semak penyelesaian kelak, prinsipnya tetap sama: masukkan current kembali ke original Kirchhoff equations dan terangkan arah serta unit. Kita tidak isi coefficient atau run solver untuk network ini sekarang. Ambil idea bahawa kaedah model, equation, solve, check boleh berkembang, kemudian kita kembali kepada litar dua loop yang sudah kita fahami.

**Pause / student task:** Which current pairs share R7 and Rb?

**Expected response / repair:** R7: I1 and I2. Rb: I2 and I3. No direct shared branch between I1 and I3 in this drawing.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 78:00–85:00 · Slide 14 · MATLAB demo: representation or physics?

**Scientific correction:** Use the Remotion corrected view for slide 14. The original PPTX image has incorrect matrix signs/entries and an inconsistent ordering diagram. The Remotion overlay covers that pane with the verified row-only reorder. If teaching from the original PPTX, skip that pane and demonstrate the correct matrices in MATLAB instead. The canonical PPTX has not been edited.

**Delivery action (do not narrate):** DEMO E — Run Equivalent Equation Ordering, then A Small Source Change. Students change only 2.1 to 2.2 in an unsaved scratch copy: expected [2.01818; 1.05455] A. Restore baseline; skip Optional Stretch.

**Say:**

Sekarang kita bandingkan dua jenis perubahan. Pertama, kita tukar susunan equation. Persamaan kanan diletakkan dahulu dan persamaan kiri kemudian. Untuk mengekalkan masalah yang sama, baris A dan entry b mesti ditukar bersama. Unknown order dalam x kekal I satu, kemudian I dua.

Run section Equivalent Equation Ordering. Kod memilih baris dua kemudian baris satu untuk A, dan melakukan susunan yang sama pada b. Current yang dikira tetap dua ampere dan satu ampere. Maximum difference daripada jawapan asal hampir sifar. Physics tidak berubah; cara kita menyenaraikan equation sahaja berubah.

Jika kita menukar A tetapi tidak b, setiap equation akan dipadankan dengan source yang salah. Itu bukan lagi penulisan semula masalah yang sama. Jadi setiap representation change perlu dilakukan secara konsisten.

Perubahan kedua ialah physical input. Kita ubah source kanan daripada dua volt kepada dua perpuluhan satu volt, sambil mengekalkan resistance dan source kiri. Sebelum run, jangka sama ada satu current sahaja atau kedua-duanya boleh berubah. Oleh sebab dua loop coupled melalui shared resistor, kedua-duanya boleh berubah.

Run section A Small Source Change. I satu menjadi lebih kurang dua perpuluhan kosong kosong sembilan kosong sembilan ampere. I dua menjadi lebih kurang satu perpuluhan kosong dua tujuh dua tujuh ampere. Kedua-duanya meningkat untuk perubahan ini. Kita tidak perlu mengira condition number untuk menjelaskan pemerhatian asas itu.

Sekarang buat satu modification kecil dalam scratch copy. Tukar source kanan kepada dua perpuluhan dua volt. Simpan semua input lain. Predict dahulu, solve, kemudian validate dengan source baharu, bukan dengan dua volt yang lama. Kamu patut mendapat lebih kurang dua perpuluhan kosong satu lapan satu lapan ampere dan satu perpuluhan kosong lima empat lima lima ampere.

Bezakan ayat ini: saya menukar representation, atau saya menukar physical input. Perbezaan itu akan menjadi sangat berguna apabila kita buat parameter sweep minggu depan. Section residual, rank, conditioning, dan power balance dalam Live Script kekal optional stretch. Hari ini direct substitution sudah menjadi check Core kita.

**Pause / student task:** If only the row order changes, should the currents change?

**Expected response / repair:** No, when A and b are reordered together. V2=2.1 V instead gives I1≈2.00909 A, I2≈1.02727 A.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## 85:00–90:00 · Slide 15 · Exit ticket and capstone direction

**Delivery action (do not narrate):** Collect four short responses. Allocate the final minute to the twelve assigned capstone briefs in six families; no Week 3 submission or grade. Do not imply assignments have already been distributed.

**Say:**

Sebelum tamat, kita buat exit ticket yang pendek. Tak perlu tulis program panjang. Pertama, nyatakan dua unknown kita, unitnya, dan reference direction. Kedua, pilih satu coefficient, contohnya entry top-right, dan jelaskan physical origin serta tandanya. Ketiga, tulis satu direct-substitution check menggunakan solved currents. Keempat, terangkan maksud current negatif kosong perpuluhan empat ampere dan nyatakan satu limitation model.

Ambil masa untuk jawab sendiri dahulu. Selepas itu bandingkan dengan seorang rakan. Kalau jawapan kamu hanya tulis MATLAB bagi dua dan satu, tambah maksud fizikalnya. Kalau check kamu hanya kata kod berjaya run, tulis equation yang benar-benar diuji. Kita mahu evidence yang boleh dibaca oleh orang lain.

Untuk recap, kita bermula dengan litar dan reference direction. Shared branch memberi current difference. Dua Kirchhoff equations disusun sebagai dua matrix rows dengan unknown order yang tetap. MATLAB backslash menyelesaikan linear system. Kita kemudian reconstruct shared current, substitute kembali ke original equations, dan baca sign sebagai direction. Salah satu coefficient pun boleh menukar model, walaupun output masih finite.

Akhir sekali, arah capstone kursus ini ialah dua belas assigned briefs dalam enam paired families: projectile motion, circuit behaviour, radiation and detection, thermal behaviour, Monte Carlo physics, dan oscillatory motion. Kita akan gunakan starter material dan satu bounded modification. Week tiga ialah pengenalan problem space; tiada submission capstone atau grade yang perlu dihantar untuk minggu ini. Rujuk brief yang ditetapkan apabila ia dibekalkan, dan minggu empat kita semak scope sambil belajar controlled parameter changes.

Jika satu perkara masih kabur, tulis sama ada masalahnya direction, equation-to-matrix mapping, indexing, atau validation. Itu membantu saya beri correction yang tepat. Untuk latihan sendiri, jalankan semula Live Script dari fresh session dan terangkan sekurang-kurangnya satu baris model, satu baris solve, dan satu check. Terima kasih semua.

**Pause / student task:** State unknowns and units; explain A12; write one check; interpret −0.4 A.

**Expected response / repair:** I1,I2 in A; A12=−Rs from the shared drop; check both original KVL equations; −0.4 A means 0.4 A opposite the chosen reference.

**Pacing:** Finish the spoken portion, then use the remaining segment time for the action and responses. The Remotion Classroom90 timeline holds the slide and prompt after the chapter audio; pause playback whenever live teaching needs more time.

## Instructor repair prompts

- Shared-current sum error: trace the opposing mesh arrows through the shared branch, then use the top-junction balance.
- Matrix/indexing confusion: read “equation row, unknown column” and trace one term back to KVL.
- Finite-output misconception: compare the wrong solution with the correct original physical equations.
- Validation after an input change: update the source used by the check too.
- Silence: give a binary choice, allow private thinking, then pair discussion before asking for a response.

## Audio and Remotion use

- NarrationOnly: spoken rehearsal with slide annotations; no classroom waiting time.
- Classroom90: exactly 90 minutes, with chapter audio followed by silent discussion/demo holds. It is a pacing scaffold, not a recording of a delivered lecture.
- Individual Slide01–Slide15 compositions: chapter practice or manual classroom playback.
- Code cues are verified excerpts and expected outputs, not a screen recording of MATLAB.
- The voice is AI-generated speech, produced using the paid OpenAI Audio API. Disclose this when sharing.
