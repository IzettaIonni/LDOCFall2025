#Use the official Mealie image as base
FROM ghcr.io/mealie-recipes/mealie:v1.6.0


#Set environment variables if needed (override defaults)
ENV ALLOW_SIGNUP=true \
    PUID=1000 \
    PGID=1000 \
    TZ=UTC \
    BASE_URL=http://localhost:9000


#Expose the default Mealie port
EXPOSE 9000


CMD ["mealie"]
