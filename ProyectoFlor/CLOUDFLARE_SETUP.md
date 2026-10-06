# ?? Configuración de Despliegue en Cloudflare Pages

Guía completa para desplegar **ProyectoFlor** (Blazor WebAssembly) en Cloudflare Pages de forma gratuita y automatizada.

---

## ?? Requisitos Previos

? Repositorio en GitHub: **fb10-uy/ProyectoUCU**  
? Rama principal: **main**  
? Git instalado localmente  
? Cuenta en Cloudflare (gratuita)  
? GitHub personal access token o autenticación configurada

---

## ?? Paso 1: Configurar Secrets en GitHub

Los secretos son necesarios para que GitHub Actions pueda autenticar a Cloudflare.

### Obtener las credenciales de Cloudflare:

1. **Ir a Cloudflare Dashboard**: https://dash.cloudflare.com
2. **Obtener Account ID**:
   - En la esquina superior derecha ? Cuenta ? Sinopsis
   - Copiar el **Account ID**
3. **Crear API Token**:
   - En el menú de la izquierda ? Mi perfil ? Tokens de API
   - Hacer clic en "Crear Token"
   - Usar el template "Cloudflare Pages – All Accounts" o crear uno personalizado con permisos:
     - `Accounts.Cloudflare Pages: Edit`
     - `Accounts.Users: Read`
   - Copiar el token generado

### Agregar secretos a GitHub:

1. **Ir al repositorio**: https://github.com/fb10-uy/ProyectoUCU
2. **Settings** ? **Secrets and variables** ? **Actions**
3. **Crear dos nuevos secretos**:
   - Nombre: `CLOUDFLARE_ACCOUNT_ID` ? Valor: (tu Account ID de Cloudflare)
   - Nombre: `CLOUDFLARE_API_TOKEN` ? Valor: (tu API Token de Cloudflare)

? Los secretos están protegidos y no se expondrán en logs.

---

## ?? Paso 2: Crear Proyecto en Cloudflare Pages

1. **Ir a Cloudflare Pages**: https://pages.cloudflare.com
2. **Crear un nuevo proyecto** ? **Conectar con Git**
3. **Seleccionar repositorio**: `fb10-uy/ProyectoUCU`
4. **Configurar build settings**:
   - **Rama de producción**: `main`
   - **Comando de build**: (dejarlo vacío, GitHub Actions se encargará)
   - **Directorio de salida**: `ProyectoFlor/publish/wwwroot`
5. **Crear sitio**

Cloudflare generará automáticamente una URL como: `proyecto-ucu.pages.dev`

---

## ?? Paso 3: Hacer el Primer Deploy

### Opción A: Automatizado (recomendado)

Simplemente hacer un push a la rama `main`:

```bash
cd "C:\Users\Fran\source\repos\ProyectoFlor"
git add .
git commit -m "feat: preparar para Cloudflare Pages"
git push origin main
```

GitHub Actions ejecutará automáticamente:
1. Checkout del código
2. Setup de .NET 8
3. Build del proyecto
4. Publicación a `/publish/wwwroot`
5. Upload a Cloudflare Pages

**Monitorear deploy**:
- Ve a tu repositorio ? **Actions**
- Verifica el estado del workflow "Deploy to Cloudflare Pages"
- Una vez completado, tu sitio estará live en `https://proyecto-ucu.pages.dev`

### Opción B: Manual (para testing local)

```bash
cd "C:\Users\Fran\source\repos\ProyectoFlor\ProyectoFlor"
dotnet restore
dotnet publish -c Release -o ../publish
# Los archivos estarán en: ProyectoFlor/publish/wwwroot
```

---

## ?? Configurar Dominio Personalizado (opcional)

1. **En Cloudflare Pages** ? Tu proyecto ? **Custom domains**
2. **Agregar tu dominio** (si tienes uno apuntado a Cloudflare)
3. O simplemente usa la URL gratuita: `proyecto-ucu.pages.dev`

---

## ??? Solucionar Problemas

### ? Error: "CLOUDFLARE_API_TOKEN no existe"
**Solución**: Verificar que agregaste los secretos correctamente en GitHub Settings ? Secrets.

### ? Error: "404 Not Found" después del deploy
**Solución**: Cloudflare necesita la regla de rewrite para SPA. Verificar:
- Archivo `_redirects` en `wwwroot/` contiene: `/* /index.html 200`
- O usar `wrangler.toml` con rewrite rules

### ? Build falla en GitHub Actions
**Solución**: 
- Verificar que el comando `dotnet publish` funciona localmente
- Revisar logs en GitHub Actions ? workflow ? job ? step output
- Asegurarse que `.gitignore` no excluye archivos necesarios

### ? Sitio muestra "Service Worker Error"
**Solución**: 
- Service Worker en desarrollo puede fallar en Cloudflare
- Verificar en navegador ? DevTools ? Application ? Service Workers
- Borrar caché y recargar (Ctrl+Shift+R)

---

## ?? Monitorear Deployments

### GitHub Actions
```
https://github.com/fb10-uy/ProyectoUCU/actions
```

### Cloudflare Pages Dashboard
```
https://pages.cloudflare.com/
```

---

## ?? Notas Importantes

- **Blazor WebAssembly** se compila a archivos estáticos (HTML, JS, CSS, WASM)
- **No necesitas servidor .NET** — todo corre en el navegador del cliente
- **Cloudflare Pages es gratuito** con builds ilimitados
- **El dominio `*.pages.dev` es gratis** — agregar dominio personalizado también es gratis si está en Cloudflare

---

## ?? Flujo de Desarrollo

1. Hacer cambios locales
2. Commit y push a `main`
3. GitHub Actions automatiza el build
4. Cloudflare Pages despliega en segundos
5. Sitio live en `https://proyecto-ucu.pages.dev`

---

## ?? Referencias

- [Cloudflare Pages Docs](https://developers.cloudflare.com/pages/)
- [Blazor WebAssembly Hosting](https://learn.microsoft.com/en-us/aspnet/core/blazor/host-and-deploy/webassembly)
- [GitHub Actions Docs](https://docs.github.com/en/actions)

---

**¿Necesitas ayuda?** Contacta al equipo de desarrollo o revisa los logs en GitHub Actions.
