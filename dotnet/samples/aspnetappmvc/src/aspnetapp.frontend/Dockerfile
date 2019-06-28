
ARG sdkImage
ARG sdkTag
ARG runtimeImage
ARG runtimeTag
ARG coreversion
ARG framework

# Build image
FROM ${sdkImage}:${sdkTag} as builder
RUN dotnet publish "./src/aspnetapp.frontend/aspnetapp.frontend.csproj" -c Release -p:NetCoreVersion=${coreversion} -o /app
RUN echo npm -v

# App image
FROM ${runtimeImage}:${runtimeTag} AS final
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "aspnetapp.frontend.dll"]
