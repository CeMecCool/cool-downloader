#!/bin/bash

if [ ! -d "Téléchargements/Images" ]; then
  mkdir -p "Téléchargements/Images"
fi

clear

while true; do
    echo "Cool Downloader 0.0.2"
    echo "Dossier actuel : $(pwd)"
    echo "--------------------------------------------------------------------------------"
    echo ""
    echo "       [1] Youtube Archive"
    echo "       [2] Gallery-DL"
    echo ""
    echo "       [3] Vidéos et miniatures"
    echo "       [4] Vidéos, miniatures et commentaires"
    echo ""
    echo "       [5] Musiques"
    echo ""
    echo "       [6] Gallery-DL (cookies.txt)"
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo ""
    echo "       [7] MP3                           [9] Mettre à jour Yt-dlp"
    echo "       [8] MP4                           [10] Mettre à jour Gallery-dl"
    echo "                                         [11] Mettre à jour FFMPEG"
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo ""
    echo "       [0] Quitter"
    echo ""

    read -rp "Choix: " choice
    case $choice in
    
        1)
            read -rp "Liens: " URL

            current_date_time=$(date +"%Y-%m-%d %H:%M:%S")
            echo "$current_date_time" >> historique.txt
            echo "$URL" >> historique.txt
            echo "" >> historique.txt

            yt-dlp --skip-download --print-to-file "%(channel_url)s" temp.txt --playlist-items 1 $URL
            yt-dlp -o "Téléchargements/YouTube/%(uploader)s - %(channel_id)s/%(uploader)s.%(ext)s" --write-thumbnail --playlist-items 0 -a temp.txt
            yt-dlp -o "Téléchargements/YouTube/%(uploader)s - %(channel_id)s/%(upload_date>%d-%m-%Y)s - %(title)s - %(id)s/%(upload_date>%d-%m-%Y)s - %(title)s - %(id)s.%(ext)s" --print-to-file "%(uploader)s | %(upload_date>%d-%m-%Y)s | %(like_count)s Likes | La vidéo dure %(duration_string)s secondes | %(view_count)s vues | %(original_url)s | %(title)s" "Téléchargements/YouTube/%(uploader)s - %(channel_id)s/liens_vidéos.txt" --replace-in-metadata title "[\U00010000-\U0010ffff]" "" --write-thumbnail --write-description --write-comments --merge-output-format mp4 $URL
            
            echo ""
            echo "Téléchargement terminé"
            echo ""
            
            ;;
        
        2)
            echo ""
            echo "AVERTISSEMENT: Pour utiliser les cookies faut choisir 6"
            read -rp "Liens: " URL

            current_date_time=$(date +"%Y-%m-%d %H:%M:%S")
            echo "$current_date_time" >> historique.txt
            echo "$URL" >> historique.txt
            echo "" >> historique.txt
            
            cd "Téléchargements/Images"
            gallery-dl $URL
            cd ../../
  
            echo ""
            echo "Téléchargement terminé"
            echo ""
            
            ;;

        3)
            read -rp "Liens: " URL
            
            current_date_time=$(date +"%Y-%m-%d %H:%M:%S")
            echo "$current_date_time" >> historique.txt
            echo "$URL" >> historique.txt
            echo "" >> historique.txt
            
            yt-dlp -o "Téléchargements/Vidéos/%(webpage_url_domain)s/%(uploader)s - %(uploader_id)s/%(upload_date>%d-%m-%Y)s - %(title)s - %(id)s/%(upload_date>%d-%m-%Y)s - %(title)s - %(id)s.%(ext)s" --replace-in-metadata title "[\U00010000-\U0010ffff]" "" --write-thumbnail --merge-output-format mp4 $URL
  
            echo ""
            echo "Téléchargement terminé"
            echo ""
            
            ;;

        4)
            read -rp "Liens: " URL
            
            current_date_time=$(date +"%Y-%m-%d %H:%M:%S")
            echo "$current_date_time" >> historique.txt
            echo "$URL" >> historique.txt
            echo "" >> historique.txt
            
            yt-dlp -o "Téléchargements/Vidéos/%(webpage_url_domain)s/%(uploader)s - %(uploader_id)s/%(upload_date>%d-%m-%Y)s - %(title)s - %(id)s/%(upload_date>%d-%m-%Y)s - %(title)s - %(id)s.%(ext)s" --replace-in-metadata title "[\U00010000-\U0010ffff]" "" --write-thumbnail --write-comments --merge-output-format mp4 $URL
  
            echo ""
            echo "Téléchargement terminé"
            echo ""

            ;;

        5)
            read -rp "Liens: " URL
            
            current_date_time=$(date +"%Y-%m-%d %H:%M:%S")
            echo "$current_date_time" >> historique.txt
            echo "$URL" >> historique.txt
            echo "" >> historique.txt

            yt-dlp -o "Téléchargements/Musiques/%(webpage_url_domain)s/%(uploader)s - %(uploader_id)s/%(upload_date>%d-%m-%Y)s - %(title)s - %(id)s/%(upload_date>%d-%m-%Y)s - %(title)s - %(id)s.%(ext)s" --replace-in-metadata title "[\U00010000-\U0010ffff]" "" --write-thumbnail --write-description --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-format mp3 $URL
  
            echo ""
            echo "Téléchargement terminé"
            echo ""
            
            ;;

        6)
            read -rp "Liens: " URL

            current_date_time=$(date +"%Y-%m-%d %H:%M:%S")
            echo "$current_date_time" >> historique.txt
            echo "$URL" >> historique.txt
            echo "" >> historique.txt

            cd "Téléchargements/Images"
            gallery-dl --cookies "COOKIES.txt" $URL
            cd ../../
            
            echo ""
            echo "Téléchargement terminé"
            echo ""

            ;;
            
        7)
            read -rp "Liens: " URL

            current_date_time=$(date +"%Y-%m-%d %H:%M:%S")
            echo "$current_date_time" >> historique.txt
            echo "$URL" >> historique.txt
            echo "" >> historique.txt
            
            yt-dlp -o "Téléchargements/Bordel/MP3/%(title)s.%(ext)s" --replace-in-metadata title "[\U00010000-\U0010ffff]" "" --extract-audio --audio-format mp3 $URL
  
            echo "" 
            echo "Téléchargement terminé"
            echo ""      
            
            ;;
            
        8)
            read -rp "Liens: " URL
            
            current_date_time=$(date +"%Y-%m-%d %H:%M:%S")
            echo "$current_date_time" >> historique.txt
            echo "$URL" >> historique.txt
            echo "" >> historique.txt
            
            yt-dlp -o "Téléchargements/Bordel/MP4/%(title)s.%(ext)s" --replace-in-metadata title "[\U00010000-\U0010ffff]" "" --merge-output-format mp4 $URL
  
            echo "" 
            echo "Téléchargement terminé"
            echo ""
            
            ;;

        9)  
            sudo pip install --upgrade yt-dlp
            echo ""
            echo "Mise a jour effectuée"
            echo ""

            ;;

        10)  
            sudo pip install --upgrade gallery-dl
            echo ""
            echo "Mise a jour effectuée"
            echo ""

            ;;

        11)  
            sudo apt --only-upgrade install ffmpeg
            echo ""
            echo "Mise a jour effectuée"
            echo ""

            ;;
            
        0)
            exit
            
            ;;
            
        *)  
            echo ""
            echo "Choix invalide, veuillez sélectionner un choix valide."
            echo ""
            
            ;;
    esac
done
