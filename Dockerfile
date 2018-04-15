# Base Image
FROM nginx

# Copy the source files
COPY dist /usr/share/nginx/html/dist
COPY index.html /usr/share/nginx/html
# Including ALL config (so we can stay environment-agnostic)
COPY config.prod.js /usr/share/nginx/html

# Copy over our script which will determine which config to use based on ENV variables
COPY setConfig.sh /
RUN chmod u+x /setConfig.sh

# Execute our script to set the correct config and launch nginx
ENTRYPOINT /setConfig.sh && nginx -g "daemon off;"
