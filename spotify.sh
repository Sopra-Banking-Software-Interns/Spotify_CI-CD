TOKEN=$(curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=${{ variables.ID }}&client_secret=${{ variables.SECRET }}" | jq -r '. | .access_token')

ARTIST=$(curl "https://api.spotify.com/v1/artists/4Z8W4fKeB5YxbusRsdQVPb" \
     -H "Authorization: Bearer $TOKEN" | jq -r '.images[0].url')

touch download.jpeg
curl -o download.jpeg $ARTIST
