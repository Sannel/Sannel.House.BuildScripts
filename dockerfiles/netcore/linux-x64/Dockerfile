ARG tag=3.1
FROM mcr.microsoft.com/dotnet/core/runtime:${tag} AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8443
COPY ${project}/ .
RUN ln -s  /var/run/secrets/kubernetes.io/serviceaccount/ca.crt /etc/ssl/certs/kubernetes.pem \
    && groupadd -g 1200 house \
    && useradd -m house -g house -u 1200 \
    && chown -R house:house /app
USER 1200
ENTRYPOINT ["dotnet", "${project}.dll"]