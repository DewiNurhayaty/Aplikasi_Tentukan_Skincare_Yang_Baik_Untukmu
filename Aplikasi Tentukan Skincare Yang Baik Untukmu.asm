.MODEL SMALL
.CODE

ORG 100h

JMP Mulai

;Variabel
nama    DB 0dh, 0ah, 0dh, 0ah, "Masukan Nama : ", '$'
id      DB 0dh, 0ah, "Masukan ID Anda : ", '$'
psn1    DB "PROGRAM PEMINJAMAN BARANG SEDERHANA", 0dh, 0ah, "----------------------------", '$' 
psn2    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Selamat Datang Di Toko Dewi Skincare....", '$' 
psn3    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Produk Yang Ingin Anda Beli ", 0dh, 0ah 
        DB "=====================", 0dh, 0ah
        DB "=   1. Sunscreen    =", 0dh, 0ah
        DB "=   2. Facial Wash  =", 0dh, 0ah
        DB "=   3. Moisturizer  =", 0dh, 0ah
        DB "=   4. Serum        =", 0dh, 0ah
        DB "=====================", 0dh, 0ah
        DB 0dh, 0ah, "Produk Yangn Ingin Anda Beli ? ", '$'

psn4    DB 0dh, 0ah, "Pembelian Berhasil...", '$'
psn5    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "========================= PEMBELIAN SELESAI =====================", 0dh, 0ah
        DB "Silahkan Ambil Produk Anda Di Kasir", 0dh, 0ah, "membawa bukti pembelian yang sudah di cetak", '$'

psn6    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Ingin Membeli Produk Lain ? (Y, N)", '$'
psn7    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Terimakasih Telah Menggunkan Aplikasi Ini..", '$'
error   DB 0dh, 0ah, "Masukan Kode Dengan Benar", '$'
msg1    DB 0dh, 0ah, 0dh, 0ah, "====== Sunscreen ======", 0dh, 0ah, "Barang Yang Sudah Di Beli", 0dh, 0ah, "Tidak Dapat Dikembalikan" , '$'
msg2    DB 0dh, 0ah, 0dh, 0ah, "====== Facial Wash ======", 0dh, 0ah, "Barang Yang Sudah Di Beli", 0dh, 0ah, " Tidak Dapat Dikembalikan" , '$'
msg3    DB 0dh, 0ah, 0dh, 0ah, "====== Moisturizer ======", 0dh, 0ah, "Barang Yang Sudah Di Beli", 0dh, 0ah, " Tidak Dapat Dikembalikan" , '$'
msg4    DB 0dh, 0ah, 0dh, 0ah, "====== Serum ======", 0dh, 0ah, "Barang Yang Sudah Di Beli", 0dh, 0ah, " Tidak Dapat Dikembalikan" , '$'
msg5    DB 0dh, 0ah, 0dh, 0ah, "Ketik 'E' Untuk Mencetak Bukti dan Keluar dari program.... ", '$'

tampung_nama DB 30, ?, 30 dup(?)
tampung_id DB 30, ?, 30 dup(?)
        
        
Mulai:
    MOV ah, 09
    LEA dx, psn1
    INT 21h
    
    MOV ah, 09
    LEA dx, nama
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_nama
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, id
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_id
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, psn2
    INT 21h
    
Mulai2:
    MOV ah, 09
    LEA dx, psn3
    INT 21h
    
Proses:
    MOV ah, 01
    INT 21h
    
    CMP al, '1'
    JE produk_1
    
    CMP al, '2'
    JE produk_2
    
    CMP al, '3'
    JE produk_3
    
    CMP al, '4'
    JE produk_4
    
    JNE psn_error
    
Proses2:
    MOV ah, 09
    LEA dx, psn6
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'Y'
    JE pinjam_lagi
    
    CMP al, 'y'
    JE pinjam_lagi
    
    CMP al, 'N'
    JE pinjam_selesai
    
    CMP al, 'n'
    JE pinjam_selesai
    
    JNE psn_error2

produk_1:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg1
     INT 21h   
     
     JMP Proses2
     
produk_2:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg2
     INT 21h   
     
     JMP Proses2

produk_3:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg3
     INT 21h   
     
     JMP Proses2 
     
produk_4:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg4
     INT 21h   
     
     JMP Proses2

pinjam_lagi:
    JMP Mulai2

pinjam_selesai:
    MOV ah, 09
    LEA dx, psn5
    INT 21h
    JMP Konfirmasi

psn_error:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Mulai2

psn_error2:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Proses2

Konfirmasi:
    MOV ah, 09
    LEA dx, msg5
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'E'
    JE Exit
    
    CMP al, 'e'
    JE Exit
    
    JNE psn_error
    
 

JMP Exit

Exit:
    MOV ah, 09
    LEA dx, psn7
    INT 21h 
    
    INT 20h
     
RET