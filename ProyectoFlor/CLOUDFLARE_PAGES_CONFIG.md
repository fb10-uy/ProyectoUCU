# ?? Configurar Cloudflare Pages - Pasos Exactos

**Importante**: Este archivo te guía para configurar Cloudflare Pages correctamente. Sin estos pasos, el deploy fallará.

---

## ?? Configuración en Cloudflare Pages

### Paso 1: Ve a tu proyecto en Cloudflare Pages

URL: https://pages.cloudflare.com

Selecciona tu proyecto `proyecto-ucu` (o el nombre que hayas puesto).

---

### Paso 2: Ir a Settings ? Build & deploy

En el menú de tu proyecto:
1. Haz clic en **Settings**
2. En el menú izquierdo, haz clic en **Build & deploy**

---

### Paso 3: Configurar Build settings

**IMPORTANTE**: Estos valores deben coincidir exactamente.

#### Framework preset
- Selecciona: **None** (no uses ningún preset)

#### Build command
- **Dejar VACÍO** (no escribas nada)
- GitHub Actions ejecutará `dotnet publish` automáticamente

#### Build output directory
- Escribe exactamente: `ProyectoFlor/publish/wwwroot`
- (Sin barras al inicio ni final)

**Haz clic en "Save"**

---

### Paso 4: Verificar que NO hay Deploy command personalizado

En la misma página, busca la sección **Deploy command** o **Custom deploy command**.

- Si existe y tiene `npx wrangler deploy`, **BÓRRALO**.
- Si el campo está vacío, está bien.
- Si existe y dice algo como `npm run deploy`, **BÓRRALO también**.

**Haz clic en "Save"**

---

## ? Verificar la Configuración

Después de guardar, deberías ver algo así:

```
Build settings:
??? Framework preset: None
??? Build command: (blank)
??? Build output directory: ProyectoFlor/publish/wwwroot

Deploy on push:
??? Branch: main
```

---

## ?? Trigger el Deploy

Una vez configurado, ejecuta:

```powershell
cd "C:\Users\Fran\source\repos\ProyectoFlor"
git add .
git commit -m "fix: actualizar workflow y configuración Cloudflare Pages"
git push origin main
```

Esto dispará automáticamente:
1. GitHub Actions ejecuta `.github/workflows/cloudflare-deploy.yml`
2. Build y publish de .NET
3. Upload a Cloudflare Pages
4. Deploy en `https://proyecto-ucu.pages.dev`

---

## ?? Monitorear el Deploy

**GitHub Actions**: https://github.com/fb10-uy/ProyectoUCU/actions
- Busca el workflow "Deploy to Cloudflare Pages"
- Verifica que todos los steps estén en verde ?

**Cloudflare Pages**: https://pages.cloudflare.com
- Selecciona tu proyecto
- Busca la sección "Deployments"
- Debería decir "Success" o "Active"

---

## ? Si sigue fallando...

1. **Revisa GitHub Actions logs** (copia el paso que falla y pégalo aquí)
2. **Verifica que los secrets existen**:
   - GitHub repo ? Settings ? Secrets and variables ? Actions
   - Debe haber: `CLOUDFLARE_ACCOUNT_ID` y `CLOUDFLARE_API_TOKEN`
3. **Comprueba localmente que el build funciona**:
   ```powershell
   cd "C:\Users\Fran\source\repos\ProyectoFlor\ProyectoFlor"
   dotnet restore
   dotnet publish -c Release -o ../publish
   dir ..\publish\wwwroot
   ```
   Debe haber archivos (index.html, .wasm, css, etc.)

---

## ?? Notas Importantes

- ? **NO** uses Deploy command personalizado en Cloudflare Pages (eso causaba el error "wrangler not found")
- ? **SÍ** usa GitHub Actions para todo (build + deploy)
- ? GitHub Actions tiene .NET instalado, Cloudflare Pages no
- ? La acción `cloudflare/pages-action` se encarga de subir los archivos

---

**¿Listo? Haz la configuración en Cloudflare Pages y luego ejecuta el git push.**
