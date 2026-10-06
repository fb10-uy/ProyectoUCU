# Proyecto Flor - Recursos de Enfermería

Una aplicación Blazor WebAssembly para gestionar recursos educativos de enfermería. Compatible con acceso móvil, offline y deploy gratuito.

## Características

- ? Blazor WebAssembly (cliente/estático)
- ? Responsive Design (móvil-first)
- ? PWA con Service Worker
- ? Navegación sin servidor
- ? MudBlazor componentes
- ? Soporte offline

## Deployment a Cloudflare Pages

### Opción 1: Deploy Manual

1. **Publicar la aplicación:**
   ```bash
   dotnet publish -c Release -o ./publish
   ```

2. **Los archivos estáticos estarán en:**
   ```
   ./publish/wwwroot/
   ```

3. **Subir a Cloudflare Pages:**
   - Ve a [Cloudflare Dashboard](https://dash.cloudflare.com/)
   - Pages > Crear proyecto > Conectar repositorio GitHub
   - Selecciona este repositorio
   - Build command: `dotnet publish -c Release`
   - Build output directory: `ProyectoFlor/bin/Release/net8.0/publish/wwwroot`
   - Deploy

### Opción 2: Deploy Automático (GitHub Actions)

1. **Configurar secretos en GitHub:**
   - Ve a Settings > Secrets and variables > Actions
   - Añade:
     - `CLOUDFLARE_API_TOKEN`: Tu API Token de Cloudflare
     - `CLOUDFLARE_ACCOUNT_ID`: Tu Account ID de Cloudflare

2. **El workflow se ejecutará automáticamente al hacer push a main/master**

### Obtener credenciales Cloudflare

1. Accede a [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Account > API Tokens
3. Create Token > "Edit Cloudflare Workers"
4. Copia el token

Para Account ID:
1. Cloudflare Dashboard > Account > Overview
2. Copy Account ID desde la URL o sidebar

## Desarrollo Local

```bash
# Instalar dependencias
dotnet restore

# Ejecutar en desarrollo
dotnet run

# Acceder a http://localhost:5000
```

## Estructura del Proyecto

```
ProyectoFlor/
??? Components/
?   ??? Pages/          # Páginas Blazor
?   ?   ??? RecursosEnfermeria.razor (home)
?   ?   ??? NotAvailable.razor
?   ??? Layout/         # Layouts
?   ??? Root.razor      # Componente raíz
??? wwwroot/
?   ??? css/            # Estilos
?   ??? images/         # Imágenes
?   ??? manifest.json   # PWA manifest
??? Program.cs          # Configuración WebAssembly
??? ProyectoFlor.csproj # Configuración proyecto
```

## Funcionamiento

- **App.razor**: HTML estático con loader
- **Root.razor**: Componente raíz Blazor
- **Routes.razor**: Router con páginas
- **MainLayout.razor**: Layout principal
- **Offline**: Service Worker cachea assets

## Mobile-First

- Diseño adaptativo (breakpoints: 480px, 768px, 1024px)
- Touch targets ? 44px
- PWA installable
- Viewport meta configurado

## Notas

- No hay servidor backend (todo es estático/client-side)
- Para agregar backend futuro: usar APIs REST externas
- Service Worker cachea assets principales para offline

## Licencia

UCU - Universidad Católica del Uruguay
