@echo off
cd /d "d:\web实训\movie-management-system"

echo Downloading Real IMDb Posters...

curl -L "https://m.media-amazon.com/images/M/MV5BMDAyY2FhYjctNDc5OS00MDNlLThiMGUtY2UxYWVkNGY2ZjljXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_1.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BNGEwYjgwOGQtYjg5ZS00Njc1LTk2ZGEtM2QwZWQ2NjdhZTE5XkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_2.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_3.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BMDIxMzBlZDktZjMxNy00ZGI4LTgxNDEtYWRlNzRjMjJmOGQ1XkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_4.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BYjE4NzdmOTYtYjc5Yi00YzBiLWEzNDEtNTgxZGQ2MWVkN2NiXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_5.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BMWJkNTgyYmItMzA1MS00NmZkLTlmZjgtMjc0NzQ5NTcyNTU2XkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_6.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BNjM1ZDQxYWUtMzQyZS00MTE1LWJmZGYtNGUyNTdlYjM3ZmVmXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_7.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BMjQ4YjkxZmYtNWMwMy00NDE0LTg3NWMtZjE5MjlkNGI2MmY4XkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_8.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BNDRhYjRmNjktOTUxOC00Y2U3LWI1YjYtOWIwOWZhZmE5ODFiXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_9.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BMWM5ZjQxM2YtNDlmYi00ZDNhLWI4MWUtN2VkYjBlMTY1ZTkwXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_10.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BMGRjYjA3MjUtODIwMS00ZDIzLWFlN2EtYjJhZjYxMjFlNmRmXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_11.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BN2ExM2M1ZDktOWZlMS00MTVmLWIzMWItNTUxMDcxM2Q0ZWE3XkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_12.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BOTgyOGQ1NDItNGU3Ny00MjU3LTg2YWEtNmEyYjBiMjI1Y2M5XkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_13.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BNGU1M2JhNTAtYTEzOC00NTFjLTlkYWQtYTg1NDQzNDhkZjhlXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_14.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BMTkxNGFlNDktZmJkNC00MDdhLTg0MTEtZjZiYWI3MGE5NWIwXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_15.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BNDBlM2ZmMzMtMWNlYi00ZDg2LWI4MGQtZDgzMTcwZTVjZWMzXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_16.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BN2E5NzI2ZGMtY2VjNi00YTRjLWI1MDUtZGY5OWU1MWJjZjRjXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_17.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BOTYzMDIzODctNWI2Ni00YmU1LWE0ZmItNzFjMmUzNzFlZmRmXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_18.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BYjBkMjgzMzYtNzRiMS00NDc3LWE4YTUtZjYxYjZhNjNhYzhhXkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_19.jpg" --silent
curl -L "https://m.media-amazon.com/images/M/MV5BY2IzNzMxZjctZjUxZi00YzAxLTk3ZjMtODFjODdhMDU5NDM1XkEyXkFqcGc@._V1_QL75_UX1000_.jpg" -o "src\main\webapp\uploads\covers\poster_20.jpg" --silent

echo Downloading Carousel...
echo Shawshank...
curl -L "https://images5.alphacoders.com/423/423783.jpg" -o "src\main\webapp\uploads\carousel\carousel_1.jpg" --silent
echo Dark Knight...
curl -L "https://images6.alphacoders.com/311/311019.jpg" -o "src\main\webapp\uploads\carousel\carousel_2.jpg" --silent
echo Interstellar...
curl -L "https://images4.alphacoders.com/553/553874.jpg" -o "src\main\webapp\uploads\carousel\carousel_3.jpg" --silent

echo Done.
