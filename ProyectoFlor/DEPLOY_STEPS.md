# ? CHECKLIST: Deploy Cloudflare Pages - Próximos Pasos

## Estado Actual
- ? Repositorio en GitHub: `fb10-uy/ProyectoUCU`
- ? Rama principal: `main` (renombrada de `master`)
- ? Código empujado a GitHub
- ? GitHub Actions workflow configurado
- ? Archivos de configuración listos

---

## ?? PRÓXIMOS PASOS (Hazlos en orden)

### 1?? Configurar Secretos en GitHub (5 minutos)
**Ir a**: https://github.com/fb10-uy/ProyectoUCU/settings/secrets/actions

**Crear 2 secretos nuevos**:

| Nombre | Obtener de |
|--------|-----------|
| `CLOUDFLARE_ACCOUNT_ID` | Cloudflare Dashboard ? Cuenta ? Sinopsis ? Account ID |
| `CLOUDFLARE_API_TOKEN` | Cloudflare Dashboard ? Mi Perfil ? Tokens de API ? Crear Token |

**Pasos detallados en**: `ProyectoFlor/CLOUDFLARE_SETUP.md`

---

### 2?? Crear Proyecto en Cloudflare Pages (3 minutos)
**Ir a**: https://pages.cloudflare.com

**Acciones**:
1. Crear nuevo proyecto ? "Conectar con Git"
2. Seleccionar repositorio: `fb10-uy/ProyectoUCU`
3. Rama de producción: `main`
4. Directorio de salida: `ProyectoFlor/publish/wwwroot`
5. Crear sitio

**Resultado**: Cloudflare generará una URL como `proyecto-ucu.pages.dev`

---

### 3?? Trigger Primer Deploy (1 minuto)
**Opción A - Automática (recomendado)**:
```bash
cd "C:\Users\Fran\source\repos\ProyectoFlor"
git add .
git commit -m "feat: trigger primer deploy"
git push origin main
```

**Opción B - Manual**: Esperar a que GitHub Actions se dispare automáticamente en el próximo push.

---

### 4?? Monitorear Deploy
**GitHub Actions**: https://github.com/fb10-uy/ProyectoUCU/actions
- Ver workflow "Deploy to Cloudflare Pages"
- Esperar a que termine (2-3 minutos)
- Verificar status = ? verde

**Cloudflare Pages**: https://pages.cloudflare.com
- Ver logs de build
- Verificar deployment status

---

### 5?? Verificar Sitio Live
Una vez completado el deploy:
1. Ir a tu URL: `https://proyecto-ucu.pages.dev` (o tu dominio personalizado)
2. Verificar que la app carga correctamente
3. Probar navegación y funcionalidades

---

## ?? Solucionar Problemas Comunes

### ? Workflow falla: "Secret CLOUDFLARE_API_TOKEN not found"
? Verificar que agregaste correctamente los secretos en GitHub Settings

### ? Deploy falla: "404 Not Found"
? Verificar que el archivo `_redirects` existe en `ProyectoFlor/wwwroot/`

### ? Sitio muestra "Service Worker error"
? Ir a DevTools ? Application ? Service Workers ? Desregistrar y recargar página

### ? Rama `master` aún existe en remoto
? Ejecutar: `git push origin --delete master`

---

## ?? Documentación

- **Setup completo**: `ProyectoFlor/CLOUDFLARE_SETUP.md`
- **Deployment notes**: `ProyectoFlor/DEPLOYMENT.md`
- **Conversion notes**: `ProyectoFlor/CONVERSION_NOTES.md`

---

## ?? ¡Listo!

Una vez completados estos pasos, tu sitio estará:
- ? Desplegado en Cloudflare Pages (gratis)
- ? Con builds automatizados (GitHub Actions)
- ? HTTPS seguro
- ? CDN global de Cloudflare
- ? Actualizaciones automáticas en cada push a `main`

**Tiempo total**: ~15 minutos

---

**¿Necesitas ayuda?** Revisa los logs en GitHub Actions o Cloudflare Dashboard.
